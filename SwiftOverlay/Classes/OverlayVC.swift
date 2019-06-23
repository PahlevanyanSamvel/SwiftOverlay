//
//  OverlayVC.swift
//  SwiftOverlay
//
//  Created by Samvel on 6/15/19.
//  Copyright © 2019 Samvel. All rights reserved.
//

import UIKit

open class OverlayVC: UIViewController {
    // privet vars
    private var dragViewPanGesture: UIPanGestureRecognizer!
    private var scrollViewPanGesture: UIPanGestureRecognizer!
    private var dragView: UIView!
    // public vars
    public var topSpacing: CGFloat! {return 0}
    public var dismissWithAnimation: Bool { return true}
    public var animationSpringWithDamping:CGFloat { return 0.8}
    
    public weak var containerView: UIView! { // you need to set it from child
        didSet {
            containerView.addSubview(dragView)
        }
    }
    
    public weak var scrollView:UIScrollView? {
        didSet {
            setupSrollview()
        }
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        dragViewConfig()
    }
    
    private func dragViewConfig() {
        var y:CGFloat = 0
        if #available(iOS 11.0, *) {
            y = view.safeAreaInsets.top
        }
        dragView = UIView(frame: CGRect(x: 0, y: y, width: UIScreen.main.bounds.width, height: 50))
        dragViewPanGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(gesture:)))
        dragViewPanGesture.delegate = self
        dragView.addGestureRecognizer(dragViewPanGesture)
        
    }
    
    public func setupPanView(pan: UIView) {
        dragView.addSubview(pan)
    }
    
    private func setupSrollview() {
        if let scrollView = scrollView {
            scrollViewPanGesture = UIPanGestureRecognizer (target: self, action: #selector(panGesture(gesture:)))
            scrollViewPanGesture.delegate = self
            scrollView.addGestureRecognizer(scrollViewPanGesture)
        }
    }
    
    public func contentClose(animation: Bool = true, completion: (() -> Void)? = nil) {
        contentTo(point: CGPoint(x: 0, y: view.frame.height), animation: true) {[weak self] (finish) in
            self?.dismiss(animated: self?.dismissWithAnimation ?? false, completion: completion)
        }
    }
    
}

extension OverlayVC: UIGestureRecognizerDelegate {
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let pan = gestureRecognizer as? UIPanGestureRecognizer else {return false}
        
        if let scrollView = scrollView {
            if (pan == dragViewPanGesture || scrollView.contentOffset.y <= 0) && pan.velocity(in: containerView).y > 0 {
                return true
            }
        }
        
        if pan == dragViewPanGesture && pan.velocity(in: containerView).y > 0 {
            return true
        }
        
        return false
    }
    
}

extension OverlayVC {
    
    @objc func panGesture(gesture: UIPanGestureRecognizer) {
        
        switch gesture.state {
        case .changed:
            let translation = gesture.translation(in: containerView)
            containerView.frame.origin.y = containerView.frame.origin.y + translation.y
            break
        case .ended:
            if gesture.velocity(in: containerView).y > 150 {
                contentClose(animation: true)
            } else {
                scrollToTop(animation: true)
            }
            
            break
        default:
            break
        }
        gesture.setTranslation(.zero, in: containerView)
    }
    
    func contentTo(point:CGPoint, animation: Bool, complition:((Bool) ->Void)? = nil) {
        if animation {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: animationSpringWithDamping, initialSpringVelocity: 1, options:  .curveEaseOut, animations: { [weak self] in
                self?.containerView.frame.origin = point
                self?.containerView.layoutIfNeeded()
            }) { (finish) in
                complition?(finish)
            }
        } else {
            containerView.frame.origin = point
            complition?(true)
        }
    }
    
    func scrollToTop(animation: Bool) {
        var top: CGFloat = topSpacing
        
        if #available(iOS 11.0, *) {
            top += view.safeAreaInsets.top
        }
        
        contentTo(point: .init(x: 0, y: top), animation: animation)
        
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
