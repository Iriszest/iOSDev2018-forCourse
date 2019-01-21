//
//  ViewController.swift
//  GestureRecognition
//
//  Created by linx on 2018/11/29.
//  Copyright © 2018年 Huang Xinyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hxyImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setImageView()
    }
    
    func setImageView(){
        hxyImageView.image = UIImage(named: "bg")
        hxyImageView.isUserInteractionEnabled = true
        tapGesture()
        dragGesture()
        zoomGesture()
        angleGesture()
    }
    
    func tapGesture(){
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapClick(_:)))
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        hxyImageView.addGestureRecognizer(tapRecognizer)
    }
    
    func dragGesture(){
        let dragRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.panProcess(_:)))
        hxyImageView.addGestureRecognizer(dragRecognizer)
    }

    func zoomGesture(){
        let zoomRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.zoomProcess(_:)))
        hxyImageView.addGestureRecognizer(zoomRecognizer)
    }
    
    func angleGesture(){
        let angleRecognizer = RightAngleGestureRecognizer(target: self, action: #selector(ViewController.angleClick(_:)))
        hxyImageView.addGestureRecognizer(angleRecognizer)
    }
    
    //实现点击切换图片
    @objc func tapClick(_ recognizer: UITapGestureRecognizer){
        
        if hxyImageView.image == UIImage(named: "bg"){
            hxyImageView.image = UIImage(named: "bg2")
        } else{
            hxyImageView.image = UIImage(named: "bg")
        }
    }
    
    //实现拖拽移动位置
    var pointValue: CGPoint! = CGPoint.zero
    
    @objc func panProcess(_ recognizer: UIPanGestureRecognizer){
        
        let img: UIImageView = recognizer.view as! UIImageView
        let point = recognizer.translation(in: img)
        
        img.transform = CGAffineTransform(translationX: point.x + self.pointValue.x , y: point.y + self.pointValue.y)
        
        if recognizer.state == .began{
            self.view.bringSubviewToFront(img)
        } else if recognizer.state == .ended{
            self.pointValue.x += point.x
            self.pointValue.y += point.y
        }
    }
    
    //实现缩放
    var scaleValue: CGFloat = 1.0
    
    @objc func zoomProcess(_ recognizer: UIPinchGestureRecognizer){
        
        let img: UIImageView = recognizer.view as! UIImageView
        let scale = recognizer.scale;
        
        if scale > 1.0 {
            img.transform = CGAffineTransform(scaleX: self.scaleValue + scale - 1.0, y: self.scaleValue + scale + 1.0)
        } else {
            img.transform = CGAffineTransform(scaleX: self.scaleValue * scale, y: self.scaleValue * scale)
        }
        
        if recognizer.state == .began {
            self.view.bringSubviewToFront(img)
        } else if recognizer.state == .ended{
            if scale > 1.0 {
                self.scaleValue = self.scaleValue + scale - 1.0
            } else {
                self.scaleValue = self.scaleValue * scale
            }
        }
    }
    

    @IBAction func angleClick(_ sender: RightAngleGestureRecognizer) {
        let view = sender.view as! UIImageView
        view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    }
    
    
    
}

