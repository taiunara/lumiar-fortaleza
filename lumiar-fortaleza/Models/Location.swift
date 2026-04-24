//
//  Location.swift
//  lumiar-fortaleza
//
//  Created by User on 22/04/26.
//

import Foundation
import SwiftData

@Model
class Location {
    var name            : String
    var title           : String
    var address         : String
    var history         : String
    var category        : LocationType
//    var neighbourhood   : Neighbourhood?
    var visitTimeMin    : Int
    var visitTimeHour   : Int
    
    init(name: String, title: String, address: String, history: String, category: LocationType, /*neighbourhood: Neighbourhood,*/ visitTimeMin: Int, visitTimeHour: Int) {
        self.name = name
        self.title = title
        self.address = address
        self.history = history
        self.category = category
//        self.neighbourhood = neighbourhood
        self.visitTimeMin = visitTimeMin
        self.visitTimeHour = visitTimeHour
    }
}

let location1 = Location(
    name: "Farol do Mucuripe",
    title: "Um farol que não guia mais navios, mas ainda ilumina histórias",
    address: "R. Amancio Filomeno - Cais do Porto, Fortaleza - CE, 60180-320",
    history: "Antes dos prédios, antes da cidade crescer… já era ele que dominava a paisagem.  Construído no século XIX, o Farol do Mucuripe ajudava embarcações a chegar com segurança à costa de Fortaleza. Sua luz alcançava quilômetros no mar e marcou o início de um período importante de crescimento da cidade.  Mas o que muita gente não sabe é que esse lugar vai muito além da função de navegação.  Com o passar dos anos, o farol foi desativado, abandonado e quase esquecido. Sua estrutura chegou a correr risco de desabar e por pouco, Fortaleza não perdeu um dos seus símbolos mais antigos.  Foi então que algo mudou: a comunidade ao redor decidiu agir.  Moradores do Serviluz se mobilizaram, cobraram, lutaram… e conseguiram salvar o farol. Hoje, ele é um símbolo de resistência e pertencimento Curiosidade: Debaixo do farol, arqueólogos encontraram vestígios de um antigo forte militar, O Fortim de São Luís, revelando que o local já era estratégico muito antes da construção atual",
    category: LocationType.historicalLandmark,
//    neighbourhood: neighbourhood,
    visitTimeMin: 40,
    visitTimeHour: 0
)

