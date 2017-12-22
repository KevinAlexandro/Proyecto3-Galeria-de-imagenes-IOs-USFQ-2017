//
//  ViewController.swift
//  ImagenesProyecto3
//
//  Created by user130165 on 10/13/17.
//  Copyright © 2017 KevinGonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Lista de imagenes
    let allImagenes =
    [
        "https://www.nasa.gov/sites/default/files/thumbnails/image/potw1737a.jpg",
        "https://www.nasa.gov/sites/default/files/thumbnails/image/potw1636a.jpg",
        "https://www.nasa.gov/sites/default/files/thumbnails/image/hinode_aug21.png",
        "https://www.nasa.gov/sites/default/files/thumbnails/image/name_chip_main-opt.jpg",
        "https://www.nasa.gov/sites/default/files/thumbnails/image/westerlund_2_composite.jpg",
        "https://www.nasa.gov/sites/default/files/thumbnails/image/cdfs2_0.jpg",
        "https://www.nasa.gov/sites/default/files/thumbnails/image/cen_multi.jpg",
        "https://www.nasa.gov/sites/default/files/thumbnails/image/arp299.jpg",
        "https://www.nasa.gov/sites/default/files/thumbnails/image/potw1722a.jpg",
        "https://www.nasa.gov/sites/default/files/thumbnails/image/eclipsecorona.png"
    ]
    
    
    //accion que es adoptada por todos los botones.
    
    @IBAction func CambiarImagen(_ sender: UIButton) {
        //se crea un hilo para cambiar de imagen.
        
        DispatchQueue.global(qos: .userInitiated).async
        {
            self.showImage(button: sender)
        }
    }
    
    
    var indexImagenesEnUso = [11,11,11,11,11,11]; //se incializa con valores que nunca van a ser alcanzadas
    
    //cambiar las imagenes
    func showImage(button : UIButton)
    {

        //creo y cargo la imagen
        var imagen : UIImage
        {
            get
            {
                return button.currentImage!
            }
            set
            {
                button.setImage(newValue, for: .normal)
            }
        }
        
        var regresar = false
        var index = 0
        
        repeat
        {
            regresar = false
            let loteria = Int (arc4random_uniform(10))
            index = loteria
            if indexImagenesEnUso.contains(loteria)
            {
                regresar = true
            }
        }
        while regresar
        
        indexImagenesEnUso[button.tag] = index
        if let url = URL.init(string: allImagenes[index])
        {
            let urlLink = try? Data(contentsOf: url)
            if let imageData = urlLink
            {
                imagen = UIImage(data: imageData)!
            }
        }
        
    }
    
}

