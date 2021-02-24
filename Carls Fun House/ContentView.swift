//
//  ContentView.swift
//  Carls Fun House
//
//  Created by Carl on 2/23/21.
//

import SwiftUI
import JunkDrawer

struct LabelView:View{
    let text:String
    var body: some View{
        print("LabelView")
        return Group {
            if text != "No Data Retrieved"{
                Text(text)
            }
        }
    }
}

struct ContentView: View {
    @State var textToShow = "No Data Retrieved"
    var body: some View {
        let cacher = Cacher()
        VStack{
            Button(action: {
                let data = generate100things()
                cacher.saveSomeUUIDsAndRandomInts(data: data)
                textToShow = cacher.getSavedOutData()
            }, label: {
                Text("Generate and Store Data")
            })
                .padding()
            LabelView(text:textToShow)
                .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
