#!/usr/bin/swift

//  Created by Eduardo Oliveira on 10/03/20.

import Foundation

func ifLevel(level: String) -> Bool {
    if (level.isEmpty) {
        return  false
    }
    return true
}

func getDocumentsDiretory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

func readFile(filepath: URL ) -> String {
    var content = ""
    do {
        content = try String(contentsOf: filepath, encoding: .utf8)
    } catch {
        
    }
    return content
}

func writeFile(filepath: URL, level: String) {
    do {
        try level.write(to: filepath, atomically: true, encoding: .utf8)
    }
    catch {/* error handling here */}
}

func askLevel() -> String {
    var lvl = ""
    while let str = readLine(strippingNewline: true) {
        if( str == "1" || str == "2" || str == "3" ){
            lvl = str
            break
        } else {
            print("\u{001B}[0;37mOs níveis disponíveis são:\u{001B}[0;32m 1- Fácil\u{001B}[0;33m 2- Intermediário\u{001B}[0;31m 3- Avançado")
            print("\u{001B}[0;37mDigite uma opção válida")
        }
    }
    return lvl
}

func checkLevel(isRedefine: Bool) -> String {
    let filepath = getDocumentsDiretory().appendingPathComponent("nivel.txt")

    var nivel = readFile(filepath: filepath)
    
    if isRedefine {
        print("\u{001B}[0;37mRedefina seu nível de conhecimento em Swift: ")
        print("\u{001B}[0;37mOs níveis disponíveis são:\u{001B}[0;32m 1- Fácil\u{001B}[0;33m 2- Intermediário\u{001B}[0;31m 3- Avançado\u{001B}[5;37m")
        nivel = askLevel()
        writeFile(filepath: filepath, level: nivel)
    } else {
        if !ifLevel(level: nivel) {
            print("Insira seu nível de conhecimento em Swift: ")
            print("\u{001B}[0;37mOs níveis disponíveis são:\u{001B}[0;32m 1- Fácil\u{001B}[0;33m 2- Intermediário\u{001B}[0;31m 3- Avançado\u{001B}[5;37m")
            nivel = askLevel()
            writeFile(filepath: filepath, level: nivel)
        }
    }
    return nivel
}

func clear() {
    let p = Process()
    p.launchPath = "/usr/bin/clear"
    p.launch()
    p.waitUntilExit()
}

struct Level {
    var frases: [[String]] = [
        ["0", "Historia"],
        ["1", "Facil", "Easy", "Brise","Cafe","Swift"],
        ["2", "Medio"],
        ["3", "Dificil", "Hard", "Ultra", "Pipoca"]
    ]
    
    var ilustracao: [[String]] = [
        ["0", "Historia"],
        ["1", """
                                              ((
                                               ,((/
                     /                           ((((
             (        ((*                        ,(((((
               ((       (((,                      (((((((
                .(((      ((((,                    (((((((.
                  ,((((     (((((,                 ((((((((/
                    ,(((((    ((((((*              ((((((((((
                       ((((((,  (((((((/           (((((((((((
                         ((((((((.(((((((((       ((((((((((((
                           /((((((((((((((((((.  /(((((((((((((
                              (((((((((((((((((((((((((((((((((
                                /((((((((((((((((((((((((((((((
                                   ((((((((((((((((((((((((((((
        (,                            ((((((((((((((((((((((((
          (((((.                       (((((((((((((((((((((((
            /(((((((((((((////((((((((((((((((((((((((((((((((((
               /(((((((((((((((((((((((((((((((((((((((((((((((((
                  .(((((((((((((((((((((((((((((((((((((((((((((((
                      ,(((((((((((((((((((((((((((((((      /(((((
                           .((((((((((((((((((((((.             ((
        """],
        ["2", "Medio"],
        ["3", "Dificil"]
    ]
    
    var difficulty: Int
    
    init() {
        difficulty = 0
    }
    
    mutating func levelInt(level: String) {
        difficulty = Int(level)!
        defineLevel()
    }
    
    func defineColor() {
        switch difficulty {
        case 1:
            print("\u{001B}[0;32m")
        case 2:
            print("\u{001B}[0;33m")
        case 3:
            print("\u{001B}[0;31m")
        case 0:
            print("\u{001B}[0;36m")
        default:
            print("\u{001B}[0;37m")
        }
    }
    
    mutating func defineLevel() {
        let random = Int.random(in: 1...100)
        if random > 80 {
            difficulty = 0
        }
        let y = frases[difficulty].count
        let x = Int.random(in: 1..<y)
        print(frases[difficulty][x])
        defineColor()
        print(ilustracao[difficulty][1])
    }
    
}



func controlMenu(menuIndex: String){
    switch menuIndex {
    case "1":
        print("Carregando...")
    case "2":
        let _ = checkLevel(isRedefine: true)
    case "3":
        clear()
        exit(0)
    default:
        print("Easter Egg 👽")
    }
}

func menu () {
    print("\n\u{001B}[7;37m")
    print("+----------------------------+")
    print("|  1-) Mostrar mais          |")
    print("|  2-) Redefinir             |")
    print("|  3-) Sair                  |")
    print("+----------------------------+")
    print("\n\u{001B}[0;37m")
}
// 5 Pisca
// 1 Bold
// 7 Preenche
var lvl = Level()
clear()
while(true) {
    let swiftLevel = checkLevel(isRedefine: false)
    lvl.levelInt(level: swiftLevel)
    menu()
    while let str = readLine(strippingNewline: true) {
        if( str == "1" || str == "2" || str == "3" ){
            controlMenu(menuIndex: str)
            clear()
            print("\u{001B}[0;37m")
            break
        } else {
            print("\u{001B}[0;37mDigite uma opção válida")
        }
    }
}


//println("\u{001B}[0;33myellow")
