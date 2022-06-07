//
//  HomeMethods.swift
//  AlamofireTask
//
//  Created by developer on 5/21/22.
//

import UIKit

extension HomeController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        title = "Photo Search"
        
        setupViews()
        
        activityIndView()
        
    }
    
    func setupViews(){
        
        view.addSubviews(searchBar,homeCollection)
        
        searchBar.anchor(.top(view.safeAreaLayoutGuide.topAnchor , constant: 5) , .leading(view.leadingAnchor , constant: 5) , .trailing(view.trailingAnchor, constant: 5))
        
        homeCollection.anchor(.top(searchBar.bottomAnchor , constant: 5) , .bottom(view.bottomAnchor) , .leading(view.leadingAnchor) , .trailing(view.trailingAnchor))
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        view.endEditing(true)
        
        DispatchQueue.main.async {
            self.search()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.searchText = searchText
        
    }
    
    func search() {
        
        pageNumber = 1
        
        fetchPhotos(query: searchText, removeOldData: true)
        print(searchText)

    }
    
    func downloadImage(server:String , id:String , secret:String) -> String{
        let url = "https://live.staticflickr.com/\(server)/\(id)_\(secret).jpg"
        return url
    }
    
    func showImage(image : UIImageView){
        guard let img = image.image else {
            return
        }
        let imageInfo = GSImageInfo(image: img , imageMode: .aspectFit)
        let transitionInfo = GSTransitionInfo(fromView: image)
        let imageViewer = GSImageViewerController(imageInfo: imageInfo, transitionInfo: transitionInfo)

        present(imageViewer, animated: true, completion: nil)
    }
    
    func activityIndView() {
        active.style = .large
        homeCollection.addSubview(active)
        active.centerXTo(homeCollection.centerXAnchor)
        active.centerYTo(homeCollection.centerYAnchor)
    }
    
    func showAlert(title:String , message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Retry", comment: "Default action"), style: .default, handler: { _ in
            self.pageNumber = 1
            self.fetchPhotos(query: self.searchText, removeOldData: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func reloadAnimated() {
        
        UIView.transition(with: homeCollection,
                          duration: 0.35,
                          options: .transitionCrossDissolve,
                          animations: { self.homeCollection.reloadData() })
    }
    
    func removeOldDataArray(){
        photosArray.removeAll()
        homeCollection.contentOffset.y = 0
    }
    
}
