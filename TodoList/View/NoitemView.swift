//
//  NoitemView.swift
//  TodoList
//
//  Created by wilson agene on 5/6/22.
//

import SwiftUI

struct NoitemView: View {
    
    @State var animate: Bool = false
    let SecondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("There is no items!!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something ➕")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? SecondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? SecondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7) ,
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .padding(40)
            .onAppear {
                addAnimation()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoitemView_Previews: PreviewProvider {
    static var previews: some View {
        NoitemView()
    }
}
