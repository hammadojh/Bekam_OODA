import UIKit
import Firebase

class ApiServices {
    
    // load any image with a given url
    
    public func loadImage(url:String,completion: @escaping (Data?,Error?)->Void){
        
        let imageService = ImageApi(url:url)
        imageService.load(completion: completion)

    }
    
    // load products
    
    public func loadProducts(completion: @escaping (DataSnapshot?,Error?)->Void){
        
        let productsApi = ProductsApi()
        productsApi.load(completion: completion)
        
    }
    
    
    /// Private things
    
    private static var instance : ApiServices?
    private init () {}
    static func getInstance() -> ApiServices{
        if instance == nil {
            instance = ApiServices()
        }
        return instance!
    }
    
    
}

fileprivate class ImageApi {
    
    var url:String?
    
    init(url:String) {
        self.url = url
    }
    
    func load(completion: @escaping (Data?,Error?) -> Void) {
        if let url = self.url {
            let imgRef = storageRef.child("url: \(url)")
            imgRef.getData(maxSize: 1 * 500 * 500) { data,error in
                if data == nil {
                    completion(nil,error)
                }else{
                    completion(data,nil)
                }
            }
        }
    }
    
}

fileprivate class ProductsApi {
    
    func load(completion: @escaping (DataSnapshot?, Error?) -> Void) {
        
        ref.child("products").observe(.childAdded, with: { (snapshot) in
            completion(snapshot,nil)
        }) { (error) in
            completion(nil,error)
        }
    }
    
}

