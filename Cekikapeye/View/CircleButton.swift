//
//  CircleButton.swift
//  Cekikapeye
//
//  Created by Ambroise COLLON on 24/05/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import UIKit

class CircleButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        addCornerRadius()
    }

    private func addCornerRadius() {
        layer.cornerRadius = bounds.width / 2
    }
}
