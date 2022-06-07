//
//  ApiService.swift
//  AlamofireTask
//
//  Created by developer on 5/20/22.
//

import UIKit
import Alamofire
import SwiftMessages

class NetworkingClient {
    
    let baseUrl =  ""
    
    typealias WebServiceResponse  = (Dictionary<String, Any>? , Error?) -> Void
    var headers: HTTPHeaders? = []
    var data : Data?
    
    func serverError(){
       // alertMessageView(title: "Error connecting to server", imgName: "errorServer")
        
    }
    
    func api(_ url: URL , _ method : HTTPMethod ,parameters: Parameters = [:] ,completion: @escaping WebServiceResponse)  {
        
        self.headers = [
            
        ]
        
        if method == .get {

            AF.request( "\(baseUrl)\(url)" , method: method , encoding : JSONEncoding.default , headers:headers).responseJSON { response in
                if let error = response.error {

                    completion(nil , error)
                    self.serverError()

                }  else {

                    self.data = response.data
                    completion(response.value as? Dictionary<String, Any> , nil)
                    if let statusCode = response.response?.statusCode{
                        print(statusCode)
                        if statusCode == 401 {
                          //  self.delegate?.logOutApp()
                        }
                    }

                }
            }

        }
        else  {
            
            AF.request("\(baseUrl)\(url)" , method: method, parameters: parameters , encoding : JSONEncoding.default , headers:headers).responseJSON { response in
                
                if let error = response.error {
                    
                    completion(nil , error)
                    self.serverError()
                    
                }  else {
                    self.data = response.data
                    completion(response.value as? Dictionary<String, Any> , nil)
//                    if let statusCode = response.response?.statusCode{
//
//                        if statusCode == 401 {
//                            self.delegate?.logOutApp()
//
//                        }
//                    }
                }
            }
        }
    }
}
