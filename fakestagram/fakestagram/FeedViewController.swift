//
//  FeedViewController.swift
//  fakestagram
//
//  Created by Francisco Javier Gómez León on 18/10/25.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var firstImgaeView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImgaeView: UIImageView!
        
    @IBOutlet weak var firstCaption: UILabel!
    @IBOutlet weak var secondCaption: UILabel!
    @IBOutlet weak var thirdCaption: UILabel!
    
    var pictureType: PictureType = .dog
    var showCaption: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showOrHideCaptions()
        setImageAndCaptions()
    }
    
    private func showOrHideCaptions(){
        firstCaption.isHidden = !showCaption
        secondCaption.isHidden = !showCaption
        thirdCaption.isHidden = !showCaption
    }
    
    private func setImageAndCaptions(){
        let captionedImages = pictureType.captionedImages
        firstCaption.text = captionedImages[0].caption
        secondCaption.text = captionedImages[1].caption
        thirdCaption.text = captionedImages[2].caption
        
        firstImgaeView.image = captionedImages[0].image
        secondImageView.image = captionedImages[1].image
        thirdImgaeView.image = captionedImages[2].image
        
    }
}
