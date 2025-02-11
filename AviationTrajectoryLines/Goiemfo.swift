//
//  Goiemfo.swift
//  AviationTrajectoryLines
//
//  Created by Nicolae Chivriga on 12/02/2025.
//

import SwiftUI
import Lottie


struct Goiemfo: View {
    @Environment(\.dismiss) var dismiss
    @State var sbnerosq: Bool = false 
    var body: some View {
        ZStack {
            Image("hkdiuoaxqe")
                .resizable()
                .ignoresSafeArea()
            
            if !sbnerosq {
                LottieView(animation: .named("qirdeg"))
                    .playing(loopMode: .loop)
                    .resizable()
                    .frame(width: 250, height: 250)
            }
            
            WKWebViewRepresentable(url: URL(string: "https://plays.org/game/flight-sim/")!, zaglushka: true) {
                vibr(style: .heavy)
                sbnerosq = true
                
            } dismissing: {
                dismiss()
            }
            .cornerRadius(21)
            
            
            
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading:
                                Button(action: {
            dismiss()
        }, label: {
            Image("grbkp")
        }))

    }
}
