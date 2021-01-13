//
//  ImageRelatedModifiers.swift
//  Demo
//
//  Created by 谢佳培 on 2020/12/16.
//

import SwiftUI

struct ImageRelatedModifiers: View
{
    var body: some View
    {
        // 自定义修改器
        VStack(spacing: 30)
        {
            HStack
            {
                // 修改器写在主视图
                Image("22")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 10)
            }
            
            HStack
            {
                // 步骤 1
                Image("22")
                    .resizable()
                    .modifier(AvatarModifier())
                
                // 步骤 2
                Image("21")
                    .resizable()
                    .avatarStyle()
            }
            
            // 特殊步骤：图片视图修改器
            Image("20")
                .imageAvatarStyle()
        }

        // 填充方式
        Image("22")
            .resizable()
            .scaledToFit()
        
        
        // 长宽比
        Image("22")
            .resizable()
            .aspectRatio(3, contentMode: .fit)
        
        VStack
        {
            // 图标尺寸
            Image(systemName: "scribble.variable")
                .foregroundColor(.orange)
                .imageScale(.large)
            
            // 蒙板
            Image("22")
                .resizable()
                .scaledToFill()
                .scaleEffect(2.5)
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .shadow(radius: 10)
                .padding()
                .imageScale(.medium)
        }
        
        // 前景色
        HStack
        {
            Text("绘笔")
                .font(.largeTitle)
                .bold()
                .padding()
                .foregroundColor(.orange)
            
            Image(systemName: "scribble.variable")
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.orange)
        }
        
        // 背景
        HStack
        {
            Text("示例")
                .font(.largeTitle)
                .bold()
                .padding()
                .foregroundColor(.white)
                .background(Color.orange)
            
            Text("示例")
                .font(.largeTitle)
                .bold()
                .padding()
                .foregroundColor(.white)
                .background(
                    Image("21")
                        .resizable()
                )
        }
        
        // 覆盖
        Image("0")
            .resizable()
            .scaleEffect(0.7)
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 260)
            .overlay(
                HStack {
                    Spacer()
                    Text("生日快乐")
                        .font(.headline)
                    Spacer()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.black.opacity(0.7))
                ,alignment: .bottom
            )
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 3)
    }
}

struct ImageRelatedModifiers_Previews: PreviewProvider
{
    static var previews: some View
    {
        ImageRelatedModifiers()
    }
}

// 步骤 1
struct AvatarModifier: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .scaledToFill()
            .scaleEffect(1.5)
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .shadow(radius: 10)
            .padding()
            .imageScale(.medium)
    }
}

// 步骤 2
extension View
{
    func avatarStyle() -> some View
    {
        self.modifier(AvatarModifier())
    }
}

// 特殊步骤：图片视图修改器
extension Image
{
    func imageAvatarStyle() -> some View {
        self
            .resizable()
            .avatarStyle()
    }
}






