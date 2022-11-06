//
//  AppColors.swift
//  CarbonStream
//
//  Created by Adjogbe  Tejiri on 30/10/2022.
//

import UIKit

extension UIColor {
    static let appPrimary = UIColor(named: "appPrimary")
    static let appPrimaryLight = UIColor(named: "appPrimaryLight")
    static let appOffWhite = UIColor(named: "appOffWhite")
    static let appLightGrey = UIColor(named: "appLightGrey")
    static let appGrey = UIColor(named: "appGrey")
}

extension UIColor {
    /// Returns color from its hex string
    ///
    /// - Parameter hexString: the color hex string
    /// - Returns: UIColor
      static func fromHex(hexString: String) -> UIColor {
      let hex = hexString.trimmingCharacters(
        in: CharacterSet.alphanumerics.inverted)
      var int = UInt32()
      Scanner(string: hex).scanHexInt32(&int)
      let a, r, g, b: UInt32
      switch hex.count {
      case 3: // RGB (12-bit)
        (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
      case 6: // RGB (24-bit)
        (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
      case 8: // ARGB (32-bit)
        (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
      default:
        return UIColor.clear
      }
      
      return UIColor(
        red: CGFloat(r) / 255,
        green: CGFloat(g) / 255,
        blue: CGFloat(b) / 255,
        alpha: CGFloat(a) / 255)
    }
}
