//
//  KimViewController.swift
//  copyProject
//
//  Created by enne on 2022/02/04.
//

import SnapKit
import UIKit

final class SearchViewController: UIViewController {
    
    let dataModel = DataModel()
    
    private var searchKeywords: [String] = []
    private var filteredKeywords: [String] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.isHidden = true
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationItems()
        setTableViewLayout()
    }

    private func setupNavigationItems() {
        
        navigationItem.title = "검색"
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "검색어를 입력해주세요"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self

        navigationItem.searchController = searchController
    }
    
    private func setTableViewLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() } //테이블뷰가 슈퍼뷰 사이즈에 꽉차게 설정
    }
    
    private func requestSearchKeyword(_ searchKeyword: String) {
        // 2주차에는 네트워크 통신으로 데이터 가져와보기
        let allKeywords = dataModel.getUserInputData()
        
        filteredKeywords = allKeywords.filter({ (keyword) -> Bool in
            return keyword.contains(searchKeyword)
        })
        
        tableView.reloadData()
    }
}

extension SearchViewController: UISearchBarDelegate {
    //입력이 시작됐을때 테이블뷰를 숨겨주기
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        tableView.reloadData()
        tableView.isHidden = false
    }
    //입력이 끝났을때 테이블뷰를 보여주기
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        tableView.isHidden = true
        filteredKeywords = [] //취소버튼을 눌렀을때 기존의 검색 이력이 남지 않게 해주기
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        requestSearchKeyword(searchText)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredKeywords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let keyword = filteredKeywords[indexPath.row]
        
        cell.textLabel?.text = keyword
        
        return cell
    }
}
