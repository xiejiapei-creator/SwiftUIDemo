//
//  CircleView.swift
//  Demo
//
//  Created by 谢佳培 on 2020/11/30.
//

import SwiftUI

struct CircleView: View
{
    var body: some View
    {
        VStack
        {
            Circle()
                .shadow(radius: 10)
                .padding()
            Text("⭕️ 样式")
                .font(.largeTitle)
        }
    }
}

struct CircleView_Previews: PreviewProvider
{
    static var previews: some View
    {
        Group {
            CircleView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            CircleView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
        }
    }
}
