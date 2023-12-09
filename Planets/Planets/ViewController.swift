//
//  ViewController.swift
//  Planets
//
//  Created by Veerjyot Singh on 11/10/22.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet weak var Planet: UIPickerView!
    @IBOutlet var sceneView: ARSCNView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the view's delegatest
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
        
        // Create a new scene
        sceneView.automaticallyUpdatesLighting = true
        // Set the scene to the view
        addSphereToScene(radius: 0.02, PlanetName:"Mercury", Distance: 0.3)
        addSphereToScene(radius: 0.06, PlanetName: "Venus", Distance: 0.5)
        addSphereToScene(radius: 0.064, PlanetName: "Earth", Distance: 0.7)
        addSphereToScene(radius: 0.03, PlanetName: "Mars", Distance: 0.9)
        addSphereToScene(radius: 0.7, PlanetName: "Jupiter", Distance: 2.0)
        addSphereToScene(radius: 0.58, PlanetName: "Saturn", Distance: 3.5)
        addSphereToScene(radius: 0.25, PlanetName: "Uranus", Distance: 5.1)
        addSphereToScene(radius: 0.24, PlanetName: "Neptune", Distance: 5.7)
        let disc = SCNTube(innerRadius: 0.6, outerRadius: 0.9, height: 0.01)
        disc.firstMaterial?.emission.contents = UIImage(named: "art.scnassets/SaturnRing.jpeg")
        let discNode = SCNNode(geometry: disc)
        let rotation = SCNAction.rotateBy(x: 0, y: 0.3, z: 0, duration: 2)
        discNode.runAction(SCNAction.repeatForever(rotation))
        discNode.position = SCNVector3(x: 0, y: 0, z: -3.5)
        sceneView.scene.rootNode.addChildNode(discNode)
    }
    func addSphereToScene(radius:CGFloat, PlanetName:String, Distance:Float){
        let sphere = SCNSphere(radius: radius/1.5)
        sphere.firstMaterial?.diffuse.contents = UIImage(named: "art.scnassets/"+PlanetName+".jpeg")
        let sphereNode = SCNNode(geometry: sphere)
        let rotation = SCNAction.rotateBy(x: 0, y: 0.3, z: 0, duration: 2)
        sphereNode.position = SCNVector3(x: 0, y: 0, z: -Distance)
        sphereNode.runAction(SCNAction.repeatForever(rotation))
        sceneView.scene.rootNode.addChildNode(sphereNode)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

