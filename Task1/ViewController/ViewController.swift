//
//  ViewController.swift
//  Task1
//
//  Created by manvendu pathak  on 21/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    var isChecked = false
    @IBOutlet weak var rectangle612: UIView!
    @IBOutlet weak var checkbutton: UIButton!
    @IBOutlet weak var rectangle614: UIView!
    @IBOutlet weak var rectangle615: UIView!
    var halfsheetVC: SheetViewController?
    @IBAction func seeMorePressed(_ sender: UIButton) {
        halfsheetVC = SheetViewController()
        guard let halfsheetVC = halfsheetVC else {return}
        
        addChild(halfsheetVC)
        view.addSubview(halfsheetVC.view)
        halfsheetVC.didMove(toParent: self)
        
        let height = view.frame.height / 2
        let width = view.frame.width
        halfsheetVC.view.frame = CGRect(x: 0, y: view.frame.maxY, width: width, height: height)
        
        UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.8) {
                   halfsheetVC.view.frame.origin.y = self.view.frame.maxY - height
               }.startAnimation()
    }
    
    
    
    @IBAction func checkBox(_ sender: Any) {
        isChecked.toggle()
        updateCheckBox()
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
    }
    
    private func updateCheckBox() {
        let imageName = isChecked ? "checkmark.square.fill" : "square"
        let image = UIImage(systemName: imageName)
        checkbutton.setBackgroundImage(image, for: .normal)
    }
    
    private func setUI(){
        rectangle612.layer.cornerRadius = 8
        rectangle612.layer.masksToBounds = true
        rectangle612.layer.borderWidth = 0.3
        rectangle612.layer.borderColor = UIColor.gray.cgColor

        
        rectangle614.layer.cornerRadius = 8
        rectangle614.layer.masksToBounds = true
        
        rectangle615.layer.cornerRadius = 8
        rectangle615.layer.masksToBounds = true
    }

}




