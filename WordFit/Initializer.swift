//
//  Initializer.swift
//  WordFit
//
//  Created by Renato on 22/10/21.
//

import Foundation
/*
 Per testare l'avvio corretto dovete:
 1)Commentare da riga 18 a 21 e decommentare la riga 16.
 2)Avviare il programma e vi apparirà la schermata principale, chiudete (Adesso le impostazioni sono pulite).
 3)Ora è come l'utente vede l'app quando la scarica per la prima volta
 4)Commentare riga 16 e decommentare da 18 a 21, avviando la prima volta vedete la schermata welcome etc. dagli avvii successivi la schermata welcome non appare più.
 */
class Initializer{
    init(){
        WordList.getIstance().listInitializer()
//        appPreferences.clearList()
        let isNotEmpty = appPreferences.getBoolPreferences(forKey: "NotEmpty")
        if (isNotEmpty == false) { //it's empty
            print("empty, carico i valori di default.")
            appPreferences.loadPreferences()
       }
        
        //UserDefaults.standard.removeObject(forKey: "NotEmpty")
        //print("rimosso")
    }
}
