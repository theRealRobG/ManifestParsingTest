//
//  ViewController.swift
//  ManifestParsingTest
//
//  Created by 206656671 on 26/01/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var testMagnitudeInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        testMagnitudeInput.keyboardType = .numberPad
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        view.addGestureRecognizer(tapGesture)
    }

    @IBAction func onRunTouched(_ sender: Any) {
        defer {
            DispatchQueue.main.async { [weak self] in
                self?.durationLabel.sizeToFit()
            }
        }
        guard let magnitude = testMagnitudeInput.text.flatMap({ Int($0) }) else {
            durationLabel.text = "Positive integer necessary."
            return
        }
        durationLabel.text = "Running..."
        TestRunner(testMagnitude: magnitude).run { result in
            switch result {
            case .success(let result):
                DispatchQueue.main.async { [weak self] in
                    let line1 = "Long: \(result.longManifestParsingTime.rounded(decimals: 5))"
                    let line2 = "Short: \(result.shortManifestParsingTime.rounded(decimals: 5))"
                    let line3 = "Avg. Diff: \(result.averageDifference.rounded(decimals: 5))"
                    self?.durationLabel.text = "\(line1)\n\(line2)\n\(line3)"
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.durationLabel.text = "\(error)"
                }
            }
        }
    }

    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        testMagnitudeInput.resignFirstResponder()
    }
}
