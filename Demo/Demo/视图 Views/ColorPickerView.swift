//
//  ColorPickerView.swift
//  Demo
//
//  Created by 谢佳培 on 2020/12/7.
//

import SwiftUI

struct ColorPickerView: View
{
    @State private var themeColor = Color(.sRGB, red: 1, green: 1, blue: 0)
    
    var body: some View
    {
        VStack
        {
            ColorPicker("主题色", selection: $themeColor)
                .padding()
            
            
            Menu("菜单")
            {
                Button("打开", action: { })
                Menu("移除")
                {
                    Button("永久删除", action: { })
                    Button("隐藏", action: { })
                }
            }
        }
    }
}

struct ColorPickerView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ColorPickerView()
    }
}
