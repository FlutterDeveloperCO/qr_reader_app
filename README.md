# QR Reader App

This is an app that allows you to scan QR codes and take the user to the destination. The application accepts two types of destination. 

The first is a web page or URL address, in this case the app will take the user to the destination using the default browser. The second is a location which is represented thanks to the latitude and longitude coordinates. 

In this case the app will use the Google Maps API to display the destination location through a marker. The version of SQL for Flutter has been used in order to store the scanned data locally on the device.

**State Management:** Provider |
**Maps:** Google Maps |
**Storage** SQL

## Screenshot Reading Location QR

![Screenshot](screenshot.gif)

## Screenshot Reading URL QR

![Screenshot](screenshot2.gif)
