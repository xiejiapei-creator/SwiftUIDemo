//
//  AnimatedRotate.swift
//  SwiftUIAnimation
//
//  Created by 谢佳培 on 2021/1/8.
//

import SwiftUI

struct ContentView: View
{
    @State var showAnimation = false
    
    var body: some View
    {
        Button(action: {
            self.showAnimation.toggle()
            
            /*
            withAnimation
            {
                self.showAnimation.toggle()
            }
            */
            
            withAnimation(.easeInOut)
            {
                self.showAnimation.toggle()
            }
        }, label: {
            Image(systemName: "chevron.right.circle")
                .imageScale(.large)
                .rotationEffect(.degrees(showAnimation ? 90 : 0))
                .scaleEffect(showAnimation ? 0.4 : 5)
                .padding()
                //.animation(.default)
                //.animation(.easeInOut)
        })
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
