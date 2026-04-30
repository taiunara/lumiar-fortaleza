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
    coordinates: CLLocationCoordinate2D(latitude: -3.70778, longitude: -38.47034),
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
    coordinates: CLLocationCoordinate2D(latitude: -3.72469, longitude: -38.5430),
    comodities: [ Comodities.bathroom, Comodities.park, Comodities.acessibility]
)

let location3 = Location(
    name: "Theatro José de Alencar",
    title: "Um palco onde a arte constrói a história da cidade",
    address: "R. Liberato Barroso, 525 - Centro, Fortaleza - CE, 60030-160",
    history: "Inaugurado em 1910, o Theatro José de Alencar é um dos principais patrimônios culturais de Fortaleza, reunindo valor histórico, arquitetônico e artístico. O projeto original, desenvolvido pelo engenheiro Bernardo José de Melo, combina alvenaria com uma estrutura metálica importada de Glasgow, na Escócia, produzida pela empresa Walter Macfarlane & Co. O conjunto arquitetônico é formado por dois núcleos principais: o foyer, com características mais clássicas, e a sala de espetáculos, marcada pelo uso do ferro trabalhado em frisas, camarotes e varandas. A fachada apresenta elementos do estilo art nouveau, enquanto o interior se destaca pelos detalhes ornamentais, vitrais e pela organização do espaço cênico. Ao longo do século XX, o teatro passou por diversas intervenções estruturais, com destaque para a reforma realizada entre 1990 e 1991, que ampliou o complexo e incorporou novos espaços. A partir dessa ampliação, o equipamento passou a funcionar também como centro de formação artística, com atividades voltadas especialmente para as artes cênicas. Com mais de 12 mil metros quadrados, o teatro integra hoje um complexo cultural que inclui áreas para apresentações, ensino e pesquisa. Sua programação abrange espetáculos, cursos, oficinas e visitas, consolidando o espaço como um dos principais polos de produção e difusão cultural do Ceará. Tombado como patrimônio nacional pelo IPHAN, o Theatro José de Alencar mantém um papel ativo na cena cultural da cidade, articulando tradição e contemporaneidade em suas atividades. \nCuriosidade: Além das apresentações, o teatro também funciona como espaço de formação, reunindo atividades educativas que transformam o local em um ambiente contínuo de aprendizado artístico.",
    category: LocationType.theater,
//    neighbourhood: neighbourhood,
    visitTimeMin: 1,
    visitTimeHour: 30,
    coordinates: CLLocationCoordinate2D(latitude: -3.72748, longitude: -38.53167),
    comodities: [ Comodities.bathroom, Comodities.park, Comodities.acessibility]
)

let location4 = Location(
    name: "Praça do Ferreira",
    title: "O ponto onde a cidade se encontra e o tempo se marca",
    address: "R. Floriano Peixoto - Centro, Fortaleza - CE, 60025-060",
    history: "A Praça do Ferreira, localizada no Centro de Fortaleza, é um dos espaços públicos mais simbólicos da cidade, consolidando-se ao longo do tempo como principal ponto de encontro e convivência urbana. Seu nome foi oficializado em 1871, em homenagem ao Boticário Ferreira, responsável pela urbanização da área enquanto presidente da Câmara Municipal. Antes de se tornar a praça que conhecemos hoje, o local era um campo aberto com um poço central, utilizado pela população ao longo do século XIX. Com as reformas iniciadas no começo do século XX, o espaço passou por transformações que reorganizaram sua estrutura e reforçaram seu papel como centro social da cidade. No coração da praça está o seu elemento mais emblemático: o relógio, conhecido como Coluna da Hora. Inaugurado em 1933 e projetado pelo engenheiro José Gonsalves da Justa, o monumento surgiu em um contexto de modernização urbana, simbolizando organização, progresso e a valorização do tempo na vida cotidiana da cidade. Mais do que uma estrutura funcional, o relógio rapidamente se tornou um ponto de referência para encontros, manifestações e circulação de pessoas. Sua presença ajudou a consolidar a praça como um espaço de convergência social, onde diferentes ritmos da cidade se cruzam ao longo do dia. Ao longo das décadas, tanto a praça quanto o relógio passaram por mudanças, incluindo a demolição do monumento original em 1967 e sua reconstrução em 1991, mantendo seu valor simbólico mesmo com alterações estruturais. Conhecida como o “coração da cidade”, a Praça do Ferreira permanece como um espaço ativo, reunindo comércio, manifestações culturais e fluxos intensos de pessoas, refletindo diretamente a dinâmica urbana de Fortaleza. \nCuriosidade: Antes da construção do relógio, o centro da praça era ocupado por um coreto, onde aconteciam apresentações musicais e encontros públicos. A Coluna da Hora assumiu esse papel, tornando-se o principal ponto de referência e encontro da população.",
    category: LocationType.touristAttraction,
//    neighbourhood: neighbourhood,
    visitTimeMin: 1,
    visitTimeHour: 30,
    coordinates: CLLocationCoordinate2D(latitude: -3.72761, longitude: -38.52747),
    comodities: [Comodities.park, Comodities.acessibility]
)

let location5 = Location(
    name: "Praia de Iracema",
    title: "Entre reformas e memórias, um dos espaços mais marcantes da cidade",
    address: "Pte. do Ingleses - R. dos Cariris - Praia de Iracema, Fortaleza - CE, 60060-230",
    history: "A Ponte dos Ingleses começou a ser construída em 1920 com a proposta de funcionar como um porto de embarque e desembarque, em um momento em que a estrutura existente na cidade já não atendia às necessidades da época. O projeto, desenvolvido por engenheiros ingleses, previa uma extensão de 800 metros, mas nunca foi concluído. A obra foi interrompida por falta de recursos e a ponte nunca chegou a cumprir sua função original. Ao longo do tempo, o espaço foi sendo incorporado ao cotidiano da população, tornando-se um ponto de encontro ligado ao mar, à paisagem e à convivência. Reconhecida pelo seu valor simbólico, a estrutura foi tombada em 1989 e passou por diferentes intervenções ao longo das décadas. Reformas, interdições e períodos de abandono marcaram sua trajetória, refletindo disputas, desafios de manutenção e o desgaste natural causado pelo ambiente marítimo. Após permanecer fechada por mais de seis anos, a ponte foi reinaugurada em 2024 com um novo projeto de requalificação. A estrutura recebeu melhorias como reforço no piso, nova iluminação, acessibilidade ampliada e reconstrução de espaços como quiosques, pavilhão central e áreas de convivência. O local também passou a contar com programação cultural e serviços voltados ao turismo. Mesmo com tantas transformações, a Ponte dos Ingleses segue como um dos principais pontos de conexão entre a cidade e o mar, reunindo história, uso cotidiano e significado coletivo. \nCuriosidade: Apesar de ter sido planejada para alcançar cerca de 800 metros de extensão, apenas aproximadamente 130 metros da ponte foram construídos e permanecem até hoje.",
    category: LocationType.touristAttraction,
//    neighbourhood: neighbourhood,
    visitTimeMin: 1,
    visitTimeHour: 30,
    coordinates: CLLocationCoordinate2D(latitude: -3.71841, longitude: -38.51684),
    comodities: [Comodities.park, Comodities.acessibility]
)
