//
//  Qetsfenajv.swift
//  AviationTrajectoryLines
//
//  Created by Nicolae Chivriga on 11/02/2025.
//

import SwiftUI
import Lottie

struct Qetsfenajv: View {
    @State var golse: Bool = false
    var body: some View {
        ZStack {
            // Idem gksap
            NavigationLink("", destination: Muingebnzqa(), isActive: $golse)
            // obouiha bg here
            Image("dhoeopamb")
                .resizable()
                .ignoresSafeArea()
            
            Sikhuyqzxby()
            

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    AnimatedText(
                        text: "LOADING...",
                        animation: TextLoadingAnimation(
                            font: .system(size: 15, weight: .bold, design: .rounded),
                            textColor: .white,
                            startOffset: 15,
                            endOffset: -15,
                            duration: 0.6,
                            staggerDelay: 0.1,
                            letterSpacing: 8
                        )
                    )
                }
            }
            .padding()
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.4453) {
                    golse = true
                }
            }
            .sigjrembaspwer()
        }
    }
}

import SwiftUI

struct Sikhuyqzxby: View {
    @State private var planeOffset: CGFloat = 0
    @State private var textOpacity: Double = 0.3
    @State private var rotationAngle: Double = 0

    var body: some View {
        ZStack {
            // Space Background with Twinkling Stars
          
                    ForEach(0..<20, id: \.self) { _ in
                        Circle()
                            .fill(Color.white.opacity(Double.random(in: 0.3...1.0)))
                            .frame(width: CGFloat.random(in: 2...4), height: CGFloat.random(in: 2...4))
                            .offset(
                                x: CGFloat.random(in: -150...150),
                                y: CGFloat.random(in: -250...250)
                            )
                            .animation(Animation.easeInOut(duration: Double.random(in: 2...10)).repeatForever(autoreverses: true), value: planeOffset)
                    }
                
                .onAppear {
                    startPlaneAnimation()
                    startVibrationLoop()
                }
        }
    }

    // Moves the airplane in a circular path
    func startPlaneAnimation() {
    
            planeOffset = .pi * 2
     
        
    }

    // Makes text glow in & out
    

    // Adds vibration every 2 seconds
    func startVibrationLoop() {
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }
    }
}

import SwiftUI

struct AnimatedText: View {
    let text: String
    let animation: TextLoadingAnimation

    @State private var offsets: [CGFloat]
    @State private var opacities: [Double]

    init(text: String, animation: TextLoadingAnimation) {
        self.text = text
        self.animation = animation
        self._offsets = State(initialValue: Array(repeating: animation.startOffset, count: text.count))
        self._opacities = State(initialValue: Array(repeating: animation.startOpacity, count: text.count))
    }

    var body: some View {
        HStack(spacing: animation.letterSpacing) {
            ForEach(Array(text.enumerated()), id: \.offset) { index, letter in
                Text(String(letter))
                    .font(animation.font)
                    .fontWeight(.bold)
                    .foregroundColor(animation.textColor)
                    .offset(y: offsets[index])
                    .opacity(opacities[index])
                    .animation(
                        Animation.easeInOut(duration: animation.duration)
                            .repeatForever()
                            .delay(Double(index) * animation.staggerDelay),
                        value: offsets[index]
                    )
            }
        }
        .onAppear {
            for i in 0..<text.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * animation.staggerDelay) {
                    offsets[i] = animation.endOffset
                    opacities[i] = animation.endOpacity
                }
            }
        }
    }
}

// Struct for customizing animation behavior
struct TextLoadingAnimation {
    var font: Font = .largeTitle
    var textColor: Color = .blue
    var startOffset: CGFloat = 10
    var endOffset: CGFloat = -10
    var startOpacity: Double = 0.3
    var endOpacity: Double = 1.0
    var duration: Double = 0.8
    var staggerDelay: Double = 0.1
    var letterSpacing: CGFloat = 5
}
