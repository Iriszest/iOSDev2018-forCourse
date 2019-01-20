//
//  ChecklistItem.swift
//  CheckList
//
//  Created by linx on 2018/11/27.
//  Copyright © 2018年 Huang Xinyi. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
