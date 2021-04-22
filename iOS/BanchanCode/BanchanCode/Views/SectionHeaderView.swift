//
//  SectionHeaderView.swift
//  BanchanCode
//
//  Created by jinseo park on 4/21/21.
//

import UIKit
import Toaster

class SectionHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var sectionTitleLabel: UILabel!
    var countOfMenus: Int = 0
    
    static let identifier = "SectionHeaderView"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        sectionTitleLabel.text = "모두가 좋아하는 든든한 메인 요리"
//        countOfMenus = 0
    }
    
    //섹션 라벨을 클릭시 이벤트발생
    //현재는 라벨만존재하고 View가 없어서 라벨에 붙임.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //총 몇개인지를 어떻게 받아올까?
        Toast(text: "\(countOfMenus)개 상품이 등록되어 있습니다").show()
    }
}
