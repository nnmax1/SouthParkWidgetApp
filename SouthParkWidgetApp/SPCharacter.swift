//
//  SPCharacter.swift
//  SouthParkWidgetApp
//
//  Created by Admin on 8/21/20.
//

import Foundation

struct SPCharacter : Identifiable, Codable{
    let img : String
    let name : String
    let age : Int
    var id : String {img}
}

let cartman = SPCharacter(img: "cartman", name:"Eric Cartman", age: 8)
let randy = SPCharacter(img: "randyMarsh", name: "Randy Marsh", age: 45)
let butters = SPCharacter(img: "ButtersStotch", name: "Leopold Stotch", age: 8)

let spCharArr = [cartman, randy, butters]
