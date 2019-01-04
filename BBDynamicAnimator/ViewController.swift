//
//  ViewController.swift
//  BBDynamicAnimator
//
//  Created by 120v on 2019/1/3.
//  Copyright © 2019 MQ. All rights reserved.
//


//UIDynamicAnimator类，通过这个类中的不同行为来实现一些动态特性。
//
//UIAttachmentBehavior（吸附），UICollisionBehavior（碰撞），UIGravityBehavior（重力），UIPushBehavior（推动），UISnapBehavior（捕捉）。另外还有一个辅助的行为UIDynamicItemBehavior，用来在item层级设定一些参数，比如item的摩擦，阻力，角阻力，弹性密度和可允许的旋转等等

import UIKit

class ViewController: UIViewController {
    
    let W = UIScreen.main.bounds.size.width
    var animator:UIDynamicAnimator?         = nil   //仿真器，也是仿真行为的执行者
    var snap: UISnapBehavior?               = nil   //捕捉
    var attachment: UIAttachmentBehavior?   = nil   //吸附
    
    var testView: UIView?           = nil
    
    let gravity: UIGravityBehavior = {
        let gra = UIGravityBehavior()
        return gra
    }()
    
    let collision: UICollisionBehavior = {
        let col = UICollisionBehavior()
        col.translatesReferenceBoundsIntoBoundary = true//不会超过编辑
        return col
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: self.view)

        //self.test1()
        
        //self.test2()
        
        self.test3()
    }
    
    

    
    //MARK: - Test1
    func test1() {
        let timer = Timer(timeInterval: 1, target: self, selector: #selector(start), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: .common)
        timer.fire()
    }
    
    
    @objc func start() {
        self.addView()
    }

    
    func addView() {
        
        let view = UIView(frame: CGRect(x: CGFloat(arc4random_uniform(UInt32(W))), y: 0, width: 50, height: 50))
        view.backgroundColor = UIColor(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1)
        self.view.addSubview(view)
        
        //重力行为
        gravity.addItem(view)
        
        //碰撞行为
        collision.addItem(view)
        
        //仿真器，也是仿真行为的执行者
        animator?.addBehavior(gravity)
        animator?.addBehavior(collision)
    }
    
    
    //MARK: - Test2
    func test2() {
        
        testView = UIView(frame: CGRect(x: 50, y: 200, width: 100, height: 100))
        testView?.backgroundColor = UIColor.red
        self.view.addSubview(testView!)
        
        
        let panGest = UITapGestureRecognizer(target: self, action: #selector(hand(_:)))
        testView?.addGestureRecognizer(panGest)
    }
    
    // UISnapBehavior 将UIView通过动画吸附到某个点上
    @objc func hand(_ paramTap: UITapGestureRecognizer) {
        let tapPoint = paramTap.location(in: self.view)
        if self.snap != nil {
            self.animator?.removeBehavior(self.snap!)
        }
        
        self.snap = UISnapBehavior(item: self.testView!, snapTo: tapPoint)
        self.snap?.damping = 0.5 //剧列程度
        self.animator?.addBehavior(self.snap!)
    }
    
    
    //MARK: - Test3
    func test3() {
        testView = UIView(frame: CGRect(x: 50, y: 200, width: 100, height: 100))
        testView?.backgroundColor = UIColor.red
        self.view.addSubview(testView!)
        
        
        let panGest = UIPanGestureRecognizer(target: self, action: #selector(hand(_:)))
        testView?.addGestureRecognizer(panGest)
    }
    
    // 实现一个pan手势，让一个image跟着手势跑
    func testAttachmentBehavior(_ panGest: UIPanGestureRecognizer) {
        let location = panGest.location(in: self.view)
        let boxLocation = panGest.location(in: self.testView)
        switch panGest.state {
        case .began:
            self.animator?.removeAllBehaviors()
            let offset = UIOffset(horizontal: boxLocation.x - (self.testView?.bounds.midX)!, vertical: boxLocation.y - (self.testView?.bounds.midY)!)
            self.attachment = UIAttachmentBehavior(item: self.testView!, offsetFromCenter: offset, attachedToAnchor: location)
            self.attachment?.damping = 0.5 //吸附还原时的阻力大小
            self.attachment?.frequency = 0.8 //震荡频率
            self.animator?.addBehavior(self.attachment!)
        case .ended:
            self.animator?.removeAllBehaviors()
        default:
            self.attachment?.anchorPoint = location
        }
    }
}


