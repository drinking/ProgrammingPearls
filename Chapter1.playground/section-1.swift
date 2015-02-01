import UIKit

//1: 如果不缺内存，如何使用一个具有库的来实现一种排序算法以表示和排序集合？

// 快速排序的实现

extension Array{
    var decompose:(head:T,tail:[T])?{
        return count>0 ? (self[0],Array(self[1..<count])):nil
    }
}

func qsort(input:[Int])->[Int]{

    if let (pivot,rest) = input.decompose{
        var less = rest.filter {$0<pivot}
        var greater = rest.filter {$0>=pivot}
        return qsort(less)+[pivot]+qsort(greater)
    }else{
        return []
    }

}

qsort([3,4,2,4,14,4,4,4])

//4: 生成位于0～N-1之间的k个不同的随机序列的随机整数
func createGenerator(count:Int)->(Int,Int)->[Int]{
    //http://stackoverflow.com/questions/24270693/nested-recursive-function-in-swift
    var generator:(Int,Int)->[Int] = {_,_ in return []} // give it a no-op definition
    var total = count
    generator = {min,max in
        if (total <= 0 || min>max) {
            return []
        }else{
            total--;
            var random = Int(arc4random_uniform(UInt32(max-min)))
            var mid = min + random
            return [mid]+generator(min, mid-1)+generator(mid+1, max)
        }
    }
    
    return generator
}




//2: 如何用位逻辑运算（与、或、移位）来实现位向量？
var bitmap = [UInt8](count: 10, repeatedValue: 0)
var source = createGenerator(20)(0,100)
for i in source{
    var origin = i
    var position = Int(i/8)
    var bitposition:UInt8 = 1<<UInt8(i%8)
    bitmap[position] = UInt8(bitposition|bitmap[position])
}

var sorted = qsort(source)

for i in 0...bitmap.count-1{
    var v:UInt8 = bitmap[i]

    for j in 0...7{
        var mask = UInt8(1)<<UInt8(j)
        if (v&mask)>0{
            var origin = 8*i+j
        }

    }
}
