//
//  DescribingUserViewController.swift
//  ScrollingForm
//
//  Created by Roman Hural on 11.02.2022.
//

import UIKit

class DescribingUserViewController: UIViewController {
    //MARK: - Variables
    var textLabel: String!
    
    //MARK: - Outlets
    @IBOutlet var descriptionLabel: UILabel!
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = textLabel
    }
}
