//
//  Checklist.swift
//  CheckList
//
//  Created by linx on 2018/11/27.
//  Copyright © 2018年 Huang Xinyi. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
