//
//  HudView.swift
//  Planet Terp
//
//  Created by Segun Awe on 12/16/21.
//

import SwiftUI

struct HUD<Content: View>: View {
  @ViewBuilder let content: Content

  var body: some View {
    content
      .padding(.horizontal, 12)
      .padding(16)
      .background(
        Capsule()
          .foregroundColor(Color("offWhite"))
          .shadow(color: Color(.black).opacity(0.16), radius: 12, x: 0, y: 5)
      )
  }
}


