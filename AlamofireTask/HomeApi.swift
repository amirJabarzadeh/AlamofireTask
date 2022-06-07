//
//  HomeApi.swift
//  AlamofireTask
//
//  Created by developer on 5/20/22.
//

import UIKit
import Alamofire

extension HomeController {
    
    func fetchPhotos(query:String ,  removeOldData:Bool){
        
        let rMannger = NetworkReachabilityManager()
        if  (rMannger?.isReachable)!  {
            
            let queryItems = [URLQueryItem(name: "method", value: "flickr.photos.search") , URLQueryItem(name: "api_key", value: "9886d09f7cd3eebd4c761e6a325cff30") ,URLQueryItem(name: "tags", value: query), URLQueryItem(name: "page", value: String(pageNumber)) , URLQueryItem(name: "format", value: "json") , URLQueryItem(name: "nojsoncallback", value: "1")]
            
            var urlComps = URLComponents(string: "https://api.flickr.com/services/rest/")
            
            urlComps?.queryItems = queryItems
            
            guard let result = urlComps?.url else{return}
            
            print(result)
            active.startAnimating()
            
            api.api(result, .get) { (json, error) in
                
                self.active.stopAnimating()
                
                if removeOldData {
                    self.removeOldDataArray()
                }
                
                if json != nil {
                    if let data = self.api.data {
                        
                        if let searchPhotos = try? JSONDecoder().decode(PhotosSearch.self, from: data) {
                            
                            self.photosArray.append(contentsOf: searchPhotos.photos.photo)
                            self.lastPage = searchPhotos.photos.pages
                            
                        }
                    }
                    
                    self.reloadAnimated()
                    
                }else{
                    self.showAlert(title: "Error", message: "Error connecting to server")
                }
                
            }
            
            
        }else{
            
            showAlert(title: "Error", message: "Error connecting to internet")
        }
    }
    
}
