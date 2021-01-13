//
//  ContentsRelatedViews.swift
//  Demo
//
//  Created by 谢佳培 on 2020/12/7.
//

import SwiftUI

struct ContentsRelatedViews: View
{
    var columns = [GridItem(.adaptive(minimum: 200, maximum: 350), spacing: 15)]
    var array: [Row] = [
        Row(label: "项目总用时", image: "clock", value: "50", unit: "分钟"),
        Row(label: "当前进行的项目", image: "circles.hexagonpath.fill", value: "3", unit: "个"),
        Row(label: "获得成就勋章", image: "star.fill", value: "5", unit: "枚"),
    ]
    var targetDurations = ["15 分钟", "30 分钟", "1 小时", "2 小时","3 小时"]
    @State private var showReminderOnMainScreen = false
    @State private var sendOutNoticification = false
    @State private var selectedDuration = 0
    
    var body: some View
    {
        TabView
        {
            // 列表
            List
            {
                CardView()
                CardView()
                CardView()
                CardView()
                CardView()
            }
            .tabItem
            {
                Image(systemName: "doc.append")
                Text("项目")
            }
            
            // 网格
            NavigationView
            {
                ScrollView
                {
                    LazyVGrid(columns: columns, spacing: 8)
                    {
                        ForEach(array)
                        { row in
                            // 项目
                            GroupBox(label: Label(row.label, systemImage: row.image))
                            {
                                // 数值
                                ValueView(value: row.value, unit: row.unit)
                            }
                            // 样式
                            .groupBoxStyle(GrayGroupBoxStyle(color: .orange, destination: EmptyView()))
                        }
                    }
                    .padding(.top)
                    .padding(.horizontal)
                }
                .background(Color(.systemGroupedBackground))
                .navigationBarTitle("项目记录")
            }
            .tabItem
            {
                Image(systemName: "textformat.123")
                Text("统计")
            }
            
            // 表单
            NavigationView
            {
                Form
                {
                    Section(header: Text("每日目标"))
                    {
                        Toggle(isOn: $showReminderOnMainScreen)
                        {
                            Text("显示目标")
                        }
                        
                        Toggle(isOn: $sendOutNoticification)
                        {
                            Text("推送提醒")
                        }
                        
                        Picker(selection: $selectedDuration, label: Text("目标时常"))
                        {
                            ForEach(0..<targetDurations.count)
                            {
                                Text(self.targetDurations[$0])
                            }
                        }
                    }
                    
                    Section(header: Text("帮助与反馈"))
                    {
                        Button(action: { })
                        {
                            Text("帮助指南")
                        }
                        
                        Button(action: { })
                        {
                            Text("提交反馈")
                        }
                    }
                }
                .navigationBarTitle("设置")
            }
            .tabItem
            {
                Image(systemName: "gearshape")
                Text("设置")
            }
        }
    }
}

struct ContentsRelatedViews_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentsRelatedViews()
    }
}

// 项目面板中的默认卡片
struct CardView: View
{
    var body: some View
    {
        HStack
        {
            Image("icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
                .shadow(radius: 10)
            
            VStack(alignment: .leading)
            {
                Text("独立开发指南")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 5)
                
                Text("将你的创作变现，让世界精彩些。")
                    .font(.body)
                    .foregroundColor(.gray)
                
                HStack
                {
                    Spacer()
                    Image(systemName: "arrowshape.turn.up.right")
                        .font(.system(size: 16, weight: .bold))
                }
            }
            .padding(.leading)
        }
        .frame(maxHeight: 120)
        .cardStyle()
    }
}
 
// 统计面板中的数值——数据结构
struct Row: Identifiable, Hashable
{
    var id = UUID()
    var label: String
    var image: String
    var value: String
    var unit: String
}

// 统计面板中的数值——子视图
struct ValueView: View
{
    var value: String
    var unit: String
    var size: CGFloat = 1
    
    var body: some View
    {
        HStack
        {
            Text(value).font(.system(size: 24 * size, weight: .bold, design: .rounded)) + Text(" \(unit)").font(.system(size: 14 * size, weight: .semibold, design: .rounded)).foregroundColor(.secondary)
            Spacer()
        }
    }
}

// 统计面板中的背景风格
struct GrayGroupBoxStyle<V: View>: GroupBoxStyle
{
    var color: Color
    var destination: V
    var date: Date?
    var size: CGFloat = 1
    
    func makeBody(configuration: Configuration) -> some View
    {
        NavigationLink(destination: destination)
        {
            GroupBox(label: HStack {
                // 标签颜色
                configuration.label.foregroundColor(color)
                
                Spacer()
                
                // 日期
                if date != nil
                {
                    Text("\(date!)")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.trailing, 4)
                }
                
                // 下一页箭头
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(.systemGray4))
                    .imageScale(.small)
            }, content: {
                // 内容间隔
                configuration.content
                    .padding(.top)
            })
            .buttonStyle(PlainButtonStyle())
        }
    }
}



