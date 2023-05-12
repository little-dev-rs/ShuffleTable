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
    }

    func configureCell(with model: ListCellModel) {
        numberLabel.text = model.title
        if model.isChecked {
            accessoryType = .checkmark
        }
    }
    
}

