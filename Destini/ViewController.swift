//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {



    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton! // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton! // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!


    // TODO Step 5: Initialise instance variables here
    var currentStory: Story!
    let restartButton = UIButton()


    override func viewDidLoad() {
        super.viewDidLoad()

        restartButton.frame = bottomButton.frame
        restartButton.setTitle("Restart", for: .normal)
        restartButton.isHidden = true
        restartButton.center.y = topButton.center.y
        restartButton.center.x = self.view.center.x
        restartButton.bounds = bottomButton.bounds
        restartButton.backgroundColor = topButton.backgroundColor
        restartButton.addTarget(self, action: #selector(reset), for: UIControlEvents.touchUpInside)
        view.addSubview(restartButton)

        reset(sender: nil)
    }

    func updateUI() {
        if(currentStory == nil || (currentStory.answerA == nil && currentStory.answerB == nil)) {
            topButton.isHidden = true
            bottomButton.isHidden = true
            restartButton.isHidden = false
        }
        else {
            topButton.setTitle(currentStory.answerA!, for: .normal)
            bottomButton.setTitle(currentStory.answerB!, for: .normal)
        }
        storyTextView.text = currentStory.text
    }

    @objc func reset(sender: UIButton!) {
        restartButton.isHidden = true
        currentStory = StoryHolder.storyRoot
        topButton.isHidden = false
        bottomButton.isHidden = false
        updateUI()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        currentStory = sender.tag == 1 ? currentStory.left! : currentStory.right!

        updateUI()
    }
}

