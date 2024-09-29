import Foundation
import Capacitor
import UIKit

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(MyCustomPluginPlugin)
public class MyCustomPluginPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "MyCustomPluginPlugin"
    public let jsName = "MyCustomPlugin"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "setBackgroundColor", returnType: CAPPluginReturnPromise)
    ]
    private let implementation = MyCustomPlugin()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    @objc func setBackgroundColor(_ call: CAPPluginCall) {
        let colorString = call.getString("color") ?? "#000000"
        
        DispatchQueue.main.async {
        // Get the root WKWebView of the Capacitor app
        if let webView = self.bridge?.webView {
            // Set the background color of the WKWebView itself
            webView.backgroundColor = self.hexStringToUIColor(hex: colorString)
            webView.isOpaque = false // Ensures the WebView shows the background color
            
            // Return the color in the resolved response
            var result = JSObject()
            result["color"] = colorString
            call.resolve(result)
        } else {
            call.reject("Unable to find WKWebView")
        }
    }
    }

    func hexStringToUIColor(hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
