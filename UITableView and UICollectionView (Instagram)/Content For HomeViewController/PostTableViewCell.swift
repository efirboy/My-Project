//
//  PostTableViewCell.swift
//  UITableView and UICollectionView (Instagram)
//
//  Created by Alexandr Garkalin on 28.10.2024.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    
    //MARK: - Объекты
    
    private let userImage = UIImageView()
    private let nicknameLabel = UILabel()
    private let verificationImageView = UIImageView()
    private let timePostLabel = UILabel()
    private let settingPostButton = UIButton()
    private let imagePost = UIImageView()
    private let quantityLabel = UILabel()
    private let heartButton = UIButton()
    private let messageButton = UIButton()
    private let shareButton = UIButton()
    private let bookmarkButton = UIButton()
    private let messagePost = UILabel()
    private let allCommentButton = UIButton()
    private let dateLabel = UILabel()
    private let translateButton = UIButton()
    
    //MARK: - Инициализация
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Реализация методов для неизменяемых компонентов каждого поста
        addSettingButtonPost()
        addButtonsUnderPost(buttonUnderPost: heartButton, systemName: "heart", x: 10)
        addButtonsUnderPost(buttonUnderPost: messageButton, systemName: "bubble.right", x: 120)
        addButtonsUnderPost(buttonUnderPost: shareButton, systemName: "paperplane", x: 230)
        addButtonsUnderPost(buttonUnderPost: bookmarkButton, systemName: "bookmark", x: 360)
        addAllCommentButton()
        addTranslateButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Методы
    
    // Добавляем фотографию пользователя поста
    func addUserPhoto(named: String) {
        userImage.image = UIImage(named: named)
        userImage.contentMode = .scaleAspectFill
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.layer.cornerRadius = 15
        userImage.layer.masksToBounds = true
        contentView.addSubview(userImage)
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            userImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            userImage.widthAnchor.constraint(equalToConstant: 30),
            userImage.heightAnchor.constraint(equalTo: userImage.widthAnchor)
        ])
    }
    
    // Добавляем никнейм пользователя поста
    func addUserNickname(text: String) {
        nicknameLabel.text = text
        nicknameLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nicknameLabel)
        NSLayoutConstraint.activate([
            nicknameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nicknameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            nicknameLabel.widthAnchor.constraint(equalToConstant: 70),
            nicknameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // Добавляем галочку верификации
    func addVerificationImageView(x: Int) {
        verificationImageView.image = UIImage(systemName: "checkmark.seal")
        verificationImageView.backgroundColor = .systemBlue
        verificationImageView.tintColor = .white
        verificationImageView.layer.cornerRadius = 9
        verificationImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(verificationImageView)
        NSLayoutConstraint.activate([
            verificationImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17),
            verificationImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat(x + 120)),
            verificationImageView.widthAnchor.constraint(equalToConstant: 15),
            verificationImageView.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    // Добавляем время поста
    func addTimePost(text: String) {
        timePostLabel.text = text
        timePostLabel.font = UIFont.systemFont(ofSize: 14)
        timePostLabel.alpha = 0.5
        timePostLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(timePostLabel)
        NSLayoutConstraint.activate([
            timePostLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17),
            timePostLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 150),
            timePostLabel.widthAnchor.constraint(equalToConstant: 25),
            timePostLabel.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
    // Добавляем кнопку настроек поста (три точки)
    private func addSettingButtonPost() {
        settingPostButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        settingPostButton.tintColor = .black
        settingPostButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(settingPostButton)
        NSLayoutConstraint.activate([
            settingPostButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            settingPostButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            settingPostButton.widthAnchor.constraint(equalToConstant: 40),
            settingPostButton.heightAnchor.constraint(equalTo: settingPostButton.widthAnchor)
        ])
    }
    
    // Добавляем фотографию поста
    func addImagePost(named: String) {
        imagePost.image = UIImage(named: named)
        imagePost.contentMode = .scaleAspectFill
        imagePost.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imagePost)
        NSLayoutConstraint.activate([
            imagePost.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -520),
            imagePost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagePost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagePost.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    // Универсальная функция для добавления кнопок под постом (лайк, сообщения, поделиться, закладка)
    private func addButtonsUnderPost(buttonUnderPost: UIButton, systemName: String, x: CGFloat) {
        let configuration = UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold)
        buttonUnderPost.setImage(UIImage(systemName: systemName, withConfiguration: configuration), for: .normal)
        buttonUnderPost.tintColor = .black
        buttonUnderPost.contentHorizontalAlignment = .fill
        buttonUnderPost.contentVerticalAlignment = .fill
        buttonUnderPost.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(buttonUnderPost)
        NSLayoutConstraint.activate([
            buttonUnderPost.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 570),
            buttonUnderPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: x),
            buttonUnderPost.widthAnchor.constraint(equalToConstant: 25),
            buttonUnderPost.heightAnchor.constraint(equalTo: buttonUnderPost.widthAnchor)
        ])
    }
    
    // Универсальная функция для добавления количества активности (лайков, сообщений и поделиться)
    func addQuantityActivity(quantityLabel: UILabel, text: String, x: CGFloat) {
        quantityLabel.text = text
        quantityLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(quantityLabel)
        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 557),
            quantityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: x),
            quantityLabel.widthAnchor.constraint(equalToConstant: 100),
            quantityLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // Добавляем текст сообщения в посте
    func addMessagePost(nickname: String, text: String) {
        // Создаем аттрибутированный текст, где никнейм выделен жирным
        let messageText = "\(nickname) \(text)"
        let attributedText = NSMutableAttributedString(string: messageText, attributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 14)!])
        attributedText.addAttribute(.font, value: UIFont(name: "HelveticaNeue-Bold", size: 14)!, range: NSRange(location: 0, length: nickname.count))
        messagePost.attributedText = attributedText
        messagePost.numberOfLines = 0
        messagePost.textAlignment = .justified
        messagePost.lineBreakMode = .byWordWrapping
        messagePost.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(messagePost)
        NSLayoutConstraint.activate([
            messagePost.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 590),
            messagePost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13),
            messagePost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),
            messagePost.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
    
    //  Добавляем кнопку "Смотреть все комментарии"
    private func addAllCommentButton() {
        allCommentButton.setTitle("Смотреть все комментарии", for: .normal)
        allCommentButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 14)
        allCommentButton.setTitleColor(.black, for: .normal)
        allCommentButton.alpha = 0.5
        allCommentButton.titleLabel?.textAlignment = .left
        allCommentButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(allCommentButton)
        NSLayoutConstraint.activate([
            allCommentButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 670),
            allCommentButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            allCommentButton.widthAnchor.constraint(equalToConstant: 200),
            allCommentButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // Добавляем лейбл с датой
    func addDateLabel(text: String) {
        dateLabel.text = text
        dateLabel.font = UIFont(name: "HelveticaNeue", size: 12)
        dateLabel.alpha = 0.5
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: allCommentButton.bottomAnchor, constant: -25),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            dateLabel.widthAnchor.constraint(equalToConstant: 100),
            dateLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // Добавляем кнопку перевода
    private func addTranslateButton() {
        translateButton.setTitle("Показать перевод", for: .normal)
        translateButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        translateButton.setTitleColor(.black, for: .normal)
        translateButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(translateButton)
        NSLayoutConstraint.activate([
            translateButton.topAnchor.constraint(equalTo: allCommentButton.bottomAnchor, constant: -25),
            translateButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 85),
            translateButton.widthAnchor.constraint(equalToConstant: 120),
            translateButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    
}
