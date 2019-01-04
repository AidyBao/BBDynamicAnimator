//
//  Test2ViewController.swift
//  BBDynamicAnimator
//
//  Created by 120v on 2019/1/4.
//  Copyright © 2019 MQ. All rights reserved.
//

/*
 UICollisionBehavior
 只介绍属性，方法自己看
 collisionMode：碰撞类型有三种items（物体和物体间的碰撞）、boundaries(物体和边界的朋转)、everything（不管什么）
 translatesReferenceBoundsIntoBoundary：添加物理行为时，必须将这些物理行为添加到UIDynamicAnimator对象中，在创建UIDynamicAnimator对象时UIDynamicAnimator(referenceView: self.view)方法会指定一个UIView，translatesReferenceBoundsIntoBoundary属性就是是否碰撞边界为这个UIView的边界，之后只要添加到这个UIDynamicAnimator上的物理行为，都是发生在该UIView的坐标系统中。
 
 作者：颜如玉_黄金屋
 链接：https://www.jianshu.com/p/77bcb3cd1095
 來源：简书
 简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。
 
 */

import UIKit

class Test2ViewController: UIViewController {
    var attachButton = UIButton()
    var newButton = UIButton()
    var animationer = UIDynamicAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "碰撞行为"
        view.backgroundColor = UIColor.darkGray
        attachButton = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        attachButton.backgroundColor = UIColor.blue
        view.addSubview(attachButton)
        
        
        newButton = UIButton(frame: CGRect(x: 160, y: 100, width: 50, height: 50))
        newButton.backgroundColor = UIColor.red
        self.view.addSubview(newButton)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collisionAnimation()
    }
    
    fileprivate func collisionAnimation() {
        animationer = UIDynamicAnimator(referenceView: self.view)
        
        //给物体一个力，这个力可以是重力，也可以是通过UIPushBehavior自定义的一个推力
        
        let gBehavior = UIGravityBehavior(items: [attachButton])
        gBehavior.gravityDirection = CGVector(dx: 0, dy: 1)
        animationer.addBehavior(gBehavior)
        
        let collisionBehavior = UICollisionBehavior(items: [attachButton])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .everything
        animationer.addBehavior(collisionBehavior)
    }
}
