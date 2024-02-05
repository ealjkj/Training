//
//  CheckBox.swift
//  todoList
//
//  Created by intekglobal02 on 2/1/24.
//

import SwiftUI

struct CheckBoxButton: View {
    var active: Bool
    var action: () -> Void

    var body: some View {
        Circle()
            .overlay(
                Circle()
                    .stroke(.black, lineWidth: 2)
            )
            .foregroundStyle(active ? .blue : .white)
            .onTapGesture {
                action()
            }
    }
}

#Preview {
    CheckBoxButton(active: true) {
        
    }
}
