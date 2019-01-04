//
//  BBStartViewController.swift
//  BBDynamicAnimator
//
//  Created by 120v on 2019/1/4.
//  Copyright © 2019 MQ. All rights reserved.
//

/*
最后的最后说说在添加这些物理属性时要注意的问题和UIDynamicItemBehavior：
因为说的时物理引擎，给物体加上一些物理属性，所以再给一些物体加上物理行为之后如碰撞、吸附时不要忘记给物体加一个力，重力或者一个自定义的推力，要不然物体怎么运动？
再给物体加上重力效果时，记得要加上一个碰撞边界要不然物体下落的这个过程永远执行不完。就好比从一个无限高的地方扔下一块石头，石头永远不会着地。
UIDynamicItemBehavior:可以给物体增加一些物理属性
elasticity：弹性系数
friction：摩擦力
density：密度
resistance：线性方向阻力
charge：代表能够影响一个元素在电磁场上如何移动的电荷（是的，听起来很疯狂） 网找的，不明白是什么鬼
isAnchored：本质上是将图形变成了碰撞中的一个静态物体，但没有响应事件（如果有什么东西撞上了它，它会丝毫不动），所以可以完美地用来表示地板或墙壁
angularResistance：角阻力，物体旋转时的阻力
allowsRotation：是否允许物体旋转

*/

import UIKit

class BBStartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func test1(_ sender: Any) {
        self.navigationController?.pushViewController(Test1ViewController(), animated: true)
    }
    

    @IBAction func test2(_ sender: Any) {
        self.navigationController?.pushViewController(Test2ViewController(), animated: true)
    }
    
    @IBAction func test3(_ sender: Any) {
        self.navigationController?.pushViewController(Test3ViewController(), animated: true)
    }
    
    @IBAction func test4(_ sender: Any) {
        self.navigationController?.pushViewController(Test4ViewController(), animated: true)
    }
    
    @IBAction func test5(_ sender: Any) {
        self.navigationController?.pushViewController(Test5ViewController(), animated: true)
    }
    
    @IBAction func test6(_ sender: Any) {
        self.navigationController?.pushViewController(ViewController(), animated: true)
        
    }

}
