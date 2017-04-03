//
//  ViewController.swift
//  全屏pop手势
//
//  Created by mikun on 2017/4/3.
//  Copyright © 2017年 mikun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let pushVC = UIViewController()
		pushVC.view.backgroundColor = UIColor.red
		
		show(pushVC, sender: nil)
	}
}

