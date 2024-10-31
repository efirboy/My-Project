//
//  ViewController.swift
//  UITableView and UICollectionView (Instagram)
//
//  Created by Alexandr Garkalin on 17.10.2024.
//

import UIKit

final class HomeViewController: UIViewController {

    //MARK: - Объекты для навигационного бара
    private let instagramButton = UIButton(type: .custom)
    private let heartButton = UIButton(type: .custom)
    private let messageButtonItem = UIBarButtonItem(image: UIImage(named: "message"), style: .plain, target: nil, action: nil)
    
    //MARK: - Объекты для таблицы
    private var myTableView = UITableView()
    private var refreshControl = UIRefreshControl()
    
    //MARK: - Объекты для сторис
    private let yourStorysPhoto = UIImageView()
    private let neymarStorysPhoto = UIImageView()
    private let messiStorysPhoto = UIImageView()
    private let ronaldoStorysPhoto = UIImageView()
    private let mbappeStorysPhoto = UIImageView()
    private let viniciusStorysPhoto = UIImageView()
    private let modricStorysPhoto = UIImageView()
    private let yourLabel = UILabel()
    private let neymarLabel = UILabel()
    private let messiLabel = UILabel()
    private let ronaldoLabel = UILabel()
    private let mbappeLabel = UILabel()
    private let viniciusLabel = UILabel()
    private let modricLabel = UILabel()
    private var images = [UIImage(named: "Messi"), UIImage(named: "Ronaldo"), UIImage(named: "Mbappe"), UIImage(named: "Neymar"), UIImage(named: "Vinicius"), UIImage(named: "Modric"), UIImage(named: "YourStorys")]
    
    //MARK: - Объекты для первого поста
    private let userMessiHeartLabel = UILabel()
    private let userMessiMessageLabel = UILabel()
    private let userMessiShareLabel = UILabel()
    
    //MARK: - Объекты для второго поста
    private let userMbappeHeartLabel = UILabel()
    private let userMbappeMessageLabel = UILabel()
    private let userMbappeShareLabel = UILabel()
    
    //MARK: - Объекты для третьего поста
    private let userNeymarHeartLabel = UILabel()
    private let userNeymarMessageLabel = UILabel()
    private let userNeymarShareLabel = UILabel()
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Реализация методов
        addTabBarItem()
        addNavControllerItems()
        addMyTableView()
        
    }
    
    //MARK: - Методы
    
    // Настраиваем элемент tabBar
    private func addTabBarItem() {
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "unselectHouse"), selectedImage: UIImage(named: "selectHouse"))
        tabBarItem.imageInsets = UIEdgeInsets(top: 7, left: 0, bottom: 0, right: 0)
        self.tabBarItem = tabBarItem
        tabBarController?.selectedIndex = 0
    }
    
    // Настраиваем элементы навигационного контроллера
    private func addNavControllerItems() {
        // Кнопка "Instagram" (в данном задании без функционала)
        var config = UIButton.Configuration.plain()
        config.image = UIImage(named: "Instagram")
        config.baseForegroundColor = .black
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: -30, bottom: 0, trailing: 0) // сдвигаем чуть влево на навигационному бару
        instagramButton.configuration = config
        let instagramButtonItem = UIBarButtonItem(customView: instagramButton)
        navigationItem.leftBarButtonItem = instagramButtonItem
        
        // кнопка сердечко (с отступом вправо) и сообщения
        var config2 = UIButton.Configuration.plain()
        config2.image = UIImage(named: "heart")
        config2.baseForegroundColor = .black
        config2.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -20) // сдвигаем сердечко ближе к сообщениям
        heartButton.configuration = config2
        let heartBarButtonItem = UIBarButtonItem(customView: heartButton)
        
        messageButtonItem.tintColor = .black
        navigationItem.rightBarButtonItems = [messageButtonItem, heartBarButtonItem]
    }
    
    // Создаем таблицу и настраиваем refreshControl
    private func addMyTableView() {
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(StorysScrollTableViewCell.self, forCellReuseIdentifier: "StorysScrollTableViewCell")
        myTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        myTableView.register(RecommendationsViewCell.self, forCellReuseIdentifier: "RecommendationsViewCell")
        myTableView.separatorStyle = .none
        myTableView.showsVerticalScrollIndicator = false
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        view.addSubview(myTableView)
    }
    
    @objc private func refreshData() {
        //myTableView.reloadData() - в данном случае обновление не нужно, лишь визуальный эффект
        refreshControl.endRefreshing()
    }
    
}

//MARK: UITableView Data Source and UITableViewDelegate

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StorysScrollTableViewCell", for: indexPath) as! StorysScrollTableViewCell
            if images[indexPath.row] != nil {
                cell.addImage(storysImage: yourStorysPhoto, image: images[6]!, x: 10,nicknameLabel: yourLabel, nickname: "Ваша история", storysInactive: true)
                cell.addImage(storysImage: neymarStorysPhoto, image: images[3]!, x: 110, nicknameLabel: neymarLabel, nickname: "neymarjr", storysInactive: false)
                cell.addImage(storysImage: messiStorysPhoto, image: images[0]!, x: 210, nicknameLabel: messiLabel, nickname: "leomessi", storysInactive: false)
                cell.addImage(storysImage: mbappeStorysPhoto, image: images[2]!, x: 310, nicknameLabel: mbappeLabel, nickname: "k.mbappe", storysInactive: false)
                cell.addImage(storysImage: ronaldoStorysPhoto, image: images[1]!, x: 410, nicknameLabel: ronaldoLabel, nickname: "cristiano", storysInactive: false)
                cell.addImage(storysImage: viniciusStorysPhoto, image: images[4]!, x: 510, nicknameLabel: viniciusLabel, nickname: "vinijr", storysInactive: false)
                cell.addImage(storysImage: modricStorysPhoto, image: images[5]!, x: 610, nicknameLabel: modricLabel, nickname: "lukamodric10", storysInactive: false)
            }
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            cell.addUserPhoto(named: "Messi")
            cell.addUserNickname(text: "leomessi")
            cell.addVerificationImageView(x: 0)
            cell.addTimePost(text: "4 ч.")
            cell.addImagePost(named: "messiPost")
            cell.addQuantityActivity(quantityLabel: userMessiHeartLabel, text: "9,2 млн", x: 40)
            cell.addQuantityActivity(quantityLabel: userMessiMessageLabel, text: "120 тыс.", x: 150)
            cell.addQuantityActivity(quantityLabel: userMessiShareLabel, text: "196 тыс.", x: 260)
            cell.addMessagePost(nickname: "leomessi", text: "Tenía muchas ganas de volver a jugar en Argentina y me emociona más que nunca el cariño y la conexión con la gente. Seguimos adelante con la misma ilusión!")
            cell.addDateLabel(text: "16 октября •")
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendationsViewCell", for: indexPath) as! RecommendationsViewCell
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            cell.addUserPhoto(named: "Mbappe")
            cell.addUserNickname(text: "k.mbappe")
            cell.addVerificationImageView(x: 5)
            cell.addTimePost(text: "6 ч.")
            cell.addImagePost(named: "mbappePost")
            cell.addQuantityActivity(quantityLabel: userMbappeHeartLabel, text: "4,4 млн", x: 40)
            cell.addQuantityActivity(quantityLabel: userMbappeMessageLabel, text: "19,6 тыс.", x: 150)
            cell.addQuantityActivity(quantityLabel: userMbappeShareLabel, text: "23,5 тыс.", x: 260)
            cell.addMessagePost(nickname: "k.mbappe", text: "My first Champions League night at home. 🏠🤍 It was incredible to feel the support from our fans, and the energy on the field was amazing. We're pushing forward together! ⚪️🔵")
            cell.addDateLabel(text: "12 октября •")
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            cell.addUserPhoto(named: "Neymar")
            cell.addUserNickname(text: "neymarjr")
            cell.addVerificationImageView(x: 5)
            cell.addTimePost(text: "7 ч.")
            cell.addImagePost(named: "neymarPost")
            cell.addQuantityActivity(quantityLabel: userNeymarHeartLabel, text: "4,9 млн", x: 40)
            cell.addQuantityActivity(quantityLabel: userNeymarMessageLabel, text: "120 тыс.", x: 150)
            cell.addQuantityActivity(quantityLabel: userNeymarShareLabel, text: "430 тыс.", x: 260)
            cell.addMessagePost(nickname: "neymarjr", text: "Feliz de estar sentindo este sentimento novamente, friozinho na barriga pré jogo é sempre muito bom.. que seja um retorno cheio de saúde! Que Deus nos abençoe e nos proteja 🙏💙")
            cell.addDateLabel(text: "3 октября •")
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 140 // высота ячейки сторис
        } else if indexPath.row == 2  {
            return 330 // высота ячейки секции "Рекомендуемое"
        } else {
            return 750 // высота всех постов
        }
        }
    
    // Запрещаем выделение ячеек таблицы
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

