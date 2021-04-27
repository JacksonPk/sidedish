//
//  ViewController.swift
//  BanchanCode
//
//  Created by jinseo park on 4/20/21.
//

import UIKit

class MainPageViewController: UIViewController {
    
    @IBOutlet weak var dishCollectionView: UICollectionView!
    private var mainPageDelegate: MainPageCollectionViewDelegate?
    private var mainPageDataSource: MainPageCollectionViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainPageDelegate = MainPageCollectionViewDelegate()
        mainPageDataSource = MainPageCollectionViewDataSource()
        
        let mainViewModel = makeDishesListViewModel(category: Observable(MainCategory()))
        let soupViewModel = makeDishesListViewModel(category: Observable(SoupCategory()))
        let sideViewModel = makeDishesListViewModel(category: Observable(SideCategory()))
        
        mainViewModel.load()
        soupViewModel.load()
        sideViewModel.load()
        
        mainPageDataSource?.viewModels = [mainViewModel, soupViewModel, sideViewModel]
        
        dishCollectionView.delegate = mainPageDelegate
        dishCollectionView.dataSource = mainPageDataSource
        
        bind(to: mainViewModel)
        bind(to: soupViewModel)
        bind(to: sideViewModel)
        
        registerXib()
    }
    
    func makeFetchDishesUseCase() -> FetchDishesUseCase {
        return DefaultFetchDishesUseCase()
    }
    
    func makeDishesListViewModel(category: Observable<Categorizable>) -> DishesListViewModel {
        return DefaultDishesListViewModel(fetchDishesUseCase: makeFetchDishesUseCase(), category: category)
    }
    
    private func registerXib() {
        let dishNib = UINib(nibName: DishCell.reuseIdentifier, bundle: nil)
        dishCollectionView.register(dishNib, forCellWithReuseIdentifier: DishCell.reuseIdentifier)
        
        let headerNib = UINib(nibName: SectionHeaderView.reuseIdentifier, bundle: nil)
        dishCollectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.reuseIdentifier)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        dishCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func bind(to viewModel: DishesListViewModel) {
        viewModel.category.observe(on: self) { [weak self] _ in self?.updateItems() }
        viewModel.items.observe(on: self) { [weak self] _ in self?.updateItems() }
    }
    
    private func updateItems() {
        dishCollectionView.reloadData()
    }
}
