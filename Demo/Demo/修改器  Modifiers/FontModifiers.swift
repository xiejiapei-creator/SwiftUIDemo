//
//  FontModifiers.swift
//  Demo
//
//  Created by 谢佳培 on 2020/12/8.
//

import SwiftUI

struct FontModifiers: View
{
    @State var textFieldInput = ""
    
    var body: some View
    {
        // 修改器的基本语法及使用顺序
        HStack
        {
            // 先留白再做边框
            Rectangle()
                .foregroundColor(.orange)
                .frame(width: 100, height: 100)
                .padding()
                .border(Color.black)
            
            Spacer()
            
            // 先做边框再留白
            Rectangle()
                .foregroundColor(.orange)
                .frame(width: 100, height: 100)
                .border(Color.black)
                .padding()
        }
        
        
        // 字体
        ScrollView
        {
            Group
            {
                // 动态字体
                Text("示例文本 Sample")
                    .font(.title)
                
                Text("示例文本 Sample")
                    .font(.title2)
                
                Text("示例文本 Sample")
                    .font(.headline)
                
                Text("示例文本 Sample")
                    .font(.body)
                
                Text("示例文本 Sample")
                    .font(.footnote)
                
                // 系统字体
                Text("示例文本 Sample")
                    .font(.system(size: 20, weight: .semibold, design: .default))
                
                Text("示例文本 Sample")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                
                Text("示例文本 Sample")
                    .font(.system(size: 20, weight: .semibold, design: .serif))
                
                Text("示例文本 Sample")
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                
                // 导入字体
                Text("示例文本")
                    .font(.custom("FZKai-Z03S", size: 30))
            }
            
            Divider()
            
            Group
            {
                // 字重
                Text("示例文本 Sample")
                    .fontWeight(.ultraLight)
                
                Text("示例文本 Sample")
                    .fontWeight(.thin)
                
                Text("示例文本 Sample")
                    .fontWeight(.light)
                
                Text("示例文本 Sample")
                    .fontWeight(.regular)
                
                Text("示例文本 Sample")
                    .fontWeight(.medium)
                
                Text("示例文本 Sample")
                    .fontWeight(.semibold)
                
                Text("示例文本 Sample")
                    .fontWeight(.bold)
                
                Text("示例文本 Sample")
                    .fontWeight(.heavy)
            }
            
            Divider()
            
            Group
            {
                // 加粗
                Text("Sample")
                    .bold()
                
                // 倾斜
                Text("Sample")
                    .italic()
                
                // 下划线
                Text("Sample")
                    .underline()
                
                // 删除线
                Text("Sample")
                    .strikethrough()
            }
            
            Divider()
            
            Group
            {
                // 大小写
                Text("示例文本 Sample")
                    .textCase(.uppercase)
                
                Text("示例文本 Sample")
                    .textCase(.none)
                
                Text("示例文本 Sample")
                    .textCase(.lowercase)
            }
            
            Divider()
            
            Group
            {
                // 字间距
                Text("fly")
                    .font(.custom("AmericanTypewriter", size: 80))
                    .kerning(-0.6)
                
                Text("fly")
                    .font(.custom("AmericanTypewriter", size: 80))
                    .tracking(-0.6)
                
                Text("Sample")
                    .kerning(2.0)
                
                Text("Sample")
                    .tracking(2.0)
                
                // 排版
                HStack
                {
                    Text("项目用时：")
                        .bold()
                    
                    Text("4 小时")
                        .baselineOffset(-45.0)
                        .foregroundColor(.orange)
                }
            }
        }
        
        ScrollView
        {
            Group
            {
                // 长文本
                Text("We see, then, that the disappearance of the conscious personality, the predominance of the unconscious personality, the turning by means of suggestion and contagion of feelings and ideas in an identical direction, the tendency to immediately transform the suggested ideas into acts; these, we see, are the principal characteristics of the individual forming part of a crowd. He is no longer himself, but has become an automaton who has ceased to be guided by his will.")
                    .lineLimit(5)
                    .truncationMode(.middle)
                    .lineSpacing(10.0)
                    .allowsTightening(true)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
            }
            
            Divider()
            
            Group
            {
                TextField("文本框", text: $textFieldInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.sentences)
                    .disableAutocorrection(true)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
            }
        }

    }
}

struct FontModifiers_Previews: PreviewProvider
{
    static var previews: some View
    {
        FontModifiers()
    }
}











