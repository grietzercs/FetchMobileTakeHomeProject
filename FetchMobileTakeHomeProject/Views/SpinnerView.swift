//
//  ProgressView.swift
//  FetchMobileTakeHomeProject
//
//  Created by Colden on 10/29/24.
//

import SwiftUI

struct SpinnerView: View {
    
    var body: some View {
        VStack {
            //Spacer()
            Text("Loading")
                .tint(Color.black)
            ZStack {
                Rectangle()
                    .foregroundStyle(.white)
                    //.frame(width: 250, height: 250, alignment: .center)
                    .frame(alignment: .center)
                    .opacity(0.97)
                    .cornerRadius(20)
                ProgressView().progressViewStyle(.circular)
                    .frame(alignment: .center)
                    //.frame(width: 200, height: 200, alignment: .center)
//                Circle()
//                    .trim(from: 0, to: 0.25)
//                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 25.0, lineCap: .round))
//                    .rotationEffect(Angle(degrees: 360))
//                    .animation(Animation.linear.speed(0.50))
//                    //.animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: true)
//                    .frame(width: 200, height: 200, alignment: .center)
                
            }
            //Spacer()
        }
    }
}
#Preview {
    SpinnerView()
}
