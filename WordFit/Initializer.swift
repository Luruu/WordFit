//
//  Initializer.swift
//  WordFit
//
//  Created by Renato on 22/10/21.
//

import Foundation
/*
 Per testare l'avvio corretto dovete:
 1)Commentare da riga 21 a 23 e decommentare la riga 19.
 2)Avviare il programma e vi apparirà la schermata principale, chiudete (Adesso le impostazioni sono pulite).
 3)Ora è come l'utente vede l'app quando la scarica per la prima volta
 4)Commentare riga 19 e decommentare da 21 a 23, avviando la prima volta vedete la schermata welcome etc. dagli avvii successivi la schermata welcome non appare più.
 */
class Initializer{
    init(){
        WordList.getIstance().listInitializer()
        
        //appPreferences.clearList()
        let isNotEmpty = appPreferences.getBoolPreferences(forKey: "NotEmpty")
        if (isNotEmpty == false) { //it's empty, so load preferences.
            appPreferences.loadPreferences()
       } 
    }
}
