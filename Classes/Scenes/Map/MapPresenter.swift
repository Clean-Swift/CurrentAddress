//
//  MapPresenter.swift
//  CurrentAddress
//
//  Created by Raymond Law on 7/20/17.
//  Copyright (c) 2017 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import MapKit

protocol MapPresentationLogic
{
  func presentRequestForCurrentLocation(response: Map.RequestForCurrentLocation.Response)
  func presentGetCurrentLocation(response: Map.GetCurrentLocation.Response)
  func presentCenterMap(response: Map.CenterMap.Response)
  func presentGetCurrentAddress(response: Map.GetCurrentAddress.Response)
}

class MapPresenter: MapPresentationLogic
{
  weak var viewController: MapDisplayLogic?
  
  // MARK: Request for current location
  
  func presentRequestForCurrentLocation(response: Map.RequestForCurrentLocation.Response)
  {
    var viewModel: Map.RequestForCurrentLocation.ViewModel
    if response.success {
      viewModel = Map.RequestForCurrentLocation.ViewModel(success: true, errorTitle: nil, errorMessage: nil)
    } else {
      viewModel = Map.RequestForCurrentLocation.ViewModel(success: false, errorTitle: "Location Disabled", errorMessage: "Please enable location services in the Settings app.")
    }
    viewController?.displayRequestForCurrentLocation(viewModel: viewModel)
  }
  
  // MARK: Get current location
  
  func presentGetCurrentLocation(response: Map.GetCurrentLocation.Response)
  {
    var viewModel: Map.GetCurrentLocation.ViewModel
    if response.success {
      viewModel = Map.GetCurrentLocation.ViewModel(success: true, errorTitle: nil, errorMessage: nil)
    } else {
      let errorTitle = "Error"
      let errorMessage: String?
      if response.error?.code == CLError.locationUnknown.rawValue {
        errorMessage = "Your location could not be determined."
      } else {
        errorMessage = response.error?.localizedDescription
      }
      viewModel = Map.GetCurrentLocation.ViewModel(success: false, errorTitle: errorTitle, errorMessage: errorMessage)
    }
    viewController?.displayGetCurrentLocation(viewModel: viewModel)
  }
  
  // MARK: Center map
  
  func presentCenterMap(response: Map.CenterMap.Response)
  {
    let viewModel = Map.CenterMap.ViewModel(coordinate: response.coordinate)
    viewController?.displayCenterMap(viewModel: viewModel)
  }
  
  // MARK: Get current address
  
  func presentGetCurrentAddress(response: Map.GetCurrentAddress.Response)
  {
    let viewModel = Map.GetCurrentAddress.ViewModel(success: response.success)
    viewController?.displayGetCurrentAddress(viewModel: viewModel)
  }
}
