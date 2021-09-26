//
//  ContentView.swift
//  SwiftUIRecyclerView
//
//  Created by 이주연 on 2021/09/26.
//

import SwiftUI

struct ContentView: View {
    let exampleList = [1,2,3,4]
    
    var body: some View {
        // Example use
        RecyclerView(
            setAxis: .HORIZONTAL,
            setShowBar: true,
            setSpacing: 0,
            setContent: {
                ForEach(1...100, id: \.self) { count in
                    /*@START_MENU_TOKEN@*/Text("Placeholder \(count)")/*@END_MENU_TOKEN@*/
                }
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
