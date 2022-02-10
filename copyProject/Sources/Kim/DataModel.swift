//
//  data.swift
//  copyProject
//
//  Created by 김서진 on 2022/02/08.
//

import Foundation

class DataModel {
    
    var userInputData: [String]
    
    init() {
        self.userInputData = ["대치동", "신사동", "개포동", "일원동", "잠실동"]
    }
    
    func getUserInputData() -> [String] {
        return userInputData
    }
}

