//
//  Location.swift
//  lumiar-fortaleza
//
//  Created by User on 22/04/26.
//

import Foundation
import SwiftData
import MapKit

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
    var latitude        : Double
    var longitude       : Double
    var comodities      : [Comodities]?
    
    var coordinates: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    init(name: String, title: String, address: String, history: String, category: LocationType, /*neighbourhood: Neighbourhood,*/ visitTimeMin: Int, visitTimeHour: Int, coordinates: CLLocationCoordinate2D, comodities: [Comodities]) {

        self.name = name
        self.title = title
        self.address = address
        self.history = history
        self.category = category
//        self.neighbourhood = neighbourhood
        self.visitTimeMin = visitTimeMin
        self.visitTimeHour = visitTimeHour
        self.latitude = coordinates.latitude
        self.longitude = coordinates.longitude
        self.comodities = comodities
    }
}

let location1 = Location(
    name: "Farol do Mucuripe",
    title: "Um farol que não guia mais navios, mas ainda ilumina histórias",
    address: "R. Amancio Filomeno - Cais do Porto, Fortaleza - CE, 60180-320",
    history: "Antes dos prédios, antes da cidade crescer, já era ele que dominava a paisagem. Construído no século XIX, o Farol do Mucuripe ajudava embarcações a chegar com segurança à costa de Fortaleza. Sua luz alcançava quilômetros no mar e marcou o início de um período importante de crescimento da cidade.  Mas o que muita gente não sabe é que esse lugar vai muito além da função de navegação.  Com o passar dos anos, o farol foi desativado, abandonado e quase esquecido. Sua estrutura chegou a correr risco de desabar e por pouco, Fortaleza não perdeu um dos seus símbolos mais antigos. Foi então que algo mudou: a comunidade ao redor decidiu agir. Moradores do Serviluz se mobilizaram, cobraram, lutaram… e conseguiram salvar o farol. Hoje, ele é um símbolo de resistência e pertencimento Curiosidade: Debaixo do farol, arqueólogos encontraram vestígios de um antigo forte militar, O Fortim de São Luís, revelando que o local já era estratégico muito antes da construção atual",
    category: LocationType.historicalLandmark,
//    neighbourhood: neighbourhood,
    visitTimeMin: 40,
    visitTimeHour: 0,
    coordinates: CLLocationCoordinate2D(latitude: -3.7244, longitude: -38.5231),
    comodities: [ Comodities.bathroom, Comodities.park, Comodities.acessibility]
)

let location2 = Location(
    name: "Catedral Metropolitana de Fortaleza",
    title: "Um símbolo de fé construído ao longo de gerações",
    address: "R. Sobral - Centro, Fortaleza - CE, 60030-030",
    history: "A Catedral Metropolitana de Fortaleza, dedicada a São José, é um dos principais marcos religiosos e arquitetônicos da cidade. Sua construção teve início em 1939 e foi concluída apenas em 1978, após décadas de trabalho e mobilização da comunidade. Projetada pelo engenheiro francês George Mounier, a catedral apresenta um estilo inspirado no gótico, com grandes dimensões e capacidade para milhares de pessoas. Seus vitrais e estrutura imponente se destacam na paisagem urbana, refletindo a importância do espaço para a fé e a cultura local. Antes da construção atual, outras igrejas ocuparam o mesmo papel ao longo da história, sendo reconstruídas devido ao crescimento da cidade e a problemas estruturais. A catedral atual surge, portanto, como resultado de um longo processo de transformação e continuidade religiosa. O interior abriga diferentes capelas, criptas e espaços de contemplação, além de elementos históricos que guardam a memória de líderes religiosos e da própria formação da Arquidiocese. Mais do que um templo, a catedral representa a dedicação de gerações que contribuíram para sua construção, tornando-se um símbolo vivo da identidade e da espiritualidade em Fortaleza. Curiosidade: A construção da catedral levou cerca de 39 anos para ser concluída, quase o mesmo tempo que separa gerações inteiras.",
    category: LocationType.religiousLandmark,
//    neighbourhood: neighbourhood,
    visitTimeMin: 1,
    visitTimeHour: 30,
    coordinates: CLLocationCoordinate2D(latitude: -3.7150, longitude: -38.5430),
    comodities: [ Comodities.bathroom, Comodities.park, Comodities.acessibility]
)

