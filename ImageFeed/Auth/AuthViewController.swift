//
//  AuthViewController.swift
//  ImageFeed
//
//  Created by Pavel Popov on 07.03.2024.
//

import UIKit

//MARK: - AuthViewControllerDelegate
protocol AuthViewControllerDelegate: AnyObject {
    func didAuthenticate(_ vc: AuthViewController, didAuthenticateWithCode code: String)
}

//MARK: - AuthViewController
final class AuthViewController: UIViewController {
    
    //MARK: - Public Properties
    weak var delegate: AuthViewControllerDelegate?
    
    //MARK: - Private properties
    private let ShowWebViewSegueIdentifier = "ShowWebView"
    
    //MARK: - Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ShowWebViewSegueIdentifier {
            guard let webViewViewController = segue.destination as? WebViewViewController else {
                fatalError("Failed for prepare \(ShowWebViewSegueIdentifier)")
            }
            webViewViewController.delegate = self
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
}

//MARK: - WebViewViewControllerDelegate
extension AuthViewController: WebViewViewControllerDelegate {
    
    //MARK: - Public Methods
    func webViewViewControllerDidCancel(_ vc: WebViewViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String) {
        delegate?.didAuthenticate(self, didAuthenticateWithCode: code)
    }
}

