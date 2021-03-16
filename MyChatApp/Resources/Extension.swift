//
//  File.swift
//  MyChatApp
//
//  Created by 野澤拓己 on 2021/03/16.
//

import Foundation
import UIKit

extension UIView {
    
    public var width: CGFloat {
        return self.frame.width
    }
    
    public var height: CGFloat {
        return self.frame.height
    }
    
    public var top: CGFloat {
        return self.frame.origin.y
    }
    
    public var bottom: CGFloat {
        return height + top
    }
    
    public var left: CGFloat {
        return self.frame.origin.x
    }
    
    public var right: CGFloat {
        return left + width
    }
}

/// 3/12(金)
extension Notification.Name {
    static let didLoginNotification = Notification.Name("didLoginNotification")
}

extension UITextField {
    public func setUnderLine() {
        borderStyle = .none // 枠線を非表示にする
        let underLine = UIView()
        underLine.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: 1)
        underLine.backgroundColor = .blue
        addSubview(underLine)
        
        bringSubviewToFront(underLine)
    }

}
