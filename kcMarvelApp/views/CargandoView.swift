//
//  CargandoView.swift
//  kcMarvelApp
//
//  Created by Ramón Menor Molina on 13/1/22.
//

import SwiftUI

struct CargandoView: View {
    @State var isLoading = false
    
    var body: some View {
        ZStack {
            Color(.black)
                    .edgesIgnoringSafeArea(.all)
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, dash: [4, 20]))
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(.green)
                .onAppear() {
                    withAnimation(Animation.linear(duration: 2.0).repeatForever(autoreverses: false))
                    {
                        isLoading.toggle()
                    }
                }
                .rotationEffect(Angle(degrees: isLoading ? 0 : 360))

            Text("Cargando series...")
                .foregroundColor(.yellow)
                .font(.system(size: 40, weight: .bold, design: .default))
        }
    }
}

struct CargandoView_Previews: PreviewProvider {
    static var previews: some View {
        CargandoView()
    }
}
