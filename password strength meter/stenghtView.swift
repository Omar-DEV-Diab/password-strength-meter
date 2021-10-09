//
//  stenghtView.swift
//  password strength meter
//
//  Created by Omar Diab on 10/9/21.
//

import Foundation
import UIKit

public class StrengthMeterView: UIView {
    @IBOutlet weak var contentStack: UIStackView!
    @IBOutlet private var firstCell: UIView!
    @IBOutlet private var secondCell: UIView!
    @IBOutlet private var thirdCell: UIView!

    public func checkPasswordStrength(_ password: String!) {
        self.colorAndFillViews(passwordStrengthService.singletonInstance.checkPasswordStrength(password))
    }
    
    func colorAndFillViews(_ passwordStrengthnes: PasswordStrengthType) {
        self.clearCellsColor()

        switch passwordStrengthnes {
        case .weak:
            firstCell.backgroundColor = .red
        case .moderate:
            firstCell.backgroundColor = .orange
            secondCell.backgroundColor = .orange
        case .strong:
            firstCell.backgroundColor = .green
            secondCell.backgroundColor = .green
            thirdCell.backgroundColor = .green
        }
    }
    func clearCellsColor() {
        firstCell.backgroundColor = UIColor.clear
        secondCell.backgroundColor = UIColor.clear
        thirdCell.backgroundColor = UIColor.clear
    }
}
