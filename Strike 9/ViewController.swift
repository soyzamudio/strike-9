//
//  ViewController.swift
//  Strike 9
//
//  Created by Jose Zamudio on 3/8/15.
//  Copyright (c) 2015 zamudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var topView:UIView = UIView()
	var middleView:UIView = UIView()
	var bottomView:UIView = UIView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.addSubview(drawTopView())
		self.view.addSubview(drawMiddleView())
		self.view.addSubview(drawBottomView())
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func drawTopView() -> UIView {
		topView = UIView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height * 0.2))
		topView.backgroundColor = UIColor.redColor()
		return topView
	}
	
	func drawMiddleView() -> UIView {
		middleView = UIView(frame: CGRectMake(0, topView.bounds.height, self.view.bounds.width, self.view.frame.height * 0.6))
		middleView.backgroundColor = UIColor.blackColor()
		return middleView
	}
	
	func drawBottomView() -> UIView {
		bottomView = UIView(frame: CGRectMake(0, topView.bounds.height + self.middleView.bounds.height, self.view.frame.width, self.view.frame.height * 0.2))
		bottomView.backgroundColor = UIColor.greenColor()
		return bottomView
	}
	
	func createGrid() -> UIView {
		
	}
	
}

