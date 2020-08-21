//
//  CharacterView.swift
//  SouthParkWidgetApp
//
//  Created by Admin on 8/21/20.
//

import SwiftUI

struct CharacterView: View {
    let character : SPCharacter
    var body: some View {
        //horizontal stack
        HStack {
            CircularImageView(image: Image(character.img)).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center).padding()
            
            Spacer()
            //vertical stack
            VStack{
                Text(character.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                let ageStr = "Age: \(character.age)"
                Text(ageStr).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)

            }.padding()
            Spacer()
        }.frame(width: UIScreen.main.bounds.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(character: cartman)
    }
}
