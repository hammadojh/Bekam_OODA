//
//  ProductDetailsController.swift
//  bekam
//
//  Created by Omar on 01/11/2018.
//  Copyright © 2018 Omar. All rights reserved.
//

import UIKit

class ProductDetailsController: UIViewController {
    
    //model
    var product:Product?
    
    // ui
    @IBOutlet weak var sellerImageView: UIImageView!
    @IBOutlet weak var letsChatButton: UIButton!
    @IBOutlet weak var priceLabel: PriceLabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var mapImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    fileprivate func setupData(){
        
        if let product = self.product {
            
            // bg view
            productImageView.image = UIImage(named: "home")
            loadBGImage()
            
            // user img
            sellerImageView.image = UIImage(named: "car")
            loadUserImage()
            
            //price
            priceLabel.text = getPriceLabelString(price:product.price!)
            
            //title
            
            if let name = product.name {
                
                if name != "" {
                    self.productTitle.text = name
                }else{
                    removeTitle()
                }
                
            }else{
                removeDescription()
            }
            
            // Description
            
            if let desc = product.description {
                
                if desc != "" {
                    self.productDescription.text = desc
                }else{
                    removeDescription()
                }
                
            }else{
                removeDescription()
            }
            
            // city
            
            self.cityLabel.text = getCity() // TODO:Change later
            
            //  kms
            
            self.kmLabel.text = getHowFar()
            
        }
        
    }
    
    fileprivate func setupUI(){
        
        // lets chat button
        letsChatButton.backgroundColor = primaryColor
        letsChatButton.layer.cornerRadius = letsChatButton.frame.height/2
        
        // profile image
        sellerImageView.layer.cornerRadius = sellerImageView.frame.height/2
        sellerImageView.layer.masksToBounds = true
        
        // map view
        mapImageView.layer.cornerRadius = 15
        mapImageView.backgroundColor = greyColor_0
        
        
    }

    @IBAction func letsChatClicked(_ sender: Any) {
    
    }
    
    @IBAction func closeClicked(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    ////////////////////// PRIVATE HELPING FUNCTIONS ////////////////////
    
    
    fileprivate func loadBGImage(){
        
        let url = product?.imagesURLS?[0]!
        
        ApiServices.getInstance().loadImage(url: url!) { (data, error) in
            
            if(error == nil){
                
                let image = UIImage(data: data!)
                self.productImageView.image = image
                
            }else{
                print(error)
            }
            
        }
        
    }
    
    fileprivate func loadUserImage(){
        
        let url = product?.imagesURLS?[0]!
        
        ApiServices.getInstance().loadImage(url: (product?.imagesURLS?[0])!) { (data, error) in
            
            if(error == nil){
                
                let image = UIImage(data: data!)
                self.productImageView.image = image
                
            }else{
                print(error)
            }
            
        }
        
    }
    
    fileprivate func getPriceLabelString(price:Double) -> String {
        
        if price == 0 {
            return "  😍Free  "
        }else{
            return "$\(Int(price))"
        }
        
    }
    
    fileprivate func removeDescription(){
        
    }
    
    fileprivate func removeTitle(){
        
    }
    
    fileprivate func getCity() -> String {
        return "Boulder"
    }
    
    fileprivate func getHowFar() -> String {
        return "15KM away"
    }
}
