//
//  ZDToast.swift
//  SwiftText
//
//  Created by Macbook on 2018/1/11.
//  Copyright © 2018年 Macbook. All rights reserved.
//

import UIKit

var contentView = UIButton()
var textLabel = UILabel()


class ZDToast: NSObject {

    init(text:String) {
        print(text)
        let mycgfloat:CGFloat = text.heightWithConstrainedWidth(width: 250, font:UIFont.boldSystemFont(ofSize: 14))
        textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: mycgfloat+20))
        textLabel.backgroundColor = UIColor.clear
        textLabel.textColor = UIColor.white
        textLabel.textAlignment = NSTextAlignment.center
        textLabel.font = UIFont.boldSystemFont(ofSize: 14)
        textLabel.text = text
        textLabel.numberOfLines = 0
        contentView = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height:textLabel.frame.size.height))
        contentView.backgroundColor = UIColor.black
        contentView.layer.cornerRadius = 5
        contentView.alpha = 0
//        contentView.titleLabel?.text = text
//        contentView.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//        contentView.setTitleColor(UIColor.white, for: .normal)
//        contentView.setTitle(text, for: .normal)
        contentView.addSubview(textLabel)
    }
    
    fileprivate func showin(_ view:UIView)
    {
        contentView.center = view.center
        view.addSubview(contentView)
        //出现
        self.showAnimation()
        //消失
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(UInt64(3) * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)) {
            
            self.hideAnimation()
        }
    }
    fileprivate func showAnimation()
    {
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            contentView.alpha = 0.6
        }, completion: { (completion) in
            
        })
    }
    fileprivate  func hideAnimation() {
        
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {

            contentView.alpha = 0.0
            
        }) { (completion) in
            
        }
    }
    
}
extension UIView
{
    public func showview(_ text:String)
    {
        let toast: ZDToast = ZDToast(text: text)
        toast.showin(self)
    }
}
extension String {
    
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return boundingBox.height
    }
}
extension NSAttributedString {
    func heightWithConstrainedWidth(width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return boundingBox.height
    }
    
    func widthWithConstrainedHeight(height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return boundingBox.width
    }
}
