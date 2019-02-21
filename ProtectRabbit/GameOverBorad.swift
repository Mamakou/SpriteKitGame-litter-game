//
//  GameOverBorad.swift
//  FlyMyBird
//
//  Created by goviewtech on 2018/11/29.
//  Copyright © 2018 goviewtech. All rights reserved.
//

import UIKit

protocol GameOverBoradDelegate : NSObjectProtocol {
    
    func boardViewPlayAgain() ->Void
}

/**
 游戏结束后弹出画板
 */
class GameOverBorad: UIView {

    weak var delegate : GameOverBoradDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        //设置渐变的主颜色
        gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.red.cgColor,UIColor.brown.cgColor]
        //将gradientLayer作为子layer添加到主layer上
        self.layer.addSublayer(gradientLayer)
        
        let textLabel = UILabel()
        textLabel.textColor = UIColor.purple
        textLabel.font = FONT_20
        textLabel.text = "游戏结束啦"
        self.addSubview(textLabel)
        textLabel.ym_autoAlignAxisToSuperviewAxis(axis: .ALAxisVertical)
        textLabel.ym_autoAlignAxisToSuperviewAxis(axis: .ALAxisHorizontal)
        
        let button = UIButton()
        button.titleLabel?.textColor = UIColor.red
        button.titleLabel?.font = UIFont.init(name: "MarkerFelt-Wide", size: 18)
        button.setTitle("再玩一次", for: .normal)
        button.backgroundColor = UIColor.green
        self.addSubview(button)
        button.ym_autoSetDimensionsToSize(size: CGSize(width: 80, height: 40))
        button.ym_autoAlignAxisToSuperviewAxis(axis: .ALAxisVertical)
        button.ym_autoPinEdgeToSuperviewEdge(edge: .ALEdgeBottom, inset: 20)
        button.addTarget(self, action: #selector(clickPlayAgain), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 5
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        
    }
    
    @objc func clickPlayAgain () {
        if self.delegate != nil {
            self.delegate.boardViewPlayAgain()
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
