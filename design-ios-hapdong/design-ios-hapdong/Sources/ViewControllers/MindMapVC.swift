//
//  MindMapVC.swift
//  design-ios-hapdong
//
//  Created by 초이 on 2020/11/14.
//

import UIKit

class MindMapVC: UIViewController {
    @IBOutlet weak var circleImageView: UIImageView!
    var currentBtnNum = 1;
    
    func createPlusButton(size: CGFloat) -> UIButton {
        let image = UIImage(named: "3RdMindmapButtonIos") as UIImage?
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 100, y: 100, width: 93, height: 93)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(self.plusBtnTouched), for:.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: size).isActive = true
        button.heightAnchor.constraint(equalToConstant: size).isActive = true
        button.layer.cornerRadius = size / 2
        button.tag = 1

        return button
    }
    
    
    func createMindButton(size: CGFloat) -> UIButton {
        let image = UIImage(named: "3RdMindmapCircleIos") as UIImage?
        let button = UIButton(type: .custom)
        let mindTitle = "STORM"
        button.frame = CGRect(x: 100, y: 100, width: 116, height: 116)
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(self, action: #selector(self.btnTouched), for:.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: size).isActive = true
        button.heightAnchor.constraint(equalToConstant: size).isActive = true
        button.layer.cornerRadius = size / 2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitle(mindTitle, for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        
        
        button.tag = 2

        return button
    }
    
    func createCenterButton(size: CGFloat) -> UIButton {
        let image = UIImage(named: "3RdMindmapMaincircleIos") as UIImage?
        let button = UIButton(type: .custom)
        //let centerTitle = "SOPT 솝커톤 \n 아이디에이션"
        button.frame = CGRect(x: 100, y: 100, width: 226, height: 226)
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(self, action: #selector(self.centerBtnTouched), for:.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: size).isActive = true
        button.heightAnchor.constraint(equalToConstant: size).isActive = true
        button.layer.cornerRadius = size / 2
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
//        button.setTitle(centerTitle, for: .normal)
//        button.setTitleColor(.darkGray, for: .normal)
        
        
        button.tag = 3

        return button
    }

    func setUpButtons(count: Int, around center: UIView, radius: CGFloat) {
            // compute angular separation of each button
            let degrees = 360 / CGFloat(count)

            for i in 0 ..< count {
                
                if(i == 0){
                    let plusButton = createPlusButton(size: 93)
                    self.view.addSubview(plusButton)
                    
                    let hOffset = radius * cos(CGFloat(i) * degrees * .pi / 180)
                    let vOffset = radius * sin(CGFloat(i) * degrees * .pi / 180)
                    
                    plusButton.centerXAnchor.constraint(equalTo: center.centerXAnchor, constant: hOffset).isActive = true
                    plusButton.centerYAnchor.constraint(equalTo: center.centerYAnchor, constant: vOffset).isActive = true
                }else{
                    let mindButton = createMindButton(size: 116)
                    self.view.addSubview(mindButton)

                    // use trig to compute offsets from center button
                    let hOffset = radius * cos(CGFloat(i) * degrees * .pi / 180)
                    let vOffset = radius * sin(CGFloat(i) * degrees * .pi / 180)

                    // set new button's center relative to the center button's
                    // center using centerX and centerY anchors and offsets
                    mindButton.centerXAnchor.constraint(equalTo: center.centerXAnchor, constant: hOffset).isActive = true
                    mindButton.centerYAnchor.constraint(equalTo: center.centerYAnchor, constant: vOffset).isActive = true
                }
            }
        }
    
    func setUpButtonsWithoutPlusButton(count: Int, around center: UIView, radius: CGFloat) {
        // compute angular separation of each button
        let degrees = 360 / CGFloat(count)
        for i in 0 ..< count {
            let mindButton = createMindButton(size: 116)
            self.view.addSubview(mindButton)

            // use trig to compute offsets from center button
            let hOffset = radius * cos(CGFloat(i) * degrees * .pi / 180)
            let vOffset = radius * sin(CGFloat(i) * degrees * .pi / 180)

            // set new button's center relative to the center button's
            // center using centerX and centerY anchors and offsets
            mindButton.centerXAnchor.constraint(equalTo: center.centerXAnchor, constant: hOffset).isActive = true
            mindButton.centerYAnchor.constraint(equalTo: center.centerYAnchor, constant: vOffset).isActive = true
        }
    }

    override func viewDidLoad() {
            super.viewDidLoad()

            let centerButton = createCenterButton(size: 226)
            self.view.addSubview(centerButton)

            // use anchors to place center button in the center of the screen
            centerButton.centerXAnchor.constraint(equalTo: self.circleImageView.centerXAnchor).isActive = true
            centerButton.centerYAnchor.constraint(equalTo: self.circleImageView.centerYAnchor).isActive = true
        
        setUpButtons(count: 1, around: self.circleImageView, radius: 150)
        }
    
    @objc func btnTouched() {
        print("dd")
    }
    
    @objc func centerBtnTouched(){
        print("center")
    }
    
    @objc func plusBtnTouched(){
        currentBtnNum += 1
        
        for view in self.view.subviews {
            if(view.tag == 1 || view.tag == 2){
                view.removeFromSuperview()
            }
        }
        
        if(currentBtnNum < 4){
            setUpButtons(count: currentBtnNum, around: self.circleImageView, radius: 150)
        }else{
            setUpButtonsWithoutPlusButton(count: currentBtnNum, around: self.circleImageView, radius: 150)
        }
    }

}

extension UIButton {
open override var isHighlighted: Bool {
    didSet {
        super.isHighlighted = false
    }
}}
