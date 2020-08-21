//
//  ContentView.swift
//  SouthParkWidgetApp
//
//  Created by Admin on 8/21/20.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("spCharacter", store: UserDefaults(suiteName:"group.com.nnmax1.SouthParkWidgetApp"))
    var spData : Data = Data()
    var body: some View {
        VStack {
            ForEach(spCharArr){ person in
                //display person in character view,
                //then add gesture recog.
                CharacterView(character: person).onTapGesture {
                    saveToDefault(character: person)
                }
            }
        }
    }
}
func saveToDefault(character : SPCharacter){
    if let data = try? JSONEncoder().encode(character) {
        self.spData = data

    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    }
