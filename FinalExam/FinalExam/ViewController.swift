//
//  ViewController.swift
//  FinalExam
//
//  Created by user256704 on 4/17/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let data = ["Toronto", "Vancouver", "Montreal", "Calgary", "Ottawa", "Edmonton", "Quebec City", "Winnipeg", "Hamilton", "Kitchener"]
    // Creating the collection view in the code. Wasn't sure if we could assume that it was implemented in a storybaord file
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // Setting the dataSource and delegate for the collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
    
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cityCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // implementing the collectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    // Implementing cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cityCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cityCell", for: indexPath) as! MyCollectionViewCell
        cityCell.cityLabel.text = data[indexPath.item]
        return cityCell
    }
    
    // implementing collection view delegate didSelectItemAt
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected city: \(data[indexPath.item])")
    }
}

class MyCollectionViewCell: UICollectionViewCell {
  let cityLabel: UILabel

  override init(frame: CGRect) {
    cityLabel = UILabel(frame: .zero)
    super.init(frame: frame)

    // Configuring the UI for the cell
      contentView.addSubview(cityLabel)
      cityLabel.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        cityLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        cityLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
      ])
     }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
    
    
