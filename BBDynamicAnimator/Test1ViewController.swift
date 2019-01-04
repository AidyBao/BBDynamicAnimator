//
//  Test1ViewController.swift
//  BBDynamicAnimator
//
//  Created by 120v on 2019/1/4.
//  Copyright © 2019 MQ. All rights reserved.
//


/*
 UIAttachmentBehavior的初始化方法有好几种，可以通过构造器也可以通过类方法，不外乎两大类型，物体和物体、物体和点之间。具体的可以看下文档。这里介绍下管于该类型的一些属性和简单的使用方法。
 items：一个UIAttachmentBehavior对象所包含的物体
 attachedBehaviorType：附属或者吸附行为的类型get类型在生成一个   UIAttachmentBehavior的对象时已经决定了，就是物体和物体之间的附属行为，或者物体和一个点之间的附属行为
 length：两个物体之间的距离（或者是点和物体之间的距离）
 damping：吸附还原时的阻力大小
 frequency：震荡频率
 frictionTorque：克服一个物体做圆周运动的力的大小
 attachmentRange：吸附行为的运动范围
 */

import UIKit

class Test1ViewController: UIViewController {

    var attachButton = UIButton()
    var animator = UIDynamicAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "吸附行为"
        view.backgroundColor = UIColor.darkGray
        attachButton = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        attachButton.backgroundColor = UIColor.blue
        view.addSubview(attachButton)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAttach()
    }
    
    func showAttach() {
        
        animator = UIDynamicAnimator(referenceView: self.view)
        animator.delegate = self
        
        let attachBehavior = UIAttachmentBehavior(item: attachButton, attachedToAnchor: attachButton.center)
        attachBehavior.length = 20
        //设置吸附还原时的阻力系数大小
        attachBehavior.damping = 0.1
        //设置震荡频率
        attachBehavior.frequency = 2.3
        animator.addBehavior(attachBehavior)
        
        //加一个推力 推力的类型有两种一种是瞬间的推力，一种是连续的 分别对应的是 instantaneous 和  continuous
        let pushBehavior = UIPushBehavior(items: [attachButton], mode: .instantaneous)
        //设置推力可用
        pushBehavior.active = true
        //设置力的方向
        pushBehavior.pushDirection = CGVector(dx: 1, dy: 0)
        //设置力的大小
        pushBehavior.magnitude = 100
        animator.addBehavior(pushBehavior)
    }

}


extension Test1ViewController : UIDynamicAnimatorDelegate {
    
    func dynamicAnimatorDidPause(_ animator: UIDynamicAnimator) {
        print("\(#function)")
    }
    
}
