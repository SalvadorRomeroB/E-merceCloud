//
//  SegueRightToLeft.swift
//  E-merceCloud
//
//  Created by Christopher Delgado on 5/9/19.
//  Copyright © 2019 Tlaloc Studio. All rights reserved.
//

import UIKit

class SegueRightToLeft: UIStoryboardSegue {
    
    override func perform() {
        let src = self.source
        let dst = self.destination
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        src.view.window?.layer.add(transition, forKey: nil)
        src.present(dst, animated: false, completion: nil)
    }
}
