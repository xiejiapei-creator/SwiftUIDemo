import Foundation

//============存储 Memory===============

struct CarColorByStruct
{
    var color: String
}

// carOne 赋值为黑色
var carOne = CarColorByStruct(color: "黑色")
print("carOne 所具备的颜色是： \(carOne.color)")

// 将 carOne 赋值给 carTwo，并修改 carTwo 颜色
var carTwo = carOne
carTwo.color = "白色"

// 修改后，carOne 颜色没有被改变，仍为黑色
print("carOne 所具备的颜色是： \(carOne.color)")

class CarColorByClass
{
    var color: String
    
    init(color: String) { self.color = color}
}

// carThree 赋值为黑色
var carThree = CarColorByClass(color: "黑色")
print("carThree 所具备的颜色是： \(carThree.color)")

// 将 carFour 赋值给 carThree，并修改 carFour 颜色
var carFour = carThree
carFour.color = "白色"

// 修改后，carThree 被改变，变为白色
print("carThree 所具备的颜色是： \(carThree.color)")

print("是否指向同一个门牌号：\(carThree === carFour)")

//=============CPU 的运作方式============

DispatchQueue.main.async
{
    print("默认情况下，即使不写明，所有代码都运行在这里")
}

DispatchQueue.global(qos: .background).async
{
    print("执行复杂任务")
}
