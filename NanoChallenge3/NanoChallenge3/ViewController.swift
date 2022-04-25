//
//  ViewController.swift
//  NanoChallenge3
//
//  Created by Vinicius Gomes on 07/04/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout {
 
    @IBOutlet var myPageControl: UIPageControl!
    @IBOutlet var CollectionViewIB: UICollectionView!
   
    var currentcellIndex = 0
    
    var webSeriesImages = [UIImage(named:"foto 1"),
                           UIImage(named:"foto 2"),
                           UIImage(named:"foto 3"),
                           UIImage(named:"foto 4"),
                           UIImage(named:"foto 5"),
                           UIImage(named:"foto 6")]
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myPageControl.numberOfPages = webSeriesImages.count
        myPageControl.currentPage = 0
        DispatchQueue.main.async { [self] in
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
            
        }
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
@objc func changeImage()
    {
        if counter < webSeriesImages.count{
            let index = IndexPath.init(item: counter, section: 0)
            self.CollectionViewIB.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            myPageControl.currentPage = counter
            counter += 1
        }else{
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.CollectionViewIB.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            myPageControl.currentPage = counter
            counter = 1
            
        }
        CollectionViewIB.scrollToItem(at: IndexPath(item: currentcellIndex, section: 0), at: .right, animated: true)
}


func CollectionViewIB(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
return webSeriesImages.count
}

    func CollectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return webSeriesImages.count
        
    }
    func CollectionViewIB(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath ) -> UICollectionViewCell{
        let cell = CollectionViewIB.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView {
            vc.image = webSeriesImages[indexPath.row]
        }else if let ab = cell.viewWithTag(222) as? UIPageControl{
            ab.currentPage = indexPath.row
        }
return cell

}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func CollectionViewIB(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> CGSize
    {
        let size = CollectionViewIB.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 0.0
    }
    private func CollectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 0.0
    }

}


