import Flutter
import UIKit

public class ProxyConnectionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "system_proxy", binaryMessenger: registrar.messenger())
    let instance = ProxyConnectionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "getProxySettings") {
      let proxyConnectionSettings = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() ?? [:] as CFDictionary
      result(proxyConnectionSettings as NSDictionary);
      return;
    }
  }
}
