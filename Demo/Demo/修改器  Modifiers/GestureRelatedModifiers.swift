//
//  GestureRelatedModifiers.swift
//  Demo
//
//  Created by 谢佳培 on 2020/12/22.
//

import SwiftUI

struct GestureRelatedModifiers: View
{
    @State var currentGesture = "无"
    @State var isLongPressed = false
    @State var currentImageName = "questionmark"
    @State var imageNames = ["hare", "tortoise", "cloud", "moon", "wind"]
    
    // 缩放手势
    @GestureState var magnifyBy = CGFloat(1.0)
    var magnification: some Gesture
    {
        MagnificationGesture()
            .updating($magnifyBy)
            { (currentState, gestureState, transaction) in
                gestureState = currentState
            }
    }
    
    @State var simultaneousMagnifyBy = CGFloat(1.0)
    var simultaneousMagnification: some Gesture
    {
        MagnificationGesture()
            .onChanged
            { magnifyBy in
                self.simultaneousMagnifyBy = magnifyBy
            }
    }
    
    // 旋转手势
    @State var angle = Angle(degrees: 0.0)
    var rotation: some Gesture
    {
        RotationGesture()
            .onChanged
            { angle in
                self.angle = angle
            }
    }
    
    // 拖拽手势
    @State var isDragging = false
    var drag: some Gesture
    {
        DragGesture()
            .onChanged
            { _ in
                isDragging = true
            }
            .onEnded
            { _ in
                isDragging = false
            }
    }
    
    var body: some View
    {
        VStack
        {
            Text("识别出的手势：\(currentGesture)")
                .font(.largeTitle)
                .bold()

            Divider()

            // 长按手势
            RoundedRectangle(cornerRadius: 25.0)
                .aspectRatio(1, contentMode: .fit)
                .foregroundColor(isLongPressed ? .red : .black)
                .padding()
                .onLongPressGesture
                {
                    currentGesture = "长按手势"
                    isLongPressed.toggle()
                }

            // 轻点手势
            ZStack
            {
                RoundedRectangle(cornerRadius: 25.0)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundColor(.blue)
                    .shadow(radius: 10)

                Image(systemName: currentImageName)
                    .resizable()
                    .scaleEffect(0.3)
                    .scaledToFit()
            }
            .padding()
            .onTapGesture
            {
                currentImageName = imageNames.randomElement()!
                currentGesture = "轻点手势"
            }

            // 缩放手势
            Circle()
                .foregroundColor(.blue)
                .frame(width: 200 * magnifyBy, height: 200 * magnifyBy, alignment: .center)
                .gesture(magnification)
            
            // 旋转手势
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 200, height: 200)
                .rotationEffect(angle)
                .gesture(rotation)
            
            // 拖拽手势
            Circle()
                .fill(isDragging ? Color.orange : Color.blue)
                .frame(width: 200, height: 200)
                .gesture(drag)

            // 自定义手势
            let customGesture = simultaneousMagnification.simultaneously(with: rotation)
            Image("6")
                .gesture(customGesture)
                .rotationEffect(angle)
                .scaleEffect(simultaneousMagnifyBy)
                .animation(.easeInOut)
            
            // 手势优先级
            VStack
            {
                Text("手势优先级")
                    .font(.body)
                    .bold()
                
                Image("6")
                    .gesture(rotation)
                    .rotationEffect(angle)
            }
            .highPriorityGesture(simultaneousMagnification)
            .scaleEffect(simultaneousMagnifyBy)
        }

    }
}

struct GestureRelatedModifiers_Previews: PreviewProvider
{
    static var previews: some View
    {
        GestureRelatedModifiers()
    }
}
