//
//  RulesVC.swift
//  CardWorkout
//
//  Created by Davyd Darusenkov on 22.11.2023.
//

import UIKit

class RulesVC: UIViewController {
//    @IBOutlet var okButton: UIButton!
    var count = 0

    @IBOutlet var counterButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func counterButtonTapped(_ sender: UIButton) {
        count += 1

        sender.setTitle("Count: \(count)", for: .normal)
    }

    @IBAction func okButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }

    private func incrementCount() {
        count += 1
    }
}
