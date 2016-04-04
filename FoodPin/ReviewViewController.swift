//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by 林紹瑾 on 2016/4/4.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    var rating:String?
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var ratingStackView:UIStackView!
    
    //setting rating
    @IBAction func ratingSelected(sender: UIButton) {
        switch (sender.tag) {
        case 100: rating = "dislike"
        case 200: rating = "good"
        case 300: rating = "great"
        default: break
        }
        
        performSegueWithIdentifier("unwindToDetailView", sender: sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 讓背景模糊
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        //製作評價動畫
        ratingStackView.transform = CGAffineTransformMakeScale(0.0, 0.0)
        
        //向上動畫
        let scale = CGAffineTransformMakeScale(0.0, 0.0)
        let translate = CGAffineTransformMakeTranslation(0, 500)
        ratingStackView.transform = CGAffineTransformConcat(scale, translate)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation
    
    //設定動畫
    override func viewDidAppear(animated: Bool) {
        //由小變大
        UIView.animateWithDuration(0.4, delay: 0.0, options: [], animations: {
            self.ratingStackView.transform = CGAffineTransformIdentity
            }, completion: nil)
        
        //彈性
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.ratingStackView.transform = CGAffineTransformIdentity
            }, completion: nil)
        
        
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
    

}
