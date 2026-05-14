//
//  MotionService.swift
//  MotionSensors
//
//  Created by Reginald Grant on 5/13/26.
//

import Foundation
import CoreMotion  // <------- Motion Data, Gyro, Accel.



class MotionService{
    
    // Acess to motion data - CoreMotion class
    private let motionManager:CMMotionManager = CMMotionManager()
    
    
    
    func startGettingValues(
        onAccel:@escaping (Double,Double,Double) -> Void,
        onGyro:@escaping (Double,Double,Double) -> Void,
    ){
        
        //Acceleration
        if self.motionManager.isAccelerometerAvailable == true{
            
            self.motionManager.accelerometerUpdateInterval = 0.10
            
            let accelerometerHandler: CMAccelerometerHandler = { data, error in
                
                if let safeData: CMAccelerometerData = data {
                    let x:Double = safeData.acceleration.x
                    let y:Double = safeData.acceleration.y
                    let z:Double = safeData.acceleration.z
                    
                    onAccel(x,y,z)
                }
                
                
            }
            
            self.motionManager.startAccelerometerUpdates(to: .main, withHandler: accelerometerHandler)
        }
        
        if self.motionManager.isGyroAvailable == true{
            
            self.motionManager.gyroUpdateInterval = 0.1
            
            self.motionManager.startGyroUpdates(to: .main){(data,error) in
                if let safeData:CMGyroData = data {
                    let x:Double = safeData.rotationRate.x
                    let y:Double = safeData.rotationRate.y
                    let z:Double = safeData.rotationRate.z
                    
                    onGyro(x,y,z)
                    
                }
                
                
            }
            
        }
        
    }
    
    
    func stop(){
        self.motionManager.stopGyroUpdates()
        self.motionManager.stopAccelerometerUpdates()
        
    }
    
    
    
    
}
