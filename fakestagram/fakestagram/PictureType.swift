//
//  PictureType.swift
//  fakestagram
//
//  Created by Francisco Javier Gómez León on 18/10/25.
//

//import Foundation
import UIKit

enum PictureType{
    case dog, cat
    
    var captionedImages: [(image: UIImage, caption: String)]{
        switch self {
        case .dog:
            return [
                (UIImage.dog1, "Peluzo"),
                (UIImage(resource: .dog2), "Fido"),
                (UIImage(named: "dog-3") ?? UIImage(), "Milaneso")
            ]
        case .cat:
            return [
                (UIImage.cat1, "Milo"),
                (UIImage.cat2, "Tlacoyo"),
                (UIImage.cat3, "Frostinky")
                ]
        }
    }
}
