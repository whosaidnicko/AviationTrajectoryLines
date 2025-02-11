//
//  Muingebnzqa.swift
//  AviationTrajectoryLines
//
//  Created by Nicolae Chivriga on 11/02/2025.
//

import SwiftUI

struct Muingebnzqa: View {
    @State var sokbeg: Bool = false
    var body: some View {
        ZStack {
            // bg
            Image("dhoeopamb")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                // naci rule
                Image("souoashr")
                
                    .offset(y: sokbeg ? 0 : -UIScreen.main.bounds.height)
                    .animation(Animation.bouncy.delay(0.3), value: sokbeg)
                
                HStack {
                    NavigationLink {
                        SetbisvbkVi()
                    } label: {
                        Image("sben")
                            .resizable()
                            .scaledToFit()
                    }

                   
                        .offset(y: -40)
                        .scaleEffect(sokbeg ? 1 : 0)
                        .animation(Animation.bouncy.delay(0.45), value: sokbeg)
                       
                    Image("lu1q")
                        .resizable()
                        .scaledToFit()
                        .mask({
                            Rectangle()
                                .frame(width: sokbeg ? 108 : 0)
                                .animation(Animation.linear(duration: 1).delay(0.5), value: sokbeg)
                        })
                        .offset(x: -50)
                    NavigationLink {
                        Goiemfo()
                    } label: {
                        Image("plsepa")
                            .resizable()
                            .scaledToFit()
                    }

                   
                        .offset(x: -60, y: 15)
                        .scaleEffect(sokbeg ? 1 : 0)
                        .animation(Animation.bouncy.delay(1.4), value: sokbeg)
                    
                    Image("liqu2q")
                        .resizable()
                        .scaledToFit()
                        .mask({
                            Rectangle()
                                .frame(width: sokbeg ? 125.74 : 0)
                                .animation(Animation.linear(duration: 1).delay(1.4), value: sokbeg)
                        })
                        .offset(x: -70, y: 36)
                    
                    NavigationLink {
                        Ruinsgwq()
                    } label: {
                        Image("ilpgqf")
                            .resizable()
                            .scaledToFit()
                          
                    }
                    .offset(x: -120, y: 10)
                    .scaleEffect(sokbeg ? 1 : 0)
                    .animation(Animation.bouncy.delay(2), value: sokbeg)

                    
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .navigationBarBackButtonHidden()
            .onAppear() {
                sokbeg = true
            }
        }
    }
}
