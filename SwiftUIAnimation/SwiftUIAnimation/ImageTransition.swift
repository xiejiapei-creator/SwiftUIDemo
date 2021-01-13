//
//  ImageTransition.swift
//  SwiftUIAnimation
//
//  Created by 谢佳培 on 2021/1/9.
//

import SwiftUI

struct ImageTransition: View
{
    @State var playTransition = false
    
    var body: some View
    {
        VStack
        {
            Image("Dandelion")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .scaleEffect(playTransition ? 0.2 : 1)
                .onTapGesture
                {
                    withAnimation
                    {
                        playTransition.toggle()
                    }
                }
        }
        
        VStack
        {
            if playTransition
            {
                Image("Dandelion")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .transition(.asymmetric(insertion: .slide, removal: .scale))
            }
            
            Button(action: {
                withAnimation
                {
                    playTransition.toggle()
                }
            }) {
                Text("播放动画")
            }
        }
    }
}

struct ImageTransition_Previews: PreviewProvider
{
    static var previews: some View
    {
        ImageTransition()
    }
}
