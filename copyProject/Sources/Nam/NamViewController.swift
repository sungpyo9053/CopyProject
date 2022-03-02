//
//  NamViewController.swift
//  copyProject
//
//  Created by enne on 2022/02/04.
//

import UIKit

// 왼쪽 이미지, 메인타이틀, 서브타이틀 필요
struct SettingModel {
    var leftImageName: String = ""
    var menuTitle: String = ""
    var subTitle: String?
    var rightImageName: String = ""
}

final class NamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var settingModel = [[SettingModel]]()
    @IBOutlet weak var mainTableView: UITableView!
    
    func makeData() {
        
        
        settingModel.append(
                            [SettingModel(
                                            leftImageName: "ProfileImage",
                                            menuTitle: "건이",
                                            subTitle: "강남구 #23354772123",
                                            rightImageName: "chevron.right"
                                        )]
                            )
        
        settingModel.append([
                                SettingModel(leftImageName: "pin", menuTitle: "내 동네 설정", subTitle: nil, rightImageName: ""),
                                SettingModel(leftImageName: "target", menuTitle: "동네 인증하기", subTitle: nil, rightImageName: ""),
                                SettingModel(leftImageName: "tag", menuTitle: "키워드 알림", subTitle: nil, rightImageName: ""),
                                SettingModel(leftImageName: "filter", menuTitle: "관심 카테고리 설정", subTitle: nil, rightImageName: "")
                            ])
        
        settingModel.append([
                                SettingModel(leftImageName: "tile", menuTitle: "모아보기", subTitle: nil, rightImageName: ""),
                                SettingModel(leftImageName: "book", menuTitle: "당근가계부", subTitle: nil, rightImageName: ""),
                                SettingModel(leftImageName: "coupon", menuTitle: "받은 쿠폰함", subTitle: nil, rightImageName: ""),
                                SettingModel(leftImageName: "store", menuTitle: "내 단골 가게", subTitle: nil, rightImageName: "")
                            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .darkGray
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        
        mainTableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "MenuCell")
        
        makeData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 맨 위 첫번째 행
        if indexPath.section == 0 {
            // 셀을 사용하는데 재사용한다 라는 의미(아래 셀이 출력된다 라고 생각)
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            // 메뉴 타이틀 설정
            cell.topTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
            // leftImage가져온다

            cell.profileImageView.image = UIImage(named: settingModel[indexPath.section][indexPath.row].leftImageName)
            // 아래 서브타이틀 설정
            cell.bottomDescription.text = settingModel[indexPath.section][indexPath.row].subTitle
            cell.rightImageView.image = UIImage(systemName: settingModel[indexPath.section][indexPath.row].rightImageName)
            cell.selectionStyle = .none
            
            return cell
        }
        
        // 아래 나머지 메뉴
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        // leftImage가져온다
        cell.leftImageView.image = UIImage(named: settingModel[indexPath.section][indexPath.row].leftImageName)
        // 메뉴 타이틀 설정
        cell.middleTitle.text = settingModel[indexPath.section][indexPath.row].menuTitle
        
        return cell
    }
}
