//
//  WeatherController.swift
//  LeBaluchon
//
//  Created by Pierre on 02/09/2021.
//

import UIKit

class WeatherViewController: UIViewController {
    //Paris
    @IBOutlet weak var parisView: UIView!
    @IBOutlet weak var parisImageView: UIImageView!
    @IBOutlet weak var parisTemperatureLabel: UILabel!
    @IBOutlet weak var parisDescriptionLabel: UILabel!
    @IBOutlet weak var parisLogoWeatherImage: UIImageView!
    @IBOutlet weak var parisLoader: UIActivityIndicatorView!
    
    
    //NewYork
    @IBOutlet weak var newYorView: UIView!
    @IBOutlet weak var newYorkImageView: UIImageView!
    @IBOutlet weak var newYorkTemperatureLabel: UILabel!
    @IBOutlet weak var newYorkDescriptionLabel: UILabel!
    @IBOutlet weak var newYorkLogoWeatherImage: UIImageView!
    @IBOutlet weak var newYorkLoader: UIActivityIndicatorView!
    
    
    var paris = Weather(cityName: "Paris")
    var newYork = Weather(cityName: "New York")
    private let weatherService = WeatherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getWeather()
    }
    
    func updateView() {
        parisTemperatureLabel.text = paris.temperatureString
        parisDescriptionLabel.text = paris.descriptionWithFirstLetterUppercase
        parisLogoWeatherImage.image = UIImage(named: paris.image)
        
        newYorkTemperatureLabel.text = newYork.temperatureString
        newYorkDescriptionLabel.text = newYork.descriptionWithFirstLetterUppercase
        newYorkLogoWeatherImage.image = UIImage(named: newYork.image)
        
    }
    
    func getWeather() {
        weatherService.getWeather { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weathers):
                    //paris
                    self!.paris.description = weathers.list[0].weather[0].weatherDescription
                    self!.paris.temperature = weathers.list[0].main.temp
                    self!.paris.skyStateCode = weathers.list[0].weather[0].id
                 
                    //New York
                    self!.newYork.description = weathers.list[1].weather[0].weatherDescription
                    self!.newYork.temperature = weathers.list[1].main.temp
                    self!.newYork.skyStateCode = weathers.list[1].weather[0].id
                    
                case .failure(let error):
                    print(error)
                }
                self!.updateView()
            }
        }
    }
    
    
   
}
