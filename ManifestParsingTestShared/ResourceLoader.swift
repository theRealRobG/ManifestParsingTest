import Foundation
import AVFoundation

private let manifestData = """
#EXTM3U
#EXT-X-VERSION:7
#EXT-X-INDEPENDENT-SEGMENTS
#EXT-X-SESSION-KEY:METHOD=SAMPLE-AES,KEYFORMAT="com.apple.streamingkeydelivery",URI="skd://0017c5c4-3a65-bd18-d6a2-7dff96e2a851",KEYFORMATVERSIONS="1"

# Adding in data to extract later to prove manifest parsing complete
#EXT-X-SESSION-DATA:DATA-ID="manifest.parsing.test.id",VALUE="expected"

#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="aac_stereo",NAME="English",LANGUAGE="en",AUTOSELECT=YES,DEFAULT=YES,URI="xxx://fake_audio.m3u8",CHANNELS="2"
#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="english",AUTOSELECT=YES,FORCED=NO,LANGUAGE="en",URI="xxx://fake_subs.m3u8"
#EXT-X-MEDIA:TYPE=CLOSED-CAPTIONS,GROUP-ID="cc1",LANGUAGE="en",NAME="english",DEFAULT=NO,AUTOSELECT=YES,INSTREAM-ID="SERVICE1"

#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=2125000,AVERAGE-BANDWIDTH=1894000,RESOLUTION=960x540,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.4d401f,mp4a.40.2",AUDIO="aac_stereo"
xxx://fake_video/960x540.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=8569000,AVERAGE-BANDWIDTH=7506000,RESOLUTION=1920x1080,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.640028,mp4a.40.2",AUDIO="aac_stereo"
xxx://fake_video/1920x1080.m3u8
""".data(using: .utf8)!

private let mediaPlaylistData = """
#EXTM3U
#EXT-X-TARGETDURATION:10
#EXT-X-VERSION:3
#EXTINF:9.009,
http://media.example.com/first.ts
#EXTINF:9.009,
http://media.example.com/second.ts
#EXTINF:3.003,
http://media.example.com/third.ts
#EXT-X-ENDLIST
""".data(using: .utf8)!

protocol ResourceLoaderDelegate: AnyObject {
    func resourceLoaderDidStartDispatchGlobal()
    func resourceLoaderDidCompleteDispatchGlobal()
}

class ResourceLoader: NSObject, AVAssetResourceLoaderDelegate {
    weak var delegate: ResourceLoaderDelegate?

    private let testURL: URL
    private let loaderQueue = DispatchQueue(label: "asset-loader-queue", qos: .userInteractive)

    init(testURL: URL) {
        self.testURL = testURL
    }

    func resourceLoader(
        _ resourceLoader: AVAssetResourceLoader,
        shouldWaitForLoadingOfRequestedResource loadingRequest: AVAssetResourceLoadingRequest
    ) -> Bool {
        if loadingRequest.request.url?.scheme == "xxx" {
            delegate?.resourceLoaderDidStartDispatchGlobal()
            loaderQueue.async { [weak self] in
                self?.delegate?.resourceLoaderDidCompleteDispatchGlobal()
                loadingRequest.dataRequest?.respond(with: mediaPlaylistData)
                loadingRequest.finishLoading()
            }
            return true
        }
        guard loadingRequest.request.url == testURL else {
            loaderQueue.async {
                loadingRequest.finishLoading(with: LoadingFailure.unexpectedURL)
            }
            return true
        }
        delegate?.resourceLoaderDidStartDispatchGlobal()
        loaderQueue.async { [weak self] in
            self?.delegate?.resourceLoaderDidCompleteDispatchGlobal()
            loadingRequest.dataRequest?.respond(with: manifestData)
            loadingRequest.finishLoading()
        }
        return true
    }
}
