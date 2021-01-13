//
//  ContentView.swift
//  Demo
//
//  Created by 谢佳培 on 2020/11/27.
//

import SwiftUI

struct ContentView: View
{
    var body: some View
    {
        // 文本纵向排列
        VStack
        {
            Text("天助自助者")
                .font(.headline) // 小标题的字体
            Text("God helps those who help themselves")
                .font(.system(.headline, design:.rounded)) // 小标题的字体 + 圆体字
        }
        .foregroundColor(.blue) // 白色字体
        .padding() // 字体四周留边距
        .contextMenu() // 增加点按菜单
        {
            // 按钮水平排列
            HStack
            {
                Button(action: {
                    let pasteboard = UIPasteboard.general // 粘贴板
                    pasteboard.string = "天助自助者" // 复制的文本
                }) {
                    HStack // 按钮里面嵌套了水平排列
                    {
                        Text("Copy")
                        Image(systemName: "rectangle")
                    }
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}


