//
//  ViewController.swift
//  instagram clone
//
//  Created by Giulio Manuzzi on 22/09/21.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var rows : [StoriesCell]! = []
    
    private let title_label : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont(name: "Billabong", size: 35)
        lbl.text = "Instagram Clone"
        lbl.textColor = .black
        return lbl
    }()
    
    private let spacer : Spacer = {
        let sp = Spacer (icons: [UIImage(named: "add_post_icon")!, UIImage(named: "empty_like_icon")!, UIImage(named: "direct_icon")!], actions: [])
        
        return sp
    }()
    
    private let storiesBoard : UICollectionView = {
        let sb = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: {
            let cvl = UICollectionViewFlowLayout()
            cvl.sectionInset = UIEdgeInsets (top: 3, left: 0, bottom: 0, right: 0)
            cvl.itemSize = CGSize(width: 80, height: 100)
            cvl.scrollDirection = .horizontal
            cvl.minimumLineSpacing = 8
            return cvl
        }())
        sb.backgroundColor = .white
        sb.showsHorizontalScrollIndicator = false
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.register(StoriesCell.self, forCellWithReuseIdentifier: "StoryCell")
        return sb
    }()
    
    private let tableView : UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .systemPink
        tv.allowsSelection = false
        tv.register(InstagramPostCell.self, forCellReuseIdentifier: "InstagramPostCell")
        return tv
    }()
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return InstagramPostCell(profileImage: nil, nickname: "nickname", zone: "Zone information")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.rows.indices.firstIndex(of: indexPath.row) != nil {
            return self.rows[indexPath.row]
        } else {
            let row : StoriesCell! = (collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoriesCell)
            if indexPath.row == 0 {
                row.initFunc(type: .addStory)
                
            } else {
                row.initFunc(type: .story)
            }
            self.rows.append(row)
            return row
        }
    }
    
    class StoriesCell : UICollectionViewCell {
        
        private var typeValue : StoriesCellType!
        public var type : StoriesCellType? {
            get {
                return self.typeValue
            }
        }
        
        private let storyIV : UIImageView = {
            let siv = UIImageView()
            siv.backgroundColor = .black
            siv.layer.cornerRadius = 31
            siv.layer.borderColor = UIColor.white.cgColor
            siv.layer.borderWidth = 2
            siv.layer.zPosition = 0
            siv.translatesAutoresizingMaskIntoConstraints = false
            return siv
        }()
        
        private let externalRing : UIView = {
            let er = UIView()
            er.backgroundColor = .clear
            er.layer.borderColor = UIColor(red: 243/255, green: 78/255, blue: 86/255, alpha: 1).cgColor
            er.layer.borderWidth = 4
            er.layer.cornerRadius = 35
            er.translatesAutoresizingMaskIntoConstraints = false
            return er
        }()
        
        private let nickanameStories : UILabel = {
            let ns = UILabel()
            ns.numberOfLines = 1
            ns.text = "USERNAME_LBL"
            ns.font = UIFont(name: "Helvetica", size: 13)
            ns.textAlignment = .center
            ns.translatesAutoresizingMaskIntoConstraints = false
            return ns
        }()
        
        
    
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        func initFunc(type : StoriesCellType){
            self.typeValue = type
            self.addSubview(storyIV)
            self.addSubview(nickanameStories)
            
            storyIV.topAnchor.constraint(equalTo: self.topAnchor, constant: 6).isActive = true
            storyIV.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            storyIV.widthAnchor.constraint(equalToConstant: 62).isActive = true
            storyIV.heightAnchor.constraint(equalTo: storyIV.widthAnchor).isActive = true
            
            nickanameStories.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4).isActive = true
            nickanameStories.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            nickanameStories.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -4).isActive = true
            nickanameStories.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            self.nickanameStories.textColor = self.type == .addStory ? .gray : .black
            
            if self.type == .addStory {
                let cerchietto : UIView = {
                    let ip = UIView()
                    ip.translatesAutoresizingMaskIntoConstraints = false
                    ip.layer.borderWidth = 3
                    ip.layer.borderColor = UIColor.white.cgColor
                    ip.layer.cornerRadius = 14
                    ip.backgroundColor = UIColor(red: 0/255, green: 149/255, blue: 246/255, alpha: 1)
                    ip.layer.zPosition = 1
                    return ip
                }()
                let plus : UIImageView = {
                    let plusIcon = UIImageView()
                    plusIcon.image = UIImage(named: "plusIcon")
                    plusIcon.contentMode = .scaleToFill
                    plusIcon.translatesAutoresizingMaskIntoConstraints = false
                   
                    return plusIcon
                }()
                self.addSubview(cerchietto)
                cerchietto.addSubview(plus)
                
                
                cerchietto.rightAnchor.constraint(equalTo: self.storyIV.rightAnchor).isActive = true
                cerchietto.bottomAnchor.constraint(equalTo: self.storyIV.bottomAnchor).isActive = true
                cerchietto.heightAnchor.constraint(equalToConstant: 28).isActive = true
                cerchietto.widthAnchor.constraint(equalTo: cerchietto.heightAnchor).isActive = true
                
                plus.centerYAnchor.constraint(equalTo: cerchietto.centerYAnchor).isActive = true
                plus.centerXAnchor.constraint(equalTo: cerchietto.centerXAnchor).isActive = true
                plus.heightAnchor.constraint(equalToConstant: 10).isActive = true
                plus.widthAnchor.constraint(equalTo: plus.heightAnchor).isActive = true
                
                nickanameStories.text = "La tua storia"
                
            } else {
                self.addSubview(externalRing)
                self.externalRing.centerXAnchor.constraint(equalTo: self.storyIV.centerXAnchor).isActive = true
                self.externalRing.centerYAnchor.constraint(equalTo: self.storyIV.centerYAnchor).isActive = true
                self.externalRing.widthAnchor.constraint(equalToConstant: 70).isActive = true
                self.externalRing.heightAnchor.constraint(equalTo: self.externalRing.widthAnchor).isActive = true
                
                nickanameStories.text = "username"
            }
            
        }
        required init?(coder: NSCoder) {
            fatalError()
        }
    }
    class InstagramPostCell : UITableViewCell {
        
        class PostCardMenu : UIView {
            private let userProfileImageView : UIImageView = {
                let iv = UIImageView()
                iv.contentMode = .scaleAspectFit
                iv.backgroundColor = .black
                iv.translatesAutoresizingMaskIntoConstraints = false
                return iv
            }()
            
            private let nicknameLabel : UILabel = {
                let nl = UILabel()
                nl.text = "NICKNAME_LABEL"
                nl.textColor = .black
                nl.numberOfLines = 1
                nl.font = UIFont(name: "Helvetica", size: 12)
                nl.adjustsFontSizeToFitWidth = true
                nl.translatesAutoresizingMaskIntoConstraints = false
                return nl
            }()
            
            private let zoneLabel : UILabel = {
                let zl = UILabel()
                zl.adjustsFontSizeToFitWidth = true
                zl.text = "Zone Infomation"
                zl.numberOfLines = 1
                zl.font = UIFont(name: "Helvetica", size: 12)
                zl.textColor = .black
                zl.translatesAutoresizingMaskIntoConstraints = false
                return zl
            }()
            
            private let optionMenu : UIButton = {
                let om = UIButton(type: .system)
                om.setImage(UIImage(named: "option_menu_icon copy"), for: .normal)
                om.tintColor = .black
                om.translatesAutoresizingMaskIntoConstraints = false
                return om
            }()
            
            public final var profileImage : UIImage {
                get
                {
                    return self.userProfileImageView.image!
                }
            }
            public final var nickname : String {
                get {
                    return self.nicknameLabel.text!
                }
            }
            public final var zone : String {
                get{
                    return self.zoneLabel.text!
                }
            }
            
            
            override init(frame: CGRect) {
                super.init(frame: frame)
                
            }
            init(profileImage: UIImage?, nickname: String, zone: String?) {
                super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
                self.translatesAutoresizingMaskIntoConstraints = false
                self.userProfileImageView.image = profileImage
                self.nicknameLabel.text = nickname
                self.zoneLabel.text = zone
                
                
                self.addSubview(self.userProfileImageView)
                self.addSubview(self.nicknameLabel)
                self.addSubview(self.zoneLabel)
                self.addSubview(self.optionMenu)
                
                self.userProfileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
                self.userProfileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
                self.userProfileImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
                self.userProfileImageView.heightAnchor.constraint(equalTo: self.userProfileImageView.widthAnchor).isActive = true
                self.userProfileImageView.layer.cornerRadius = 35/2
                
                
                self.nicknameLabel.leftAnchor.constraint(equalTo: self.userProfileImageView.rightAnchor, constant: 10).isActive = true
                self.zoneLabel.leftAnchor.constraint(equalTo: self.nicknameLabel.leftAnchor).isActive = true
                self.zoneLabel.rightAnchor.constraint(equalTo: self.optionMenu.leftAnchor, constant: -10).isActive = true
                self.nicknameLabel.rightAnchor.constraint(equalTo: self.optionMenu.leftAnchor).isActive = true
                if zone == nil {
                    self.zoneLabel.alpha = 0
                    self.nicknameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
                } else {
                    self.nicknameLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
                    self.zoneLabel.topAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
                }
                
                self.optionMenu.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
                self.optionMenu.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
                self.optionMenu.heightAnchor.constraint(equalToConstant: 3).isActive = true
                self.optionMenu.widthAnchor.constraint(equalToConstant: 14).isActive = true
                
        
            }
            
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }
        }
        
        var postCardMenu : PostCardMenu! = nil
        
        let imagePost : UIView = {
            let ip = UIView()
            ip.backgroundColor = .cyan
            ip.translatesAutoresizingMaskIntoConstraints = false
            return ip
        }()
        
        private let userReactionPannel : Spacer = {
            let urp = Spacer(icons: [UIImage(named: "empty_like_icon")!, UIImage(named: "comment_icon")!, UIImage(named: "direct_icon")!], actions: [])
            return urp
        }()
        
        private let savePost : UIButton = {
            let sp = UIButton(type: .system)
            sp.setImage(UIImage(named: "empty_bookmark_icon"), for: .normal)
            sp.tintColor = .black
            sp.translatesAutoresizingMaskIntoConstraints = false
            return sp
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        }
        init(profileImage:UIImage?, nickname: String, zone: String?){
            super.init(style: .default, reuseIdentifier: "InstagramPostCell")
            self.postCardMenu = PostCardMenu(profileImage: profileImage, nickname: nickname, zone: zone)
            self.addSubview(postCardMenu)
            self.addSubview(imagePost)
            self.addSubview(userReactionPannel)
            self.addSubview(savePost)
            
            self.postCardMenu.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
            self.postCardMenu.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
            self.postCardMenu.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
            self.postCardMenu.heightAnchor.constraint(equalToConstant: 35).isActive = true
            
            self.imagePost.topAnchor.constraint(equalTo: self.postCardMenu.bottomAnchor, constant: 10).isActive = true
            self.imagePost.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            self.imagePost.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            self.imagePost.heightAnchor.constraint(equalToConstant: 300).isActive = true
            
            self.userReactionPannel.topAnchor.constraint(equalTo: self.imagePost.bottomAnchor, constant: 15).isActive = true
            self.userReactionPannel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
            self.userReactionPannel.heightAnchor.constraint(equalToConstant: 25).isActive = true
            
            self.savePost.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
            self.savePost.centerYAnchor.constraint(equalTo: self.userReactionPannel.centerYAnchor).isActive = true
            self.savePost.heightAnchor.constraint(equalTo: self.userReactionPannel.heightAnchor).isActive = true
            self.savePost.widthAnchor.constraint(equalToConstant: 21).isActive = true
            
        }
        required init?(coder: NSCoder) {
            fatalError()
        }
    }
    

    class Spacer : UIView {
        private var icons : [UIImage]!
        private var actions : [Selector]!
        
        
        public final func getIcons() -> [UIImage] {
            return self.icons
        }
        public final func getAction() -> [Selector] {
            return self.actions
        }
        
        init(icons:[UIImage], actions : [Selector]) {
            super.init(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0)))
            self.icons = icons
            self.actions = actions
        
            var objects : [UIButton]! = []
            for i in 0...self.icons.count-1 {
                objects.append({
                    let btn = UIButton(type: .system)
                    btn.tintColor = .black
                    btn.widthAnchor.constraint(equalToConstant: 25).isActive = true
                    btn.heightAnchor.constraint(equalToConstant: 25).isActive = true
                    btn.setImage(self.icons[i], for: .normal)
                    btn.translatesAutoresizingMaskIntoConstraints = false
//                    btn.addTarget(self, action: self.actions[i], for: .touchUpInside)
                    return btn
                }())
            }
            let sv : UIStackView = {
               let sv = UIStackView(arrangedSubviews: objects)
                sv.axis = .horizontal
                sv.alignment = .fill
                sv.spacing = 25
                sv.distribution = .fill
                sv.translatesAutoresizingMaskIntoConstraints = false
                return sv
            }()
            
            self.addSubview(sv)
            sv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            sv.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            sv.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            sv.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.view.backgroundColor = .white
        self.view.addSubview(title_label)
        self.view.addSubview(spacer)
        self.view.addSubview(storiesBoard)
        self.view.addSubview(tableView)
        
        self.title_label.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        self.title_label.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        
        self.spacer.centerYAnchor.constraint(equalTo: self.title_label.centerYAnchor).isActive = true
        self.spacer.heightAnchor.constraint(equalToConstant: 23).isActive = true
        self.spacer.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        
        self.storiesBoard.topAnchor.constraint(equalTo: self.title_label.bottomAnchor, constant: 15).isActive = true
        self.storiesBoard.heightAnchor.constraint(equalToConstant: 96).isActive = true
        self.storiesBoard.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
        self.storiesBoard.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.tableView.topAnchor.constraint(equalTo: self.storiesBoard.bottomAnchor, constant: 0).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.storiesBoard.delegate = self
        self.storiesBoard.dataSource = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}


    
    
    
    
   
    
