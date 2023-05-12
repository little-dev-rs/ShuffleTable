//
//  ListCell.swift
//  ShuffleTable
//

import TinyConstraints
import UIKit

class ListCell: UITableViewCell {

    var numberLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    var checkMarkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "checkmark") ?? UIImage()
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        contentView.addSubview(numberLabel)
        numberLabel.widthToSuperview(multiplier: 0.5)
        numberLabel.leadingToSuperview(offset: 50)
        numberLabel.height(20)
        numberLabel.centerYToSuperview()
        
        contentView.addSubview(checkMarkImage)
        checkMarkImage.width(20)
        checkMarkImage.height(20)
        checkMarkImage.trailingToSuperview(offset: 20)
        checkMarkImage.centerYToSuperview()
    }

    func configureCell(with model: ListCellModel) {
        numberLabel.text = model.title
        checkMarkImage.isHidden = !model.isChecked
    }
    
}

