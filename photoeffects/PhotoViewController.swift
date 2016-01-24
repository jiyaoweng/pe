//
//  PhotoViewController.swift
//  photoeffects
//
//  Created by jiyao weng on 2016-01-23.
//  Copyright © 2016 jiyao weng. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var chosenImage: UIImage? = nil
    var filterNameList:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.contentMode = .ScaleAspectFill ;
        imageView.image = chosenImage;
        
        
        createEffect()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createEffect() {
        let filter = CIFilter(name: "CISepiaTone")
        filter!.setValue(CIImage(image: chosenImage!), forKey: kCIInputImageKey)
        filter!.setValue(0.8, forKey: kCIInputIntensityKey)
        let ctx = CIContext(options:nil)
        let cgImage = ctx.createCGImage(filter!.outputImage!, fromRect:filter!.outputImage!.extent)

        imageView.image = UIImage(CGImage: cgImage)
        
        getAllFilters()
    }

    func getAllFilters() -> NSArray {
        
 //       var d:FilterDescriptor
        
 //       FilterDescriptor *video = [[FilterDescriptor alloc] initWithName:@"SourceVideoFilter"];
 //       [_sources addObject:video];
        
 //       FilterDescriptor *image = [[FilterDescriptor alloc] initWithName:@"SourcePhotoFilter"];
 //       [_sources addObject:image];
        
        for filtername:String in CIFilter.filterNamesInCategory(kCICategoryBuiltIn)
        {
//            let f = CIFilter(name:filtername)
//            if (f==nil | f.isUsableFilter == NO) {
//                continue;
//            }
            
            filterNameList.append(filtername)

        }
        
        NSLog("\(filterNameList)")
        
        return filterNameList

    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
