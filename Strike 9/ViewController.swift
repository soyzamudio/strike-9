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
	
	var selectedNumbers:NSMutableArray = NSMutableArray()
	
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
		topView = UIView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height * 0.25))
		topView.backgroundColor = UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1)
		return topView
	}
	
	func drawMiddleView() -> UIView {
		middleView = UIView(frame: CGRectMake(0, topView.bounds.height, self.view.bounds.width, self.view.frame.height * 0.5))
		middleView.backgroundColor = UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1)
		createGrid()
		return middleView
	}
	
	func drawBottomView() -> UIView {
		bottomView = UIView(frame: CGRectMake(0, topView.bounds.height + self.middleView.bounds.height, self.view.frame.width, self.view.frame.height * 0.25))
		bottomView.backgroundColor = UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1)
		return bottomView
	}
	
	func createGrid() {
		//Divide the screen height and width /3 because 3*3
		var height = middleView.frame.height/3
		var width = middleView.frame.width/3
		//Add your images
		var numbers:[String] = ["1","2","3","4","5","6","7","8","9"]
		var count = 0
		for i in 0...2{
			for j in 0...2{
				var subview = UIView(frame: CGRectMake(width*CGFloat(j), height*CGFloat(i), width, height))
				var button:UIButton = UIButton(frame: CGRectMake(15, subview.bounds.height * 0.10, subview.frame.width - 30, subview.frame.height * 0.70))
				button.tag = count + 1
				button.setTitle(String(count + 1), forState: .Normal)
				button.titleLabel?.font = UIFont.boldSystemFontOfSize(24)
				button.backgroundColor = UIColor(red: 0/255, green: 192/255, blue: 252/255, alpha: 1)
				button.layer.masksToBounds = false
				button.layer.shadowColor = UIColor(red: 0/255, green: 144/255, blue: 163/255, alpha: 1).CGColor
				button.layer.shadowOpacity = 1
				button.layer.shadowRadius = 0
				button.layer.shadowOffset = CGSizeMake(0, 5)
				button.layer.cornerRadius = 10;
				button.addTarget(self, action: "clickEvent:", forControlEvents: UIControlEvents.TouchUpInside)
				subview.addSubview(button)
				middleView.addSubview(subview)
				count++
			}
		}
	}
	
	func clickEvent(sender: AnyObject) {
		var total = 10
		var button: UIButton = sender as UIButton
		button.enabled = false
		button.backgroundColor = UIColor(red: 146/255, green: 176/255, blue: 185/255, alpha: 1)
		button.layer.shadowColor = UIColor(red: 117/255, green: 141/255, blue: 148/255, alpha: 1).CGColor
		selectedNumbers.insertObject(button.tag, atIndex: 0)
		var sum = 0
		for number in selectedNumbers {
			sum += Int(number as NSNumber)
		}
		println("Sum: \(sum)")
		if (sum == total) {
			var alert:UIAlertView = UIAlertView(title: "YOU WON!", message: "You go the correct sum!", delegate: nil, cancelButtonTitle: "Ok")
			alert.show()
			restartGame()
		}
	}
	
	func restartGame() {
		for number in selectedNumbers {
			var button:UIButton = self.view.viewWithTag(Int(number as NSNumber)) as UIButton
			button.enabled = true
			button.backgroundColor = UIColor(red: 0/255, green: 192/255, blue: 252/255, alpha: 1)
			button.layer.shadowColor = UIColor(red: 0/255, green: 144/255, blue: 163/255, alpha: 1).CGColor
		}
		selectedNumbers.removeAllObjects()
	}
}

