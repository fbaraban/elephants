//
//  ImageViewCell.swift
//  Elephants
//
//  Created by Wilson Baraban Filho on 10/21/21.
//

import UIKit
import SnapKit
class ImageViewCell: UITableViewCell {
    
    var url_Image = URL(string: "")
    private var uiiv_ImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.uiiv_ImageView)
        if let url = self.url_Image {
            self.setImageView(url: url)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageView(url: URL) {
        
        guard let data = try? Data(contentsOf: url) else { return }
        guard let image = try? UIImage(data: data) else { return }
        self.uiiv_ImageView.image = image
        self.uiiv_ImageView.contentMode = .scaleToFill
        self.uiiv_ImageView.snp.makeConstraints { make in
            
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
            make.centerY.equalTo(self)
            make.centerX.equalTo(self)
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
    }
}
