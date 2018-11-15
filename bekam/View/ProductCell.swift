//
//  ProductCellCollectionViewCell.swift
//  bekam
//
//  Created by Omar on 01/10/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    // ui
    @IBOutlet var image:UIImageView!
    @IBOutlet var chatButton:UIButton!
    @IBOutlet var priceLabel:PriceLabel!
    
    //model
    var product:Product! {
        didSet{
            setupImage()
            setupPriceLabel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        layer.masksToBounds = true
    }
    
    fileprivate func setupPriceLabel() {
        // price label
        let labelFactory = PriceLabelFactory.getInstance()
        let label = labelFactory.getLabel(priceLabel:priceLabel, price:product.price!, rent: false);
        priceLabel.copy(priceLabel: label)
    }
    
    fileprivate func setupImage(){
        
        // placeholder
        image.image = UIImage(named: "home")
        
        //download
        //loadImage()
    }
    
    fileprivate func loadImage(){
        
        if let urls = product.imagesURLS {
            if let url = urls[0] {
                
                ApiServices.getInstance().loadImage(url: url) { (data, error) in
                    
                    if error != nil {
                        print(error)
                    } else {
                        let imageData = UIImage(data: data!)
                        self.image.image = imageData
                    }
                }
            }
        }
    }
    
}
