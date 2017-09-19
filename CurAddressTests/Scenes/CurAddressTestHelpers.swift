//
//  CurAddressTestHelpers.swift
//  CurrentAddress
//
//  Created by Raymond Law on 9/18/17.
//
//

import XCTest
import MapKit
import AddressBook

class CurAddressTestHelpers: XCTestCase
{
  static var location: CLLocation
  {
    let location = CLLocation(latitude: 37.92, longitude: -78.02)
    return location
  }
  
  static var placemark: MKPlacemark
  {
    // Reference: http://szulctomasz.com/2015/07/01/ios-unit-testing-in-swift-and-clplacemark-mocking.html
    let addressDictionary: [String: Any] = [
      kABPersonAddressStreetKey as String: "Infinite Loop",
      "SubThoroughfare": "1",
      kABPersonAddressCityKey as String: "Cupertino",
      "SubLocality": "San Francisco",
      kABPersonAddressStateKey as String: "CA",
      "SubAdministrativeArea": "Santa Clara",
      kABPersonAddressZIPKey as String: "95014",
      kABPersonAddressCountryKey as String: "United States",
      kABPersonAddressCountryCodeKey as String: "US"
    ]
    let placemark = MKPlacemark(coordinate: location.coordinate, addressDictionary: addressDictionary)
    return placemark
  }
}
