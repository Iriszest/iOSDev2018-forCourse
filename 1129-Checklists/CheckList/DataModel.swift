//
//  DataModel.swift
//  CheckList
//
//  Created by linx on 2018/11/27.
//  Copyright © 2018年 Huang Xinyi. All rights reserved.
//

import Foundation

class DataModel {
    var lists = [Checklist]()
    
    init() {
        loadChecklists()
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory,  in: .userDomainMask)
        return paths[0]
    }
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
    
    
    func saveChecklists() {
        let encoder = PropertyListEncoder()
        do {
            // encode lists
            let data = try encoder.encode(lists)
            try data.write(to: dataFilePath(),
                           options: Data.WritingOptions.atomic)
            print("Error encoding item array!")
        } catch { }
    }
    
    
    func loadChecklists() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                // decode to an object of [Checklist] type to lists
                lists = try decoder.decode([Checklist].self, from: data)
            } catch {
                print("Error decoding item array!")
            }
        }
    }
}
