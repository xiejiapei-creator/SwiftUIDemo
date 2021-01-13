//
//  LayoutRelatedModifiers.swift
//  Demo
//
//  Created by 谢佳培 on 2020/12/16.
//

import SwiftUI

struct LayoutRelatedModifiers: View
{
    @State var textFieldInput = ""
    @State var isHidden = false
    
    var body: some View
    {
        // 视图大小的运作原理
        VStack
        {
            Text("ABC")
                .font(.largeTitle)
                .border(Color.orange)
            
            Rectangle()
                .foregroundColor(.orange)
                .edgesIgnoringSafeArea(.all)
        }
        
        // 框架与尺寸
        HStack(spacing: 0)
        {
            Rectangle()
                .foregroundColor(.orange)
                .frame(minWidth: 100, idealWidth: 200, maxWidth: 300)
                .frame(height: 200)
            
            Rectangle()
                .foregroundColor(.red)
                .frame(width: 200, height: 200)
        }
        .padding()
        
        // 边缘安全区
        Rectangle()
            .foregroundColor(.orange)
            .edgesIgnoringSafeArea(.all)
        
        // 键盘安全区
        VStack
        {
            TextField("文本框", text: $textFieldInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Rectangle()
                .orangeCardStyle()
                .padding()
                .ignoresSafeArea(.keyboard)
        }
        
        // 隐藏文本框
        VStack
        {
            if !isHidden
            {
                TextField("文本框", text: $textFieldInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .hidden()
            }
            
            Toggle("Hide", isOn: $isHidden)
                .labelsHidden()
            
            Rectangle()
                .orangeCardStyle()
                .padding()
                .ignoresSafeArea(.keyboard)
        }
        
        // 转化为占位符
        VStack(alignment: .leading)
        {
            VStack(alignment: .leading)
            {
                Text("大标题")
                    .font(.largeTitle)
                    .border(Color.orange)
                
                Text("一些非常复杂的正文内容")
                    .font(.body)
                    .foregroundColor(.blue)
            }
            
            VStack(alignment: .leading)
            {
                Text("大标题")
                    .font(.largeTitle)
                Text("一些非常复杂的正文内容")
                    .font(.body)
                    .foregroundColor(.blue)
            }
            .redacted(reason: .placeholder)
        }
    }
}

struct LayoutRelatedModifiers_Previews: PreviewProvider
{
    static var previews: some View
    {
        LayoutRelatedModifiers()
    }
}

// 自定义修改器
struct OrangeCardModifier: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .foregroundColor(.orange)
            .background(Color.orange)
            .cornerRadius(15)
            .shadow(radius: 3)
    }
}

// 用于将打包好的自定义修改器转化为易用函数
extension View
{
    func orangeCardStyle() -> some View
    {
        self.modifier(OrangeCardModifier())
    }
}




