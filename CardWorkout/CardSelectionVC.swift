//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Davyd Darusenkov on 22.11.2023.
//

import UIKit

class CardSelectionVC: UIViewController {
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!

    @IBOutlet var mainButton: UIButton!

    var timer: Timer?

    var deck = Deck()

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareMainButton()

        for btn in buttons {
            btn.layer.cornerRadius = 8
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopTimer()
        
        print("will disappear")
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func toggleTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(
                timeInterval: 0.1,
                target: self,
                selector: #selector(showRandomImage),
                userInfo: nil,
                repeats: true
            )
        } else {
            stopTimer()
        }
    }

    private func prepareMainButton() {
        mainButton.tintColor = .white
//        mainButton.setFont
        if timer != nil {
            mainButton.backgroundColor = .red
            mainButton.setTitle("Stop!", for: .normal)
        } else {
            mainButton.backgroundColor = .systemPurple
            mainButton.setTitle("Start!", for: .normal)
        }
    }

    @objc func showRandomImage() {
        cardImageView.image = deck.pickRandomCard()
    }

    @IBAction func mainButtonTapped(_ sender: UIButton) {
        toggleTimer()
        prepareMainButton()
    }

    @IBAction func pickButtonTapped(_ sender: UIButton) {
        cardImageView.image = deck.pickRandomCard()
        if timer != nil {
            stopTimer()
        }
        prepareMainButton()
    }
}
