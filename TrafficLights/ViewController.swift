//
//  ViewController.swift
//  TrafficLights
//
//  Created by pavel on 13.10.2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var greenLightView: UIView!
    @IBOutlet var yelowLightView: UIView!
    @IBOutlet var redLightView: UIView!
    @IBOutlet var trafficLightButton: UIButton!
    
    private var enabledLightView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        trafficLightsOff()
    }

    override func viewWillLayoutSubviews() {
        makeCircleView(greenLightView)
        makeCircleView(yelowLightView)
        makeCircleView(redLightView)
    }
    
    @IBAction func toggleLights() {
        if let enabledLightView = enabledLightView {
            lightViewOff(enabledLightView)
            
            switch enabledLightView {
            case redLightView:
                lightViewOn(yelowLightView)
            case yelowLightView:
                lightViewOn(greenLightView)
            case greenLightView:
                lightViewOn(redLightView)
            default:
                break
            }
        } else {
            trafficLightButton.setTitle("NEXT", for: .normal)
            lightViewOn(redLightView)
        }
    }
    
    private func makeCircleView(_ view: UIView) {
        view.layer.cornerRadius = view.frame.width / 2
    }
    
    private func trafficLightsOff() {
        lightViewOff(greenLightView)
        lightViewOff(yelowLightView)
        lightViewOff(redLightView)
    }
    
    private func lightViewOff(_ view: UIView) {
        view.alpha = 0.4
    }
    
    private func lightViewOn(_ view: UIView) {
        view.alpha = 1
        enabledLightView = view
    }
}

