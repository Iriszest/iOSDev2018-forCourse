//
//  DrawPlusGesture.swift
//  GestureRecognition
//
//  Created by Huang Xinyi on 2018/11/29.
//  Copyright © 2018年 Huang Xinyi. All rights reserved.
//

import  UIKit
import UIKit.UIGestureRecognizerSubclass
//画直角“⌝”号，先从左到右滑“—”，再从上到下滑“|”
class RightAngleGestureRecognizer: UIGestureRecognizer {
    enum Direction : Int {
        case DirectionLeft
        case DirectionRight
        case DirectionDown
        case DirectionUp
        case DirectionUnKnown
    }
    var tickleCount = 0
    var currentTickleStart: CGPoint = CGPoint.zero
    var lastDirection: Direction = .DirectionUnKnown
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        if let touch = touches.first{
            currentTickleStart = touch.location(in: self.view)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        resetState()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        resetState()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        if let touch = touches.first{
            let tickleEnd = touch.location(in: self.view)
            let tickleHorizontal = tickleEnd.x - currentTickleStart.x
            let tickleVertical = tickleEnd.y - currentTickleStart.y
            
            let currentHorizontalDirection: Direction = tickleHorizontal > 0 ? .DirectionRight : .DirectionLeft
            let currentVerticalDirection: Direction = tickleHorizontal > 0 ? .DirectionDown : .DirectionUp
            
            if abs(tickleHorizontal) >= 20.0 {
                if lastDirection == .DirectionUnKnown && currentHorizontalDirection == .DirectionRight {
                    tickleCount += 1
                    currentTickleStart = tickleEnd
                    lastDirection = .DirectionRight
                    print(" 情况1,方向：\(lastDirection)")
                    
                    if currentVerticalDirection == .DirectionDown, abs(tickleVertical) >= 20.0 {
                        tickleCount += 1
                        currentTickleStart = tickleEnd
                        lastDirection = .DirectionDown
                        print("情况2,方向：\(lastDirection)")
                    }
                    
                    if tickleCount >= 2 && self.state == UIGestureRecognizer.State.possible{
                        self.state = UIGestureRecognizer.State.ended
                        print(" 手势成功！")
                    }
                }
                
            }
            
        }
    }
    
    
    
    func resetState(){
        tickleCount = 0
        lastDirection = .DirectionUnKnown
        currentTickleStart = CGPoint.zero
        if self.state == .possible{
            self.state = .failed
        }
    }
}

