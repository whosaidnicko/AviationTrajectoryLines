//
//  Ruinsgwq.swift
//  AviationTrajectoryLines
//
//  Created by Nicolae Chivriga on 11/02/2025.
//

import SwiftUI

struct Ruinsgwq: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image("dhoeopamb")
                .resizable()
                .ignoresSafeArea()
            
            Image("keibsnwq")
                .resizable()
                .scaledToFit()
                .padding(23.5)
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading:
                                Button(action: {
            dismiss()
        }, label: {
            Image("boitba")
        })
    )
    }
}
