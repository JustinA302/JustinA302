//
//  StudentModel.swift
//  Class List App
//
//  Created by Erin Delaney on 9/13/19.
//  Copyright © 2019 CS-337. All rights reserved.
//

import Foundation

typealias studentInfo = Dictionary<String, String>

class StudentModel {
    
    func readJSONFromFile() -> [studentInfo]?
    {
        var json: Any?
        if let path = Bundle.main.path(forResource: "CSSE337studentsFall2019", ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                // Getting data from JSON file using the file URL
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                json = try? JSONSerialization.jsonObject(with: data) as! [studentInfo]
            } catch {
                // Handle error here
            }
        }
        return json as? [studentInfo]
    }
    
    
    func getAllStudents() -> [studentInfo]? {
        if let allStudents = self.readJSONFromFile() {
            return allStudents
        } else {
            return nil
        }
    }
    
    func getCSStudents() -> [studentInfo]? {
        if let allStudents = self.readJSONFromFile() {
            let csStudens = allStudents.filter({$0["Major"]!.contains("CS")})
            return csStudens
        } else {
            return nil
        }
    }
    
    func getSEStudents() -> [studentInfo]? {
        if let allStudents = self.readJSONFromFile() {
            let seStudens = allStudents.filter({$0["Major"]!.contains("SE")})
            return seStudens
        } else {
            return nil
        }
    }
    
    func getJStudents() -> [studentInfo]? {
        if let allStudents = self.readJSONFromFile() {
            let jStudens = allStudents.filter({$0["Class"]!.contains("03")})
            return jStudens
        } else {
            return nil
        }
    }
    
    func getSStudents() -> [studentInfo]? {
        if let allStudents = self.readJSONFromFile() {
            let sStudens = allStudents.filter({$0["Class"]!.contains("04")})
            return sStudens
        } else {
            return nil
        }
    }
} 
