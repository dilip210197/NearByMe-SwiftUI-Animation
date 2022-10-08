//
//  ContentView.swift
//  NearByMeAnimation
//
//  Created by Ovi on 09/10/22.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                AmimeContentView(imageName: "profile1")
                Spacer()
            }
            Spacer()
            HStack{
                HStack{
                    AmimeContentView(imageName: "profile2")
                        .offset(x: +30,y: +120)
                    Spacer()
                }
                Spacer()
                AmimeContentView(imageName: "profile3")
                    .offset(x: -30,y: -120)
            }
            Spacer()
            AmimeContentView(imageName: "profile4")
                .offset(y: +70)
        }
     
        .background(
            LinearGradient(colors: [.green,.yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
    }

}

struct AmimeContentView: View {
    
    var imageName:String
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay{
                    Circle().stroke(lineWidth: 0.7)
                        .foregroundColor(.green)
                        .scaleEffect(animationAmount)
                        .opacity(5 - (animationAmount + 1))
                        .animation(.easeIn.speed(0.07).repeatForever(autoreverses: false), value: animationAmount)
                    Circle().stroke(lineWidth: 0.5)
                        .foregroundColor(.red)
                        .scaleEffect(animationAmount)
                        .opacity(5 - animationAmount)
                        .animation(.easeIn.speed(0.10).repeatForever(autoreverses: false), value: animationAmount)
                }
            .onAppear{
                animationAmount = 8
            }
        }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
