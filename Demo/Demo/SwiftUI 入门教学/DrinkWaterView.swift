//
//  DrinkWaterView.swift
//  Demo
//
//  Created by 谢佳培 on 2020/11/30.
//

import SwiftUI

struct DrinkWaterView: View
{
    // 记录用户是否喝水
    @State var isDrink = false
    
    var body: some View
    {
        VStack
        {
            // Z轴嵌套图像
            ZStack
            {
                // 上面是背景图片
                Image("background")
                    .resizable() // 可以重定尺寸
                    .scaledToFit() // 调整背景到适合眼睛视图的大小
                    .clipShape(Circle()) // 裁剪背景为圆形
                
                // 下面为眼睛视图
                Image(systemName: isDrink ? "crown.fill" : "eyes.inverse")
                    .foregroundColor(isDrink ? .yellow : .red)
                    .font(.system(size: 150)) // 调整眼睛视图的大小
            }
            .frame(minHeight: 600) // Z轴嵌套图像最小高度为600
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/) // Z轴嵌套图像阴影半径为10
            
            // 分割线
            Divider()

            // 用一个开关按钮来记录用户的喝水状态
            Toggle(isOn: $isDrink) // isDrink作为参数传入
            {
                Label("你今天喝水了吗？", systemImage: "drop.fill")
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
        .padding() // 间隔
    }
}

struct DrinkWaterView_Previews: PreviewProvider
{
    static var previews: some View
    {
        DrinkWaterView()
    }
}
