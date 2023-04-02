//
//  SpinnerView.swift
//  KCSuperpoderesIOS_entrega
//
//  Created by Camila Laura Lopez on 2/4/23.
//

import SwiftUI

struct SpinnerView: View {
    var frameSize: CGFloat = 72
    @State private var isAnimating = false
    
    var foreverAnimation: Animation {
        Animation
            .spring(response: 1, dampingFraction: 0.7, blendDuration: 0)
            .repeatForever(autoreverses: true)
    }
    
    var body: some View {
        VStack{
            Image("marvel-app-icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(50)
                .frame(width: frameSize)
                .rotationEffect(Angle(degrees: isAnimating ? 360.0 : 0.0))
                .animation(foreverAnimation)
                .onAppear {
                    isAnimating = true
                }
            Text("Cargando..")
                .bold()
                .foregroundColor(.black)
                .opacity(0.8)
                .font(.subheadline)
                .padding([.leading, .trailing], 20)
                .padding([.bottom, .top], 10)
        }
        .padding(20)
    }
 }

struct SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView()
    }
}
