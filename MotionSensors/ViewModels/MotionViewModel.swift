//
//  MotionViewModel.swift
//  MotionSensors
//
//  Created by Reginald Grant on 5/13/26.
//

import Foundation
import Combine

class MotionViewModel:ObservableObject{
    
    @Published var accelX:Double = 0
    @Published var accelY:Double = 0
    @Published var accelZ:Double = 0
    
    
    
    @Published var gyroX:Double = 0
    @Published var gyroY:Double = 0
    @Published var gyroZ:Double = 0
    
    
    
    @Published var isRunning:Bool = false
    
    var motion:MotionService = MotionService()
    
    
    func start(){
        
        if isRunning == true {
            return
        }
        
        motion.startGettingValues(onAccel:{
            (x:Double,y:Double,z:Double) in
            self.accelX = x
            self.accelY = y
            self.accelZ = z
            
        } , onGyro: {(x:Double,y:Double,z:Double) in
            
            self.gyroX = x
            self.gyroY = y
            self.gyroZ = z
            
        }
                                  )
        
    }
    
    func stop(){
        motion.stop()
        isRunning = false
    }
    
    // Business Logic
    func almostLeved()->String{
        let xAbs = abs(accelX)
        let yAbs = abs(accelY)
        
        if xAbs < 0.10 && yAbs < 0.10{
            return "Phone is leveled"
        }else{
            return "Phone is tilited"
        }
    }
    
}
