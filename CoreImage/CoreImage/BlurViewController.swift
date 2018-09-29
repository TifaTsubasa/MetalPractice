//
//  BlurViewController.swift
//  CoreImage
//
//  Created by tsuf on 2018/9/29.
//  Copyright © 2018 upmer. All rights reserved.
//

import UIKit

class BlurViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let image: UIImage! = UIImage(named: "gf.jpeg")
        self.imageView.image = blur(image: image)

    }
    
    func blur(image: UIImage) -> UIImage? {
        let ciImage: CIImage! = CIImage(image: image)
        
        let filter: CIFilter! = CIFilter(name: "CIMotionBlur", parameters: [kCIInputImageKey: ciImage])
        filter.setValue(10, forKey: kCIInputRadiusKey)
        
        guard let outputImage: CIImage = filter.outputImage else {
            return nil
        }
        
        let context = CIContext(options: [CIContextOption.useSoftwareRenderer: false])
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
            return nil
        }
        let image = UIImage(cgImage: cgImage)
        return image
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
