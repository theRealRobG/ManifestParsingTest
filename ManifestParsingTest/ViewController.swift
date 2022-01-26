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
        guard let magnitude = testMagnitudeInput.text.flatMap({ Int($0) }) else {
            durationLabel.text = "Positive integer necessary."
            return
        }
        durationLabel.text = "Running..."
        TestRunner(testMagnitude: magnitude).run { result in
            switch result {
            case .success(let result):
                DispatchQueue.main.async { [weak self] in
                    self?.durationLabel.text = result.formattedMessage
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
