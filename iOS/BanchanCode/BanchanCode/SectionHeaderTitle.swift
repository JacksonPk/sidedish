//
//  SectionHeaderData.swift
//  BanchanCode
//
//  Created by jinseo park on 4/22/21.
//

//MVVM구조에서 어디로 들어가야하는지...
//Data->Repository 인 것으로 예상한다 그러면 ViewModel?? 아니면

public class SectionHeaderTitle {
    
    public enum Title: Int {
        case main = 0
        case soup
        case side
    }
    
    var text: String
//    var count: Int
    
    init() {
        text = ""
//        count = 0
    }
    
    func setTitle(by indexPath: Int) -> String {
        switch Title(rawValue: indexPath) {
        case .main:
            text = "모두가 좋아하는 든든한 메인 요리"
        case .soup:
            text = "정성이 담긴 뜨끈뜨끈 국물 요리"
        case .side:
            text = "식탁을 풍성하게 하는 정갈한 밑반찬"
        default:
            break
        }
        return text
    }
    
//    public var countOfMenus: Int {
//        get {
//            return count
//        }
//        set(newValue) {
//            count = newValue
//        }
//    }
}

