//
//  ViewController.swift
//  SwiftOverlay
//
//  Created by PahlevanyanSamvel on 06/22/2019.
//  Copyright (c) 2019 PahlevanyanSamvel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showUsersTapped(sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "UsersOverlay") else { return }
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}
