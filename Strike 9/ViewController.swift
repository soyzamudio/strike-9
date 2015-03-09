//
//  ViewController.swift
//  Strike 9
//
//  Created by Jose Zamudio on 3/8/15.
//  Copyright (c) 2015 zamudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var total = 0
	
	var topView:UIView = UIView()
	var middleView:UIView = UIView()
	var bottomView:UIView = UIView()
	
	var selectedNumbers:NSMutableArray = NSMutableArray()
	
	var screenTotal:UILabel!
	var screenNumbers:UILabel!
	
	var getRandomButton:UIButton = UIButton()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.addSubview(drawTopView())
		self.view.addSubview(drawMiddleView())
		self.view.addSubview(drawBottomView())
	}
	
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}
	
	func drawTopView() -> UIView {
		topView = UIView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height * 0.25))
		topView.backgroundColor = UIColor(red: 119/255, green: 119/255, blue: 119/255, alpha: 1)
		createDisplay()
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
		
		getRandomButton = UIButton(frame: CGRectMake(15, 5, bottomView.frame.width - 30, bottomView.frame.height - 20))
		getRandomButton.backgroundColor = UIColor(red: 255/255, green: 130/255, blue: 34/255, alpha: 1)
		getRandomButton.setTitle("Roll the dice", forState: .Normal)
		getRandomButton.titleLabel?.font = UIFont.boldSystemFontOfSize(24)
		getRandomButton.layer.masksToBounds = false
		getRandomButton.layer.shadowColor = UIColor(red: 191/255, green: 94/255, blue: 22/255, alpha: 1).CGColor
		getRandomButton.layer.shadowOpacity = 1
		getRandomButton.layer.shadowRadius = 0
		getRandomButton.layer.shadowOffset = CGSizeMake(0, 5)
		getRandomButton.layer.cornerRadius = 10;
		getRandomButton.addTarget(self, action: "rollDice", forControlEvents: .TouchUpInside)
		
		bottomView.addSubview(getRandomButton)
		
		return bottomView
	}
	
	func createDisplay() {
		var screen:UIView = UIView(frame: CGRectMake(15, 30, self.view.frame.width - 30, topView.frame.height - 50))
		screen.backgroundColor = UIColor.whiteColor()
		screen.layer.masksToBounds = false
		screen.layer.shadowColor = UIColor.lightGrayColor().CGColor
		screen.layer.shadowOpacity = 1
		screen.layer.shadowRadius = 0
		screen.layer.shadowOffset = CGSizeMake(0, 5)
		screen.layer.cornerRadius = 10
		
		var clearButton:UIButton = UIButton(frame: CGRectMake(5, 5, 85, 40))
		clearButton.backgroundColor = UIColor(red: 255/255, green: 130/255, blue: 34/255, alpha: 1)
		clearButton.setTitle("Clear", forState: .Normal)
		clearButton.titleLabel?.font = UIFont.boldSystemFontOfSize(18)
		clearButton.layer.masksToBounds = false
		clearButton.layer.shadowColor = UIColor(red: 191/255, green: 94/255, blue: 22/255, alpha: 1).CGColor
		clearButton.layer.shadowOpacity = 1
		clearButton.layer.shadowRadius = 0
		clearButton.layer.shadowOffset = CGSizeMake(0, 5)
		clearButton.layer.cornerRadius = 10;
		clearButton.addTarget(self, action: "clearNumbers", forControlEvents: .TouchUpInside)
		
		var restart:UIButton = UIButton(frame: CGRectMake(5, (screen.frame.height / 2) + 5, 85, 40))
		restart.backgroundColor = UIColor(red: 244/255, green: 104/255, blue: 103/255, alpha: 1)
		restart.setTitle("Restart", forState: .Normal)
		restart.titleLabel?.font = UIFont.boldSystemFontOfSize(18)
		restart.layer.masksToBounds = false
		restart.layer.shadowColor = UIColor(red: 214/255, green: 90/255, blue: 90/255, alpha: 1).CGColor
		restart.layer.shadowOpacity = 1
		restart.layer.shadowRadius = 0
		restart.layer.shadowOffset = CGSizeMake(0, 5)
		restart.layer.cornerRadius = 10;
		restart.addTarget(self, action: "restartGame", forControlEvents: .TouchUpInside)
		
		screenTotal = UILabel(frame: CGRectMake(5, 5, screen.frame.width - 20, screen.frame.height / 2))
		screenTotal.textAlignment = .Right
		screenTotal.font = UIFont.boldSystemFontOfSize(20)
		screenNumbers = UILabel(frame: CGRectMake(5, screenTotal.bounds.height, screen.frame.width - 20, screen.frame.height / 2))
		screenNumbers.textAlignment = .Right
		screenNumbers.font = UIFont.boldSystemFontOfSize(20)
		screenNumbers.text = ""
		
		screen.addSubview(clearButton)
		screen.addSubview(restart)
		screen.addSubview(screenTotal)
		screen.addSubview(screenNumbers)
		
		self.topView.addSubview(screen)
	}
	
	func createGrid() {
		var height = middleView.frame.height/3
		var width = middleView.frame.width/3
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
		var button: UIButton = sender as UIButton
		button.enabled = false
		button.backgroundColor = UIColor(red: 146/255, green: 176/255, blue: 185/255, alpha: 1)
		button.layer.shadowColor = UIColor(red: 117/255, green: 141/255, blue: 148/255, alpha: 1).CGColor
		selectedNumbers.insertObject(button.tag, atIndex: 0)
		var sum = 0
		for number in selectedNumbers {
			sum += Int(number as NSNumber)
		}
		screenTotal.text = String(sum)
		if (sum == total) {
			var alert:UIAlertView = UIAlertView(title: "YOU WON!", message: "You go the correct sum!", delegate: nil, cancelButtonTitle: "Ok")
			alert.show()
			restartGame()
		} else if (sum > total) {
			var alert:UIAlertView = UIAlertView(title: "YOU LOST!", message: "You went over the amount!", delegate: nil, cancelButtonTitle: "Ok")
			alert.show()
			restartGame()
		}
	}
	
	func clearNumbers() {
		for number in selectedNumbers {
			var button:UIButton = self.view.viewWithTag(Int(number as NSNumber)) as UIButton
			button.enabled = true
			button.backgroundColor = UIColor(red: 0/255, green: 192/255, blue: 252/255, alpha: 1)
			button.layer.shadowColor = UIColor(red: 0/255, green: 144/255, blue: 163/255, alpha: 1).CGColor
		}
		selectedNumbers.removeAllObjects()
		screenTotal.text = ""
		screenNumbers.text = ""
	}
	
	func restartGame() {
		for number in selectedNumbers {
			var button:UIButton = self.view.viewWithTag(Int(number as NSNumber)) as UIButton
			button.enabled = true
			button.backgroundColor = UIColor(red: 0/255, green: 192/255, blue: 252/255, alpha: 1)
			button.layer.shadowColor = UIColor(red: 0/255, green: 144/255, blue: 163/255, alpha: 1).CGColor
		}
		selectedNumbers.removeAllObjects()
		screenTotal.text = ""
		screenNumbers.text = ""
		getRandomButton.enabled = true
		getRandomButton.setTitle("Roll the dice", forState: .Normal)
		getRandomButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
		getRandomButton.backgroundColor = UIColor(red: 255/255, green: 130/255, blue: 34/255, alpha: 1)
		getRandomButton.layer.shadowColor = UIColor(red: 191/255, green: 94/255, blue: 22/255, alpha: 1).CGColor
		bottomView.addSubview(getRandomButton)
	}
	
	func rollDice() {
		drawDice(1 + random() % 45)
	}
	
	func drawDice(number: NSNumber) {
		total = Int(number)
		getRandomButton.enabled = false
		getRandomButton.backgroundColor = UIColor.whiteColor()
		getRandomButton.layer.shadowColor = UIColor.lightGrayColor().CGColor
		getRandomButton.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
		getRandomButton.setTitle("\(total)", forState: .Normal)
	}
	
}

