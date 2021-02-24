//
//  GenerateRandomData.swift
//  Carls Fun House
//
//  Created by Carl on 2/23/21.
//

import Foundation
import JunkDrawer


func generateUUIDWithInteger() -> (String, Int){
    let uuid = UUID.init()
    let randomNumber = Int.random(in: 1...100)
    return (uuid.uuidString, randomNumber)
}

func generate100things() -> Array<UUIDAndInt>{
    var uuidAndRandInts = [UUIDAndInt]()
    for _ in 1...100 {
        let generatedData = generateUUIDWithInteger()
        uuidAndRandInts.append(UUIDAndInt(uuid:generatedData.0, int:Int32(generatedData.1)))
    }
    return uuidAndRandInts
}

func generate100Strings() -> [String]{
    var strings = [String]()
    for _ in 1...100 {
        strings.append(UUID.init().uuidString)
    }
    return strings
}

