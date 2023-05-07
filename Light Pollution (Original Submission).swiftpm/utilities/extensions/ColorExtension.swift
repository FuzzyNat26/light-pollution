//
//  File.swift
//  
//
//  Created by Jonathan Lee on 12/04/23.
//

import SwiftUI

extension Color {
    // Environments
    static let skyBlue = Color("SkyBlue")
    static let seaTop = Color("SeaColorTop")
    static let seaBottom = Color("SeaColorBottom")
    static let land = Color("Land")
    static let houseGlowStart = Color("HouseSkyGlowStart")
    static let houseGlowEnd = Color("HouseSkyGlowEnd")
    static let topWood = Color("TopWood")
    static let bottomWood = Color("BottomWood")
    static let picketWood = Color("PicketWood")
    static let railWood = Color("RailWood")
    static let circadianDay = Color("CircadianDay")
    static let circadianNight = Color("CircadianNight")
    static let circadianSun = Color("CircadianSun")
    static let circadianOuterClock = Color("CircadianOuterClock")
    
    // Buildings
    static let house = Color("House")
    static let brightHouse = Color("BrightHouse")
    static let houseLightOn = Color("HouseLightOn")
    static let houseLightOff = Color("HouseLightOff")
    
    static let cityTopOrder = Color("CityTopOrder")
    static let cityMiddleOrder = Color("CityMiddleOrder")
    static let cityBottomOrder = Color("CityBottomOrder")
    
    // Car
    static let carWindShield = Color("CarWindShield")
    static let carBody = Color("CarBody")
    static let carTire = Color("CarTire")
    
    // Lights
    static let streetLightOn = Color("StreetLightOn")
    static let streetLightOff = Color("StreetLightOff")
    static let streetLightCover = Color("StreetLightCover")
    static let lightBulbCap = Color("LightBulbCap")
    
    // Others
    static let human = Color("Human")
    static let baseProgressView = Color("BaseProgressView")
}



/*
    Algorithm were implemented by David Fearon (Davidf2281): https://github.com/davidf2281/ColorTempToRGB
    
    Extended SwiftUI Color instead of UIColor
*/

extension Color
{
    init(temperature: CGFloat)
    {
        let percentKelvin = temperature / 100;
        let red, green, blue: CGFloat

        red =   Self.clamp(percentKelvin <= 66 ? 255 : (329.698727446 * pow(percentKelvin - 60, -0.1332047592)));
        green = Self.clamp(percentKelvin <= 66 ? (99.4708025861 * log(percentKelvin) - 161.1195681661) : 288.1221695283 * pow(percentKelvin - 60, -0.0755148492));
        blue =  Self.clamp(percentKelvin >= 66 ? 255 : (percentKelvin <= 19 ? 0 : 138.5177312231 * log(percentKelvin - 10) - 305.0447927307));

        self.init(red: red / 255, green: green / 255, blue: blue / 255)
    }

    private static func clamp(_ value: CGFloat) -> CGFloat
    {
        return value > 255 ? 255 : (value < 0 ? 0 : value);
    }
}
