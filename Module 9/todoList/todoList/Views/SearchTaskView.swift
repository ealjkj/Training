//
//  SearchTaskView.swift
//  todoList
//
//  Created by intekglobal02 on 2/1/24.
//

import SwiftUI

struct SearchTaskView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.green.gradient)
                .ignoresSafeArea()
                
        
            Text("Search")
                .foregroundStyle(.white)
        }
        
    }
}

#Preview {
    SearchTaskView()
}
