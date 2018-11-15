//
//  HelperFunction.swift
//  bekam
//
//  Created by Omar on 30/09/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

public func CreateTabItem(tabName:String) -> UITabBarItem {
    
    let basename = "tab_icn"
    let activeExtention = "active"
    
    let tabItem = UITabBarItem(title: tabName, image: UIImage(named: "\(basename)_\(tabName)"), selectedImage: UIImage(named:"\(basename)_\(tabName)_\(activeExtention)"))
    
    return tabItem
    
    
}

public func getSizeOfText(text:String,fontSize:Int) -> CGSize { 

    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height:0))
    label.text = text
    label.font = UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
    label.sizeToFit()
    
    return CGSize(width: label.frame.width, height: label.frame.height)
    
}
