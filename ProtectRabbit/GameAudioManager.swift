//
//  GameAudioManager.swift
//  FlyMyBird
//
//  Created by goviewtech on 2018/11/30.
//  Copyright © 2018 goviewtech. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class GameAudioManager: NSObject {

    class share {
        static let manager = GameAudioManager()
    }
    
    var player:AVAudioPlayer!
    
   //播放点击音效
   public func playTapAudio () {
        var soundID : SystemSoundID = 0
        
       let fileUrl =  Bundle.main.url(forResource: "game.tap", withExtension: "mp3")
        AudioServicesCreateSystemSoundID(fileUrl! as CFURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
    
    ///游戏结束
    public func playGameOverAudio () {
        var soundID : SystemSoundID = 0
        
        let fileUrl =  Bundle.main.url(forResource: "gameover", withExtension: "mp3")
        AudioServicesCreateSystemSoundID(fileUrl! as CFURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
        
    }
    
    public func playCountDownAudio() {
        var soundID : SystemSoundID = 0
        let fileUrl =  Bundle.main.url(forResource: "count_down", withExtension: "wav")
        AudioServicesCreateSystemSoundID(fileUrl! as CFURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
    
    public func playCountDownStartAudio (){
        var soundID : SystemSoundID = 0
        let fileUrl =  Bundle.main.url(forResource: "count_doun_last", withExtension: "mp3")
        AudioServicesCreateSystemSoundID(fileUrl! as CFURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
    
    
    ///播放背景音乐
    public func playBackgroundMusic () {
        
        let fileUrl =  Bundle.main.url(forResource: "game.background", withExtension: "wav")
        do {
            try player = AVAudioPlayer(contentsOf: fileUrl!)
            player.prepareToPlay()
            player.volume = 0.7
            player.numberOfLoops = -1 //-1:无限循环播放
            player.play()
            
        }catch {
            print("背景音乐播放失败")
        }
    }
    
    
    
    
    public func changeBackgroundMusicVoice(isbegin:Bool) {
        if self.player == nil {
            return
        }
        if isbegin {
            player.volume = 0.2
        }else {
            player.volume = 0.7
        }
        
    }
    
    
    
    
    
    
}
