//
//  SeachBarView.swift
//  Planet Terp
//
//  Created by Segun Awe on 2/12/21.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    @State private var isEditing = false
    var offWhite = Color("offWhite")
 
    func dismissKey() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        HStack {
            TextField("Course Number 115,120,140", text: $text)
                .foregroundColor(.white)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color.blue)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                 
                        if isEditing {
                            Button(action: {
                                self.text = ""
                               

                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.white)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .modifier(BarShadows())
                .onTapGesture {
                    isEditing = true
                }
 
            if text != "" {
                Button(action: {
                    dismissKey()
                    isEditing = false
                    self.text = ""
                    
                }) {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }
               .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
            
        }
    }
}

struct SeachBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant(""))
    }
}
