//
//  ContentView.swift
//  Carls Fun House
//
//  Created by Carl on 2/23/21.
//

import SwiftUI
import JunkDrawer

class CacheMaster: ObservableObject, JunkDrawerOutputPipe{
    @Published var data:String
    private var cacher: Cacher?
    init() {
        data = "No Data Retrieved"
        cacher = Cacher(outSideDataConcern: self)
    }
    
    func acceptUUIDAndIntData(data: String) {
        self.data = data
    }
    
    func saveUUIDAndIntData(data: Array<UUIDAndInt>){
        if let cacher = cacher{
            cacher.saveUUIDAndIntData(data: data)
        } else {
            print("cacher is null")
        }
    }
    
}

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
    @ObservedObject var cacheMaster = CacheMaster()
    @State var counter = 0
    var body: some View {
        VStack{
            Button(action: {
                cacheMaster.saveUUIDAndIntData(data: generate100things())
            }, label: {
                Text("Generate and Store Data")
            })
            Button("Tap me"){self.counter += 1}.padding()
            LabelView(text: String(counter))
            LabelView(text:cacheMaster.data)
                .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
