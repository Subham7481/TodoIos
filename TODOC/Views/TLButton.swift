//
//  TLButton.swift
//  TODOC
//
//  Created by Subham Patel on 25/09/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: ()-> Void
    var body: some View {
        Button{
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "value", background: .pink){
        //Action
    }
}
