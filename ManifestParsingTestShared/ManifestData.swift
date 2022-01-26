import Foundation

struct ManifestData {
    static let longManifestData = _longManifestData
    static let shortManifestData = _shortManifestData
    static let mediaPlaylistData = _mediaPlaylistData
}

private let _longManifestData = """
#EXTM3U
#EXT-X-VERSION:7
#EXT-X-INDEPENDENT-SEGMENTS

# Adding in data to extract later to prove manifest parsing complete
#EXT-X-SESSION-DATA:DATA-ID="manifest.parsing.test.id",VALUE="expected"

#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="eac3",NAME="English",LANGUAGE="en-US",AUTOSELECT=YES,DEFAULT=YES,URI="xxx://fake.com/audio/surround/en-US/r0/layer_surround_cmaf_0.m3u8",CHANNELS="6"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="eac3",NAME="English Audio Description",LANGUAGE="en-US-ad",AUTOSELECT=YES,DEFAULT=NO,URI="xxx://fake.com/audio/surround/en-US-ad/r0/layer_surround_cmaf_2.m3u8",CHANNELS="6",CHARACTERISTICS="public.accessibility.describes-video"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="eac3",NAME="Czech",LANGUAGE="cs-CZ",AUTOSELECT=YES,DEFAULT=NO,URI="xxx://fake.com/audio/surround/cs-CZ/r0/layer_surround_cmaf_3.m3u8",CHANNELS="6"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="eac3",NAME="Czech Audio Description",LANGUAGE="cs-CZ-ad",AUTOSELECT=YES,DEFAULT=NO,URI="xxx://fake.com/audio/surround/cs-CZ-ad/r0/layer_surround_cmaf_5.m3u8",CHANNELS="6",CHARACTERISTICS="public.accessibility.describes-video"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="eac3",NAME="Danish",LANGUAGE="da-DK",AUTOSELECT=YES,DEFAULT=NO,URI="xxx://fake.com/audio/surround/da-DK/r0/layer_surround_cmaf_6.m3u8",CHANNELS="6"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="eac3",NAME="Danish Audio Description",LANGUAGE="da-DK-ad",AUTOSELECT=YES,DEFAULT=NO,URI="xxx://fake.com/audio/surround/da-DK-ad/r0/layer_surround_cmaf_8.m3u8",CHANNELS="6",CHARACTERISTICS="public.accessibility.describes-video"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="eac3",NAME="Spanish",LANGUAGE="es-ES",AUTOSELECT=YES,DEFAULT=NO,URI="xxx://fake.com/audio/surround/es-ES/r0/layer_surround_cmaf_9.m3u8",CHANNELS="6"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="eac3",NAME="Spanish Audio Description",LANGUAGE="es-ES-ad",AUTOSELECT=YES,DEFAULT=NO,URI="xxx://fake.com/audio/surround/es-ES-ad/r0/layer_surround_cmaf_11.m3u8",CHANNELS="6",CHARACTERISTICS="public.accessibility.describes-video"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="eac3",NAME="Polish",LANGUAGE="pl-PL",AUTOSELECT=YES,DEFAULT=NO,URI="xxx://fake.com/audio/surround/pl-PL/r0/layer_surround_cmaf_12.m3u8",CHANNELS="6"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="eac3",NAME="Polish Audio Description",LANGUAGE="pl-PL-ad",AUTOSELECT=YES,DEFAULT=NO,URI="xxx://fake.com/audio/surround/pl-PL-ad/r0/layer_surround_cmaf_14.m3u8",CHANNELS="6",CHARACTERISTICS="public.accessibility.describes-video"

#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="aac_stereo",NAME="English",LANGUAGE="en-US",AUTOSELECT=YES,DEFAULT=YES,URI="xxx://fake.com/audio/stereo/en-US/r0/layer_stereo_cmaf_1.m3u8",CHANNELS="2"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="aac_stereo",NAME="English Audio Description",LANGUAGE="en-US-ad",AUTOSELECT=YES,DEFAULT=NO,URI="xxx://fake.com/audio/stereo/en-US-ad/r0/layer_stereo_cmaf_2.m3u8",CHANNELS="2",CHARACTERISTICS="public.accessibility.describes-video"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="aac_stereo",NAME="Czech",LANGUAGE="cs-CZ",AUTOSELECT=YES,DEFAULT=NO,URI="xxx://fake.com/audio/stereo/cs-CZ/r0/layer_stereo_cmaf_4.m3u8",CHANNELS="2"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="aac_stereo",NAME="Czech Audio Description",LANGUAGE="cs-CZ-ad",AUTOSELECT=YES,DEFAULT=NO,URI="xxx://fake.com/audio/stereo/cs-CZ-ad/r0/layer_stereo_cmaf_5.m3u8",CHANNELS="2",CHARACTERISTICS="public.accessibility.describes-video"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="aac_stereo",NAME="Danish",LANGUAGE="da-DK",AUTOSELECT=YES,DEFAULT=NO,URI="xxx://fake.com/audio/stereo/da-DK/r0/layer_stereo_cmaf_7.m3u8",CHANNELS="2"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="aac_stereo",NAME="Danish Audio Description",LANGUAGE="da-DK-ad",AUTOSELECT=YES,DEFAULT=NO,URI="xxx://fake.com/audio/stereo/da-DK-ad/r0/layer_stereo_cmaf_8.m3u8",CHANNELS="2",CHARACTERISTICS="public.accessibility.describes-video"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="aac_stereo",NAME="Spanish",LANGUAGE="es-ES",AUTOSELECT=YES,DEFAULT=NO,URI="xxx://fake.com/audio/stereo/es-ES/r0/layer_stereo_cmaf_10.m3u8",CHANNELS="2"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="aac_stereo",NAME="Spanish Audio Description",LANGUAGE="es-ES-ad",AUTOSELECT=YES,DEFAULT=NO,URI="xxx://fake.com/audio/stereo/es-ES-ad/r0/layer_stereo_cmaf_11.m3u8",CHANNELS="2",CHARACTERISTICS="public.accessibility.describes-video"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="aac_stereo",NAME="Polish",LANGUAGE="pl-PL",AUTOSELECT=YES,DEFAULT=NO,URI="xxx://fake.com/audio/stereo/pl-PL/r0/layer_stereo_cmaf_13.m3u8",CHANNELS="2"
#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="aac_stereo",NAME="Polish Audio Description",LANGUAGE="pl-PL-ad",AUTOSELECT=YES,DEFAULT=NO,URI="xxx://fake.com/audio/stereo/pl-PL-ad/r0/layer_stereo_cmaf_14.m3u8",CHANNELS="2",CHARACTERISTICS="public.accessibility.describes-video"

#EXT-X-SESSION-KEY:METHOD=SAMPLE-AES,KEYFORMAT="com.apple.streamingkeydelivery",URI="skd://000585af-8371-d749-cf5c-483a858fa162",KEYFORMATVERSIONS="1"

#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=2219000,AVERAGE-BANDWIDTH=2026000,RESOLUTION=960x540,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.4d401f,ec-3",AUDIO="eac3"
xxx://fake.com/video/sdr/avc/r0/1850k_cmaf/1850k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=8509000,AVERAGE-BANDWIDTH=7935000,RESOLUTION=1920x1080,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.640028,ec-3",AUDIO="eac3",HDCP-LEVEL=TYPE-1
xxx://fake.com/video/sdr/avc/r0/7830k_cmaf/7830k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=5369000,AVERAGE-BANDWIDTH=4984000,RESOLUTION=1280x720,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.64001f,ec-3",AUDIO="eac3",HDCP-LEVEL=TYPE-1
xxx://fake.com/video/sdr/avc/r0/4830k_cmaf/4830k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=3414000,AVERAGE-BANDWIDTH=3176000,RESOLUTION=960x540,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.64001f,ec-3",AUDIO="eac3"
xxx://fake.com/video/sdr/avc/r0/3000k_cmaf/3000k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=1150000,AVERAGE-BANDWIDTH=1049000,RESOLUTION=768x432,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.4d401e,ec-3",AUDIO="eac3"
xxx://fake.com/video/sdr/avc/r0/860k_cmaf/860k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=589000,AVERAGE-BANDWIDTH=544000,RESOLUTION=512x288,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.4d4015,ec-3",AUDIO="eac3"
xxx://fake.com/video/sdr/avc/r0/350k_cmaf/350k_cmaf.m3u8

#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=2126000,AVERAGE-BANDWIDTH=1932000,RESOLUTION=960x540,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.4d401f,mp4a.40.2",AUDIO="aac_stereo"
xxx://fake.com/video/sdr/avc/r0/1850k_cmaf/1850k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=8416000,AVERAGE-BANDWIDTH=7841000,RESOLUTION=1920x1080,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.640028,mp4a.40.2",AUDIO="aac_stereo",HDCP-LEVEL=TYPE-1
xxx://fake.com/video/sdr/avc/r0/7830k_cmaf/7830k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=5276000,AVERAGE-BANDWIDTH=4890000,RESOLUTION=1280x720,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.64001f,mp4a.40.2",AUDIO="aac_stereo",HDCP-LEVEL=TYPE-1
xxx://fake.com/video/sdr/avc/r0/4830k_cmaf/4830k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=3321000,AVERAGE-BANDWIDTH=3082000,RESOLUTION=960x540,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.64001f,mp4a.40.2",AUDIO="aac_stereo"
xxx://fake.com/video/sdr/avc/r0/3000k_cmaf/3000k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=1057000,AVERAGE-BANDWIDTH=955000,RESOLUTION=768x432,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.4d401e,mp4a.40.2",AUDIO="aac_stereo"
xxx://fake.com/video/sdr/avc/r0/860k_cmaf/860k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=497000,AVERAGE-BANDWIDTH=450000,RESOLUTION=512x288,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.4d4015,mp4a.40.2",AUDIO="aac_stereo"
xxx://fake.com/video/sdr/avc/r0/350k_cmaf/350k_cmaf.m3u8

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="English (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="en-US",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.0.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Albanian (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="sq-AL",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.1.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Bosnian (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="bs-BA",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.2.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Bulgarian (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="bg-BG",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.3.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Croatian (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="hr-HR",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.4.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Czech (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="cs-CZ",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.5.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Danish (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="da-DK",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.6.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Dutch (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="nl-NL",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.7.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Finnish (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="fi-FI",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.8.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Hungarian (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="hu-HU",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.9.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Norwegian (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="nb-NO",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.10.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Polish (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="pl-PL",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.11.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Portuguese (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="pt-PT",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.12.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Romanian (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="ro-RO",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.13.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Serbian (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="sr-RS",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.14.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Slovakian (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="sk-SK",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.15.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Slovenian (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="sl-SI",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.16.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Spanish (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="es-ES",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.17.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Swedish (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="sv-SE",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.18.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="French (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="fr-FR",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.19.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Forced Narrative (English)",AUTOSELECT=YES,FORCED=YES,LANGUAGE="en-US",URI="xxx://fake.com/text/fn/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.20.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Forced Narrative (Czech)",AUTOSELECT=YES,FORCED=YES,LANGUAGE="cs-CZ",URI="xxx://fake.com/text/fn/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.21.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Forced Narrative (Danish)",AUTOSELECT=YES,FORCED=YES,LANGUAGE="da-DK",URI="xxx://fake.com/text/fn/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.22.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Forced Narrative (Spanish)",AUTOSELECT=YES,FORCED=YES,LANGUAGE="es-ES",URI="xxx://fake.com/text/fn/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.23.m3u8"

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="Forced Narrative (Polish)",AUTOSELECT=YES,FORCED=YES,LANGUAGE="pl-PL",URI="xxx://fake.com/text/fn/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.24.m3u8"
#EXT-X-IMAGE-STREAM-INF:BANDWIDTH=10581,RESOLUTION=416x234,CODECS="jpeg",URI="images/416x234/pckimage.m3u8"
#EXT-X-IMAGE-STREAM-INF:BANDWIDTH=7707,RESOLUTION=336x189,CODECS="jpeg",URI="images/336x189/pckimage.m3u8"
#EXT-X-IMAGE-STREAM-INF:BANDWIDTH=4079,RESOLUTION=224x126,CODECS="jpeg",URI="images/224x126/pckimage.m3u8"
""".data(using: .utf8)!

private let _shortManifestData = """
#EXTM3U
#EXT-X-VERSION:7
#EXT-X-INDEPENDENT-SEGMENTS

# Adding in data to extract later to prove manifest parsing complete
#EXT-X-SESSION-DATA:DATA-ID="manifest.parsing.test.id",VALUE="expected"

#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="eac3",NAME="English",LANGUAGE="en-US",AUTOSELECT=YES,DEFAULT=YES,URI="xxx://fake.com/audio/surround/en-US/r0/layer_surround_cmaf_0.m3u8",CHANNELS="6"

#EXT-X-MEDIA:TYPE=AUDIO,GROUP-ID="aac_stereo",NAME="English",LANGUAGE="en-US",AUTOSELECT=YES,DEFAULT=YES,URI="xxx://fake.com/audio/stereo/en-US/r0/layer_stereo_cmaf_1.m3u8",CHANNELS="2"

#EXT-X-SESSION-KEY:METHOD=SAMPLE-AES,KEYFORMAT="com.apple.streamingkeydelivery",URI="skd://000585af-8371-d749-cf5c-483a858fa162",KEYFORMATVERSIONS="1"

#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=2219000,AVERAGE-BANDWIDTH=2026000,RESOLUTION=960x540,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.4d401f,ec-3",AUDIO="eac3"
xxx://fake.com/video/sdr/avc/r0/1850k_cmaf/1850k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=8509000,AVERAGE-BANDWIDTH=7935000,RESOLUTION=1920x1080,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.640028,ec-3",AUDIO="eac3",HDCP-LEVEL=TYPE-1
xxx://fake.com/video/sdr/avc/r0/7830k_cmaf/7830k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=5369000,AVERAGE-BANDWIDTH=4984000,RESOLUTION=1280x720,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.64001f,ec-3",AUDIO="eac3",HDCP-LEVEL=TYPE-1
xxx://fake.com/video/sdr/avc/r0/4830k_cmaf/4830k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=3414000,AVERAGE-BANDWIDTH=3176000,RESOLUTION=960x540,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.64001f,ec-3",AUDIO="eac3"
xxx://fake.com/video/sdr/avc/r0/3000k_cmaf/3000k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=1150000,AVERAGE-BANDWIDTH=1049000,RESOLUTION=768x432,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.4d401e,ec-3",AUDIO="eac3"
xxx://fake.com/video/sdr/avc/r0/860k_cmaf/860k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=589000,AVERAGE-BANDWIDTH=544000,RESOLUTION=512x288,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.4d4015,ec-3",AUDIO="eac3"
xxx://fake.com/video/sdr/avc/r0/350k_cmaf/350k_cmaf.m3u8

#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=2126000,AVERAGE-BANDWIDTH=1932000,RESOLUTION=960x540,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.4d401f,mp4a.40.2",AUDIO="aac_stereo"
xxx://fake.com/video/sdr/avc/r0/1850k_cmaf/1850k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=8416000,AVERAGE-BANDWIDTH=7841000,RESOLUTION=1920x1080,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.640028,mp4a.40.2",AUDIO="aac_stereo",HDCP-LEVEL=TYPE-1
xxx://fake.com/video/sdr/avc/r0/7830k_cmaf/7830k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=5276000,AVERAGE-BANDWIDTH=4890000,RESOLUTION=1280x720,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.64001f,mp4a.40.2",AUDIO="aac_stereo",HDCP-LEVEL=TYPE-1
xxx://fake.com/video/sdr/avc/r0/4830k_cmaf/4830k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=3321000,AVERAGE-BANDWIDTH=3082000,RESOLUTION=960x540,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.64001f,mp4a.40.2",AUDIO="aac_stereo"
xxx://fake.com/video/sdr/avc/r0/3000k_cmaf/3000k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=1057000,AVERAGE-BANDWIDTH=955000,RESOLUTION=768x432,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.4d401e,mp4a.40.2",AUDIO="aac_stereo"
xxx://fake.com/video/sdr/avc/r0/860k_cmaf/860k_cmaf.m3u8
#EXT-X-STREAM-INF:FRAME-RATE=23.976,BANDWIDTH=497000,AVERAGE-BANDWIDTH=450000,RESOLUTION=512x288,CLOSED-CAPTIONS=NONE,SUBTITLES="subs",CODECS="avc1.4d4015,mp4a.40.2",AUDIO="aac_stereo"
xxx://fake.com/video/sdr/avc/r0/350k_cmaf/350k_cmaf.m3u8

#EXT-X-MEDIA:TYPE=SUBTITLES,GROUP-ID="subs",NAME="English (CC)",AUTOSELECT=YES,FORCED=NO,LANGUAGE="en-US",URI="xxx://fake.com/text/cc/THEBOURNESUPREMACY_05593_T66086_235_ENG_51_ENG_20_2004684516.subtitles.0.m3u8"
#EXT-X-IMAGE-STREAM-INF:BANDWIDTH=10581,RESOLUTION=416x234,CODECS="jpeg",URI="images/416x234/pckimage.m3u8"
#EXT-X-IMAGE-STREAM-INF:BANDWIDTH=7707,RESOLUTION=336x189,CODECS="jpeg",URI="images/336x189/pckimage.m3u8"
#EXT-X-IMAGE-STREAM-INF:BANDWIDTH=4079,RESOLUTION=224x126,CODECS="jpeg",URI="images/224x126/pckimage.m3u8"
""".data(using: .utf8)!

private let _mediaPlaylistData = """
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