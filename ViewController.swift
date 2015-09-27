//
//  ViewController.swift
//  scale
//
//  Created by Seiji Yoshida on 2015/09/19.
//  Copyright (c) 2015年 fromageblanc recette. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UIPickerViewDelegate {

    @IBOutlet var keyLabels: [UIButton]!
    var soundOnOff:Bool = true
    
    let keyboards = ["C4","C#4","D4","D#4","E4","F4","F#4","G4","G#4","A4","A#4","B4","C5"]
    var audioPlayers:[AVAudioPlayer] = []
    
    @IBOutlet weak var pickerView: UIPickerView!
    var pickupedScaleVal:Int = 0

    // scale
    private let pickerVals =
            [   "Major Scale",
                "Natural minor Scale",
                "Harmonic minor Scale",
                "Melodic minor Scale",
                "Harmonic minor p5 down Scale",
                "Ionian Scale",
                "Dorian Scale",
                "Frydian Scale",
                "Lydian Scale",
                "Mixolydian Scale",
                "Aeorian Scale",
                "Locrian Scale",
            ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //view.backgroundColor = UIColor.yellowColor()
        // init audio player instanc
        initAudio(toneFlg:0)
        reset(nil)

    }

    func initAudio(toneFlg:Int = 0){
        for keyboard in keyboards {
            println(keyboard)
            let soundfile = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(keyboard, ofType:"caf")!)
            let audioPlayer = AVAudioPlayer(contentsOfURL: soundfile, error: nil)
            audioPlayer.prepareToPlay()
            audioPlayers.append(audioPlayer)
        }
    }

    @IBAction func playSound(sender: UIButton) {
        
        reset(nil)
        
        if soundOnOff {
            audioPlayers[sender.tag].currentTime = 0
            audioPlayers[sender.tag].play()
        }
        
        let curKeyTag = sender.tag as Int
        
        //let target = 0 // pickerから
        scaleDecode(curKeyTag,targetScale:pickupedScaleVal)
    }
    
    @IBAction func reset(sender:UIButton?) {
        
        var initColor:UIColor
        
        for i in 0...11 {
            
            if (i == 1) || (i == 3) || (i == 6) || (i == 8) || (i == 10) {
                initColor = UIColor.lightGrayColor()
            } else {
                initColor = UIColor.whiteColor()
            }
            keyLabels[i].backgroundColor = initColor
        }
    }

    /**** Scale Dec *****/
    func scaleDecode(curKeyTag:Int,targetScale:Int) {
        
        var interval:[Int]
        
        switch pickupedScaleVal {
        case 0:
            interval = [0,2,2,1,2,2,2] //major
        case 1:
            interval = [0,2,1,2,2,1,2] //natural minor
        case 2:
            interval = [0,2,1,2,2,1,3] //harmonic minor
        case 3:
            interval = [0,2,1,2,2,2,2] //melodic minor
        case 4:
            interval = [0,1,3,1,2,1,2,2] //hmp5
        default :
            interval = [0,2,2,1,2,2,2]
        break
        }
        
        var i = curKeyTag
        
        for itv in interval {
            i += itv
            if i > 11 {
                i -= 12
            }
            keyLabels[i].backgroundColor = UIColor.yellowColor()
        }
        // rootは色変える
        keyLabels[curKeyTag].backgroundColor = UIColor.orangeColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    pickerに表示する列数を返すデータソースメソッド.
    (実装必須)
    */
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    /*
    pickerに表示する行数を返すデータソースメソッド.
    (実装必須)
    */
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerVals.count
        
    }
    /*
    pickerに表示する値を返すデリゲートメソッド.
    */
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        
        return pickerVals[row] as String
        
    }
    /*
    pickerが選択された際に呼ばれるデリゲートメソッド.
    */
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //println("row: \(row)")
        //println("value: \(pickerVals[row])")
        pickupedScaleVal = row
        
        
    }
    
    @IBAction func soundSwitch(sender: AnyObject) {
        if sender.selectedSegmentIndex == 0 {
            soundOnOff = true
        } else {
            soundOnOff = false
        }
    }
}

