//
//  passwordStrengthService.swift
//  password strength meter
//
//  Created by Omar Diab on on 9/17/21.
//

import Foundation

let REGEX_PASSWORD_ONE_UPPERCASE = "^(?=.*[A-Z]).*$"
let REGEX_PASSWORD_ONE_LOWERCASE = "^(?=.*[a-z]).*$"
let REGEX_PASSWORD_ONE_NUMBER = "^(?=.*[0-9]).*$"
let REGEX_PASSWORD_ONE_SYMBOL = "^(?=.*[-_]).*$"

public enum PasswordStrengthType {
    case weak, moderate, strong
}

@objc open class passwordStrengthService: NSObject{
    
    static let singletonInstance = passwordStrengthService()
    
    public func checkPasswordStrength(_ password: String?) -> PasswordStrengthType {
        
        let len = password?.count ?? 0
        var strength = 0

        if len == 0 {
            return PasswordStrengthType.weak
        } else if len <= 5 {
            strength += 1
        } else if len <= 10 {
            strength += 2
        } else {
            strength += 3
        }

        strength += validate(password, withPattern: REGEX_PASSWORD_ONE_UPPERCASE, caseSensitive: true)
        strength += validate(password, withPattern: REGEX_PASSWORD_ONE_LOWERCASE, caseSensitive: true)
        strength += validate(password, withPattern: REGEX_PASSWORD_ONE_NUMBER, caseSensitive: true)
        strength += validate(password, withPattern: REGEX_PASSWORD_ONE_SYMBOL, caseSensitive: true)

        if strength <= 3 {
            return PasswordStrengthType.weak
        } else if 3 < strength && strength < 6 {
            return PasswordStrengthType.moderate
        } else {
            return PasswordStrengthType.strong
        }
    }

    func validate(_ string: String?, withPattern pattern: String?, caseSensitive: Bool) -> Int {
        var regex: NSRegularExpression? = nil
        do {
            regex = try NSRegularExpression(pattern: pattern!, options: NSRegularExpression.Options(rawValue: ((caseSensitive) ? 0 : NSRegularExpression.Options.caseInsensitive.rawValue)))
        } catch {
            return 0
        }

        let textRange = NSRange(location: 0, length: string?.count ?? 0)
        let matchRange = regex?.rangeOfFirstMatch(in: string ?? "", options: .reportProgress, range: textRange)
        var didValidate = 0

        if matchRange?.location != NSNotFound {
            didValidate = 1
        }

        return didValidate
    }
}
