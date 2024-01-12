//
//  HeaderView.swift
//  ToDoList
//
//  Created by Ellen Stavrou on 28/09/2023.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        
        VStack {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                    .rotationEffect(Angle(degrees: angle))
                
                VStack {
                    
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .bold()
                    
                    Text(subtitle)
                        .font(.system(size:30))
                        .foregroundColor(.white)
                    
                }
                
                .padding(.top, 80)
                
            }
            .frame(width: UIScreen.main.bounds.width * 3, height: 350)
            .offset(y: -150)
            
            Spacer()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "by ellen", angle: 15, background: .blue)
    }
}
