//
//  LaunchScreenView.swift
//  WeatherApp
//
//  Created by Junaid Iqbal Khalidi on 12/12/24.
//

import SwiftUI
import Highcharts
import Foundation


struct LaunchScreenView: View {
    var body: some View {
        ZStack{
            Image("App_background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer() // Push content to the bottom
                Image("Mostly Clear")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200) // Adjust size as needed
                
                Spacer()
                HStack(spacing: 8) {
                    Image(systemName: "sparkle") // Replace with desired SF Symbol
                        .foregroundColor(.white)
                    Text("Powered by Tomorrow.io")
                        .font(.footnote)
                        .foregroundColor(.white)
                        .bold()
                }
                .padding(.bottom, 30)
                
            }
        }
    }
}
#Preview{
    LaunchScreenView()
}
