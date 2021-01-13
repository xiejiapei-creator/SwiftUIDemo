//
//  ShapeRelatedViews.swift
//  Demo
//
//  Created by 谢佳培 on 2020/12/4.
//

import SwiftUI

struct ShapeRelatedViews: View
{
    var body: some View
    {
        VStack(alignment: .center, spacing: 20, content: {
            Rectangle().frame(width: 100, height: 100)
            
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .frame(width: 100, height: 100)
            
            Circle().frame(width: 100, height: 100)
            
            Capsule().frame(width: 100, height: 50)
            
            Ellipse().frame(width: 100, height: 50)
        })
        .foregroundColor(.yellow)
    }
}

struct ShapeRelatedViews_Previews: PreviewProvider
{
    static var previews: some View
    {
        ShapeRelatedViews()
    }
}

