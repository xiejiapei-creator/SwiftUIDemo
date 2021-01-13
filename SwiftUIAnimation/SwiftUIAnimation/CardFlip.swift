//
//  CardFlip.swift
//  SwiftUIAnimation
//
//  Created by 谢佳培 on 2021/1/9.
//

import SwiftUI

struct CardFlip: View
{
    @State private var front = false
    
    var body: some View
    {
        Image(systemName: "suit.club.fill")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
            .frame(width: 200, height: 200)
            .foregroundColor(front ? .blue : .black)
            .cornerRadius(20.0)
            .shadow(radius: 20.0)
            .scaleEffect(front ? 1.2 : 0.8)// 缩放
            .rotation3DEffect(Angle(degrees: front ? 0 : 180),axis: (x: 0.0, y: 1.0, z: 0.0))// 立体绕Y轴翻转180度
            .animation(.spring(response: 2.0))// 弹簧效果的时间
            .onTapGesture
            {
                self.front.toggle()
            }
    }
}

struct CardFlip_Previews: PreviewProvider
{
    static var previews: some View
    {
        CardFlip()
    }
}
