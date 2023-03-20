//
//  NYSchoolCell.swift
//  NYCSchools
//
//  Created by Venkata K on 3/20/23.
//

import UIKit

class NYSchoolCell: UITableViewCell {
    var nySchooolTitleLable = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(nySchooolTitleLable)
        
        configureTitleLable()
        setTitleLableConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("initcoder not innitiated")
    }
    
    func set(nySchools: NYSchools) {
        nySchooolTitleLable.text = nySchools.school_name
    }
    
    func configureTitleLable() {
        nySchooolTitleLable.numberOfLines = 0
        nySchooolTitleLable.adjustsFontSizeToFitWidth = true
    }
    
    func setTitleLableConstraints() {
        nySchooolTitleLable.translatesAutoresizingMaskIntoConstraints = false
        nySchooolTitleLable.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nySchooolTitleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        nySchooolTitleLable.heightAnchor.constraint(equalToConstant: 80).isActive = true
        nySchooolTitleLable.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
}
