//
//  UINavigationController+newFullscreenPopGesture.swift
//  全屏pop手势
//
//  Created by mikun on 2017/4/3.
//  Copyright © 2017年 mikun. All rights reserved.
//

import UIKit

extension UINavigationController:UIGestureRecognizerDelegate{
	
	private static let staticPan = UIPanGestureRecognizer()
	private var pan: UIPanGestureRecognizer {
		get {
			
			return UINavigationController.staticPan
		}

	}

	
	open override func viewDidLoad() {
		guard let hasPan = interactivePopGestureRecognizer?.view?.gestureRecognizers?.contains(pan) else {
			return
		}
		if hasPan {
			return
		}
		
		guard
			let systemPop = interactivePopGestureRecognizer ,
			let targets = (systemPop.value(forKey: "_targets") as? [NSObject])?.first ,
			let target = targets.value(forKey: "target") ,
			let gesView = systemPop.view
		else {
			return
		}
		pan.addTarget(target, action: Selector(("handleNavigationTransition:")))

		pan.delegate = self
		gesView.addGestureRecognizer(pan)
		interactivePopGestureRecognizer?.isEnabled = false
	}
	
	public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
		if !gestureRecognizer.isKind(of: UIPanGestureRecognizer.self) {
			return true
		}
		let pan = gestureRecognizer as! UIPanGestureRecognizer
		if (self.viewControllers.count <= 1) {
			return false
		}
		
		
		// 如果当前正在动画则返回
		if (self.value(forKey: "_isTransitioning") as! Bool) {
			return false
		}
		
		// 防止动画方向是往左进行
		let translation = pan.translation(in: pan.view)
		if (translation.x <= 0) {
			return false
		}
		
		return true

	}
	
}
