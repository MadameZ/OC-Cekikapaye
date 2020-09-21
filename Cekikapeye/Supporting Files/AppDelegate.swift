//
//  AppDelegate.swift
//  Cekikapeye
//
//  Created by Ambroise COLLON on 21/05/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    /// Cette propriété persistentContainer nous permet d'installer Core Data :
    lazy var persistentContainer: NSPersistentContainer = {
        /// let container = NSPersistentContainer(name: "Cekikapeye") :
        /// pour que NSPersistentContainer fasse son travail (créer les différents fichiers, initialiser le NSManagedObjectModel et le NSPersistentStoreCoordinator) il faut donner le nom de notre fichier.
        let container = NSPersistentContainer(name: "Cekikapeye")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    /// Pour accéder à notre propriété persistentContainer :
    /// comme la propriété delegate de UIApplication est de type UIApplicationDelegate il faut controller son type avec as!
    /// grâce à cette écriture de persistentContainer, on va pouvoir y accéder comme ceci : AppDelegate.persistentContainer
    static var persistentContainer: NSPersistentContainer {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    }

    /// Pour récupérer le context car c'est dans le contexte que nous manipulons les données :
    /// elle est de type NSManagedObjectContext de la classe NSPersistentContainer
    /// cette propriété retourne un contexte à utiliser dans le Main thread
    static var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

