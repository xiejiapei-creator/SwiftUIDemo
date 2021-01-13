//
//  AnimatedProgress.swift
//  SwiftUIAnimation
//
//  Created by 谢佳培 on 2021/1/9.
//

import SwiftUI

struct AnimatedProgress: View
{
    @State private var progress: CGFloat = 0.0
    
    var body: some View
    {
        ZStack
        {
            Circle()
                .stroke(lineWidth: 6)
                .frame(width: 90, height: 90)
                .foregroundColor(Color(.systemGray6))
            
            Rectangle()
                .frame(width: 24, height: 24)
                .foregroundColor(.orange)
                .cornerRadius(2.0)
            
            Circle()
                .trim(from: 0, to: progress)// 从0画到进度
                .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))// 描边而不是填充
                .frame(width: 90, height: 90)
                .foregroundColor(.orange)
                .rotationEffect(.degrees(-90))// 从上开始画圈，而不是从右0度开始
                .animation(Animation.easeInOut.speed(0.25))// 从0画到1过程的速度
                .onAppear()
                {
                    self.progress = 1.0 //最终停止的进度
                }
        }
    }
}

struct AnimatedProgress_Previews: PreviewProvider
{
    static var previews: some View
    {
        AnimatedProgress()
    }
}

