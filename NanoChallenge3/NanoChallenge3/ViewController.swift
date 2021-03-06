//
//  ViewController.swift
//  NanoChallenge3
//
//  Created by Vinicius Gomes on 07/04/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    @IBOutlet weak var btnCaderno1: UIButton!
    @IBOutlet weak var btnCaderno2: UIButton!
    @IBOutlet weak var btnCaderno3: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!

    var imgCar = [UIImage(named: "Dica1")!,UIImage(named: "Dica2")!,UIImage(named: "Dica3")!,UIImage(named: "Dica4")!,UIImage(named: "Dica5")!,UIImage(named: "Dica6")!,UIImage(named: "Dica7")!]
    var timer : Timer?
    var currentCellIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        pageControl.numberOfPages = imgCar.count
      
        startTimer()
        title = "E-volução"
        
        btnCaderno1.layer.cornerRadius = 12
        //72C2FC
        btnCaderno2.layer.cornerRadius = 12
        //FFF27E
        //btnCaderno3.layer.cornerRadius = 12
        //FF7577
        
  
    }

    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextIndex(){
        if currentCellIndex < imgCar.count - 1{
            currentCellIndex += 1
        }else{
            currentCellIndex = 0
        }
        
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentCellIndex
       
     }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgCar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "caroCell", for: indexPath) as! CarouselCollectionViewCell
    
        cell.imgCarousel.image = imgCar[indexPath.row]
        return cell
        
    }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }


}


