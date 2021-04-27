//
//  CollectionViewDataSource.swift
//  BanchanCode
//
//  Created by Song on 2021/04/20.
//

import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return CollectionViewConstant.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CollectionViewConstant.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishCell.identifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.identifier, for: indexPath) as! SectionHeaderView
        
        let sectionHeaderTitle = SectionHeaderTitle()
        
        headerView.sectionTitleLabel.text = sectionHeaderTitle.setTitle(by: indexPath.section)
        //이 부분은 후에 동적으로 받아오는 만큼 갯수를 저장하는 형태로 바꾸어주어야할듯.
        headerView.countOfMenus = CollectionViewConstant.numberOfItems
        
        return headerView
    }
    
    
}
