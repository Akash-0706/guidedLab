

import Foundation

struct RoomType : Equatable{
    var id:Int
    var name : String
    var shortName : String
    var price : Int
    
    static func ==(lhs:RoomType,rhs:RoomType) -> Bool{
        return lhs.id == rhs.id
    }
    static var all:[RoomType]{
        return [RoomType(id: 1, name: "Two Queens", shortName: "2Q", price: 179),
                RoomType(id: 2, name: "One King", shortName: "1K", price: 199),
                RoomType(id: 3, name: "Check", shortName: "C", price: 299)
        ]
    }
}




