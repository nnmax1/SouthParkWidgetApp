//
//  SouthParkWidget.swift
//  SouthParkWidget
//
//  Created by Admin on 8/21/20.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    @AppStorage("spCharacter", store: UserDefaults(suiteName:"group.com.nnmax1.SouthParkWidgetApp"))
    var spData : Data = Data()

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), hero: SPCharacter(image: "cartman", name: "Eric Cartman", age: 8))
       }

       func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
           
           
           if let sp = try? JSONDecoder().decode(SPCharacter.self, from: spData) {
               let entry = SimpleEntry(date: Date(), configuration: configuration, spCharacter: sp)
               completion(entry)
           }
           
           
       }

       func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
           
           if let sp = try? JSONDecoder().decode(SPCharacter.self, from: spCharacter) {
               let date = Date()
               
               let entry = SimpleEntry(date: date, configuration: configuration, spData: sp)

               let timeline = Timeline(entries: [entry], policy: .never)
               completion(timeline)
           }
           
       }
   }

   struct SimpleEntry: TimelineEntry {
       let date: Date
       let configuration: ConfigurationIntent
    let spCharacter : SPCharacter
   }

   struct SouthParkWidgetEntryView : View {
       var entry: Provider.Entry

       var body: some View {
           CircularImageView(image: Image(entry.spCharacter.img))
       }
   }

   @main
   struct SouthParkWidget: Widget {
       let kind: String = "SouthPark_Widget"

       var body: some WidgetConfiguration {
           
           IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
                SouthParkWidgetEntryView(entry: entry)
           }
           .configurationDisplayName("South Park Widget")
           .description("South Park Widget")
       }}
