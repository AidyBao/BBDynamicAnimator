//
//  Test4ViewController.swift
//  BBDynamicAnimator
//
//  Created by 120v on 2019/1/4.
//  Copyright © 2019 MQ. All rights reserved.
//

/*
 UIPushBehavior推力行为
 mode：在初始话推力时要定义推力的类型，有两种类型continuous、instantaneous，分别是连续的力和瞬间的力
 active: 当前推力是否可用
 angle: 推力的角度
 magnitude： 推力的大小
 pushDirection：推理的方向和重力的方向一样
 
 */

import UIKit

class Test4ViewController: UIViewController {

    let ball = Ellipse()
    let circile = UIView()
    var animator = UIDynamicAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "推动行为"
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
        push()
    }
    
    func push() {
        animator = UIDynamicAnimator(referenceView: self.view)
        
        //推力在之前已经做过介绍，可以看碰撞行为的代码
        let pushBehavior = UIPushBehavior(items: [ball], mode: .continuous)
        pushBehavior.active = true
        pushBehavior.magnitude = 1
        pushBehavior.pushDirection = CGVector(dx: 0, dy: 1)
        animator.addBehavior(pushBehavior)
        
        let colission = UICollisionBehavior(items: [ball])
        colission.translatesReferenceBoundsIntoBoundary = true
        colission.collisionMode = .everything
        animator.addBehavior(colission)
        
        let itemBehavior = UIDynamicItemBehavior(items: [ball])
        itemBehavior.elasticity = 0.4
        itemBehavior.addAngularVelocity(-3, for: itemBehavior.items.first!)
        animator.addBehavior(itemBehavior)
    }
    
}
