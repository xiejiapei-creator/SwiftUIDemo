//
//  LayoutRelatedViews.swift
//  Demo
//
//  Created by 谢佳培 on 2020/12/4.
//

import SwiftUI

struct LayoutRelatedViews: View
{
    var body: some View
    {
        VStack
        {
            VStack
            {
                VStack
                {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                }
                .foregroundColor(.orange)
                .frame(width: 100, height: 200)
                .padding()
                .background(Color.white)
                .cornerRadius(25)
                .shadow(radius: 10)
                
                Text("VStack")
                    .font(.headline)
            }

            Divider().padding()
            
            VStack
            {
                HStack
                {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                }
                .foregroundColor(.blue)
                .frame(width: 200, height: 100)
                .padding()
                .background(Color.white)
                .cornerRadius(25)
                .shadow(radius: 10)
                
                Text("HStack")
                    .font(.headline)
            }
            
            Divider().padding()
            
            VStack
            {
                ZStack
                {
                    RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                        .offset(CGPoint(x: -5, y: -3))
                    RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                        .offset(CGPoint(x: 5, y: 16))
                }
                .opacity(0.7)
                .foregroundColor(.red)
                .frame(width: 200, height: 100, alignment: .center)
                .padding()
                .padding(.bottom)
                .background(Color.white)
                .cornerRadius(25)
                .shadow(radius: 10)
                
                Text("ZStack")
                    .font(.headline)
            }
        }
    }
}

struct LayoutRelatedViews_Previews: PreviewProvider {
    static var previews: some View {
        LayoutRelatedViews()
    }
}




