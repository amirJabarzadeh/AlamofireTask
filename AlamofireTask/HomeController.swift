//
//  ViewController.swift
//  AlamofireTask
//
//  Created by developer on 5/20/22.
//

import UIKit
import LBTATools
import moa
class HomeController: UIViewController , UISearchBarDelegate {
    
    let cellId = "cellId"
    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    var active:UIActivityIndicatorView = UIActivityIndicatorView()
    var api = NetworkingClient()
    var photosArray = [Photo]()
    var searchText = ""
    var pageNumber = 1
    var lastPage = 1
    
    lazy var searchBar : CustomSearchBar = {
        let search = CustomSearchBar()
        search.delegate = self
        return search
    }()
    
    lazy var homeCollection: CustomCollectinView = {
        let cv = CustomCollectinView()
        cv.dataSource = self
        cv.delegate = self
        cv.register(HomeCell.self, forCellWithReuseIdentifier: cellId)
        return cv
    }()


}

extension HomeController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = homeCollection.dequeueReusableCell(withReuseIdentifier:  cellId, for: indexPath) as? HomeCell {
        let config = photosArray[indexPath.row]
        cell.image.image = UIImage(named: "h")
        cell.image.moa.url = downloadImage(server: config.server, id: config.id, secret: config.secret)
        return cell
    }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 3 , height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == photosArray.count - 1 && lastPage >= pageNumber {
            pageNumber = pageNumber + 1
            fetchPhotos(query: searchText, removeOldData: false)

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectionFeedbackGenerator.selectionChanged()
        
        if let cell = homeCollection.cellForItem(at: indexPath) as? HomeCell {
            showImage(image: cell.image)
        }
    }
}
