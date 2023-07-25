//
//  AddSubViews+Extension.swift
//  FetchAPI
//
//  Created by Kerem Demir on 25.07.2023.
//

import Foundation
import UIKit

extension UIView {
    func addSubViews(_ views: UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
