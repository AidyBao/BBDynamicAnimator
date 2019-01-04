//
//  Test5ViewController.swift
//  BBDynamicAnimator
//
//  Created by 120v on 2019/1/4.
//  Copyright © 2019 MQ. All rights reserved.
//

/*
 UISnapBehavior甩行为
 
 snapPoint: 将物体甩向这个点
 damping：将物体甩向一个指定的点后，物体会震荡一会，damping为震荡系数，默认值为0.5，取值范围为0-1太大了的话可能看不到震荡效果
 */

import UIKit

class Test5ViewController: UIViewController {

    let ball = Ellipse()
    let circile = UIView()
    var animator = UIDynamicAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "迅速移动"
        view.backgroundColor = UIColor.darkGray
        
        ball.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        ball.layer.cornerRadius = min(ball.bounds.size.width / 2, ball.bounds.size.height / 2)
        ball.layer.masksToBounds = true
        ball.backgroundColor = UIColor.blue
        self.view.addSubview(ball)
        // Do any additional setup after loading the view.
        circile.frame = CGRect(x: 10, y: 10, width: 10, height: 10)
        circile.backgroundColor = UIColor.black
        circile.layer.cornerRadius = min(circile.bounds.size.width / 2, circile.bounds.size.height / 2)
        circile.layer.masksToBounds = true
        ball.addSubview(circile)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        snap()
    }
    
    func snap() {
        animator = UIDynamicAnimator(referenceView: self.view)
        
        let snapBehavior = UISnapBehavior(item: ball, snapTo: CGPoint(x:UIScreen.main.bounds.size.width + 20,y:500))
        //将物体甩向一个设定的点，停止在指定的点时，会震荡摇晃一会
        snapBehavior.damping = 0.1
        animator.addBehavior(snapBehavior)
    }
}

extension Test5ViewController : UIDynamicAnimatorDelegate {
    
    func dynamicAnimatorDidPause(_ animator: UIDynamicAnimator) {
        print("\(#function)")
    }
    
}
