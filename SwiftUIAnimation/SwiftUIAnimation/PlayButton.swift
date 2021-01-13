//
//  PlayButton.swift
//  SwiftUIAnimation
//
//  Created by 谢佳培 on 2021/1/9.
//

import SwiftUI

struct PlayButton: View
{
    @State var isPlaying = false
    
    var body: some View
    {
        Button(action: {
            withAnimation(.easeOut(duration: 0.4))
            {
                isPlaying.toggle()
            }
        }, label: {
            if isPlaying
            {
                Image(systemName: "pause.fill")
                    .transition(.scale)
                    .transition(.opacity)
            }
            else
            {
                Image(systemName: "play.fill")
                    .transition(.scale)
                    .transition(.opacity)
            }
        })
    }
}

struct PlayButton_Previews: PreviewProvider
{
    static var previews: some View
    {
        PlayButton()
    }
}
