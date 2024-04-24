//
//  Extentions.swift
//  Instagram
//
//  Created by 垰野亮 on 4/23/24.
//

import UIKit

extension UIView{
    var width: CGFloat{
        return frame.size.width
    }
    var height: CGFloat{
        return frame.size.height
    }
    var top: CGFloat{
        return frame.origin.y
    }
    var bottom: CGFloat{
        return frame.origin.y + frame.size.height
    }
    var left: CGFloat{
        return frame.origin.x
    }
    var right: CGFloat{
        return frame.origin.x + frame.size.width
    }
    
}

extension String{
    func safeDatabaseKey() -> String{
        return self.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
    }
}
