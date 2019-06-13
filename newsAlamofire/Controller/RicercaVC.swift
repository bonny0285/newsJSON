//
//  RicercaVC.swift
//  newsAlamofire
//
//  Created by Massimiliano on 13/06/2019.
//  Copyright © 2019 Massimiliano Bonafede. All rights reserved.
//

import UIKit

class RicercaVC: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    
    
     let pickerData = ["ANDORRA","EMIRATI ARABI UNITI","ANTIGUA/BARBUDA","ANGUILLA","ALBANIA","ARMENIA","ANTILLE OLANDESI","ANGOLA","ARGENTINA","SAMOA (USA)","AUSTRIA","AUSTRALIA","ARUBA","AZERBAIGIAN","BOSNIA-ERZEGOVINA","BARBADOS","BANGLADESH","BELGIO","BURKINA FASO","BULGARIA","BAHREIN","BURUNDI","BENIN","BERMUDE","BRUNEI","BOLIVIA","BRASILE","BAHAMA","BHUTAN","BOTSWANA","BIELORUSSIA","BELIZE","CANADA","ISOLE COCOS",    "REP. DEMOCRATICA CO","CENTRAFRICA","REPUBBLICA DEL CONGO","SVIZZERA","COSTA D'AVORIO","ARCIPELAGO DI COOK","CILE","CAMERUN","CINA","COLOMBIA","COSTA RICA","CUBA","CIPRO","ISOLE CHRISTMAS","CIPRO","REPUBBLICA CECA","GERMANIA","GIBUTI","DANIMARCA","DOMINICA","REPUBBLICA DOMINICA","ALGERIA","ECUADOR","ESTONIA","EGITTO","ERITREA","SPAGNA","ETIOPIA","FINLANDIA","ISOLE FIGI","ISOLE FALKLAND","ISOLE FAEROER","FRANCIA","GABON","GRAN BRETAGNA","GRENADA","GEORGIA","GUIANA FRANCESE","GHANA","GIBILTERRA","GROENLANDIA","GAMBIA","REPUBBLICA DI GUINE","GUADALUPA","GUINEA EQUATORIALE","GRECIA","GEORGIA","GUATEMALA","GUAM","GUINEA-BISSAU","GUIANA","HONG KONG","HONDURAS","CROAZIA","HAITI","UNGHERIA","INDONESIA","IRLANDA","ISRAELE","INDIA","IRAQ","IRAN","ISLANDA","ITALIA","GIAMAICA","GIORDANIA","GIAPPONE","KENYA","KIRGHIZISTAN","CAMBOGIA","KIRIBATI","COMORE","SAN CRISTOFORO","COREA DEL NORD","COREA DEL SUD","KUWAIT","CAYMAN","KAZAKISTAN","LAOS","LIBANO","SANTA LUCIA","LIECHTENSTEIN","SRI LANKA","LIBERIA","LESOTHO","LITUANIA","LUSSEMBURGO","LETTONIA","LIBIA","MAROCCO","MONTECARLO","MOLDAVIA","MADAGASCAR","ISOLE MARSHALL","MACEDONIA","MALI","MYANMAR","MONGOLIA","MACAO","ISOLE MARIANNE","MARTINICA","MAURITANIA","MONTSERRAT","MALTA","MAURIZIO","MALDIVE","MALAWI","MESSICO","MALAISIA","MOZAMBICO","NAMIBIA","NUOVA CALEDONIA","NIGER","ISOLA DI NORFOLK","NIGERIA","NICARAGUA","OLANDA","NORVEGIA","NEPAL","NAURU","NUOVA ZELANDA","OMAN","PANAMA","PERU'","POLINESIA FRANCESE","PAPUA-NUOVA GUINEA","FILIPPINE","PAKISTAN","POLONIA","SAINT-PIERRE","PITCAIRN","PORTORICO","PORTOGALLO","ISOLE PALAU","PARAGUAY","QATAR","REUNION","ROMANIA","RUSSIA","RUANDA","ARABIA SAUDITA","ISOLE SALOMONE","SEYCHELLES","SUDAN","SVEZIA","SINGAPORE","ASCENSION","SLOVENIA","REPUBBLICA SLOVACCA","SIERRA LEONE","SAN MARINO","SENEGAL","SOMALIA","SURINAME","SAO TOME' E PRINCIP","UNIONE SOVIETICA","SALVADOR","SIRIA","SWAZILAND","TURKS E CAICOS","CIAD","ANTARTIDE FRANCESE","TOGO","TAILANDIA","TAGISKISTAN","ISOLE TOKELAU","TURKMENISTAN","TUNISIA","TONGA","TIMOR ORIENTALE","TURCHIA","TRINIDAD E TOBAGO","TUVALU","TAIWAN","TANZANIA","UCRAINA","UGANDA","ISOLE MINORI (USA)","STATI UNITI D'AMERICA","URUGUAY","UZBEKISTAN","CITTA' DEL VATICANO","SAINT VINCENT E GRE","VENEZUELA","ISOLE VERGINI (GB)","ISOLE VERGINI (USA)","VIETNAM","VANUATU","WALLIS E FUTUNA","SAMOA OCCIDENTALI","KOSOVO","YEMEN","MAYOTTE","SERBIA E MONTENEGRO","SUD AFRICA","ZAMBIA","ZAIRE","ZIMBABWE"].sorted()
    
    
    @IBOutlet weak var cityPicker: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cityPicker.delegate = self
        cityPicker.dataSource = self
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
//        cityLbl.text = myPickerArray[row]
//        let params : [String : String] = ["q" : myPickerArray[row], "appid" : APP_ID]
//        getWeatherData(url: WEATHER_URL, parameters: params)
    }
    
    
    
    
    func getStateID(nomeCitta : String) -> String{
        switch nomeCitta {
        case "ANDORRA":
            return "ad"
        case "EMIRATI ARABI UNITI":
            return "ae"
        case "ANTIGUA/BARBUDA":
            return "ag"
        case "ANGUILLA":
            return "ai"
        case "ALBANIA":
            return "al"
        case "ARMENIA":
            return "am"
        case "ANTILLE OLANDESI":
            return "an"
        case "ANGOLA":
            return "ao"
        case "ARGENTINA":
            return "ar"
        case "SAMOA (USA)":
            return "as"
        case "AUSTRIA":
            return "at"
        case "AUSTRALIA":
            return "au"
        case "ARUBA":
            return "aw"
        case "AZERBAIGIAN":
            return "az"
        case "BOSNIA-ERZEGOVINA":
            return "ba"
        case "BARBADOS":
            return "bb"
        case "BANGLADESH":
            return "bd"
        case "BELGIO":
            return "be"
        case "BURKINA FASO":
            return "bf"
        case "BULGARIA":
            return "bg"
        case "BAHREIN":
            return "bh"
        case "BURUNDI":
            return "bi"
        case "BENIN":
            return "bj"
        case "BERMUDE":
            return "bm"
        case "BRUNEI":
            return "bn"
        case "BOLIVIA":
            return "bo"
        case "RASILE":
            return "br"
        case "BAHAMA":
            return "bs"
        case "BHUTAN":
            return "bt"
        case "BOTSWANA":
            return "bw"
        case "BIELORUSSIA":
            return "by"
        case "BELIZE":
            return "bz"
        case "CANADA":
            return "ca"
        case "ISOLE COCOS":
            return "cc"
        case "REP. DEMOCRATICA CO":
            return "cd"
        case "CENTRAFRICA":
            return "cf"
        case "REPUBBLICA DEL CONGO":
            return "cg"
        case "SVIZZERA":
            return "ch"
        case "COSTA D'AVORIO":
            return "ci"
        case "ARCIPELAGO DI COOK":
            return "ck"
        case "CILE":
            return "cl"
        case "CAMERUN":
            return "cm"
        case "CINA":
            return "cn"
        case "COLOMBIA":
            return "co"
        case "COSTA RICA":
            return "cr"
        case "CUBA":
            return "cu"
        case "CIPRO":
            return "cy"
        case "ISOLE CHRISTMAS":
            return "cx"
        case "REPUBBLICA CECA":
            return "cz"
        case "GERMANIA":
            return "de"
        case "GIBUTI":
            return "dj"
        case "DANIMARCA":
            return "dk"
        case "DOMINICA":
            return "dm"
        case "REPUBBLICA DOMINICA":
            return "do"
        case "ALGERIA":
            return "dz"
        case "ECUADOR":
            return "ec"
        case "ESTONIA":
            return "ee"
        case "EGITTO":
            return "eg"
        case "ERITREA":
            return "er"
        case "SPAGNA":
            return "es"
        case "ETIOPIA":
            return "et"
        case "FINLANDIA":
            return "fi"
        case "ISOLE FIGI":
            return "fj"
        case "ISOLE FALKLAND":
            return "fk"
        case "ISOLE FAEROER":
            return "fo"
        case "FRANCIA":
            return "fr"
        case "GABON":
            return "ga"
        case "GRAN BRETAGNA":
            return "gb"
        case "GRENADA":
            return "gd"
        case "GEORGIA":
            return "ge"
        case "GUIANA FRANCESE":
            return "gf"
        case "GHANA":
            return "gh"
        case "GIBILTERRA":
            return "gi"
        case "GROENLANDIA":
            return "gl"
        case "GAMBIA":
            return "gm"
        case "REPUBBLICA DI GUINE":
            return "gn"
        case "GUADALUPA":
            return "gp"
        case "GUINEA EQUATORIALE":
            return "gq"
        case "GRECIA":
            return "gr"
        case "GEORGIA DEL SUD":
            return "gs"
        case "GUATEMALA":
            return "gt"
        case "GUAM":
            return "gu"
        case "GUINEA-BISSAU":
            return "gw"
        case "GUIANA":
            return "gy"
        case "HONG KONG":
            return "hk"
        case "HONDURAS":
            return "hn"
        case "CROAZIA":
            return "hr"
        case "HAITI":
            return "ht"
        case "UNGHERIA":
            return "hu"
        case "INDONESIA":
            return "id"
        case "IRLANDA":
            return "ie"
        case "ISRAELE":
            return "il"
        case "INDIA":
            return "in"
        case "IRAQ":
            return "iq"
        case "IRAN":
            return "ir"
        case "ISLANDA":
            return "is"
        case "ITALIA":
            return "it"
        case "GIAMAICA":
            return "jm"
        case "GIORDANIA":
            return "jo"
        case "GIAPPONE":
            return "jp"
        case "KENYA":
            return "ke"
        case "KIRGHIZISTAN":
            return "kg"
        case "CAMBOGIA":
            return "kh"
        case "KIRIBATI":
            return "ki"
        case "COMORE":
            return "km"
        case "SAN CRISTOFORO":
            return "kn"
        case "COREA DEL NORD":
            return "kp"
        case "COREA DEL SUD":
            return "kr"
        case "KUWAIT":
            return "kw"
        case "CAYMAN":
            return "ky"
        case "KAZAKISTAN":
            return "kz"
        case "LAOS":
            return "la"
        case "LIBANO":
            return "lb"
        case "SANTA LUCIA":
            return "lc"
        case "LIECHTENSTEIN":
            return "li"
        case "SRI LANKA":
            return "lk"
        case "LIBERIA":
            return "lr"
        case "LESOTHO":
            return "ls"
        case "LITUANIA":
            return "lt"
        case "LUSSEMBURGO":
            return "lu"
        case "LETTONIA":
            return "lv"
        case "LIBIA":
            return "ly"
        case "MAROCCO":
            return "ma"
        case "MONTECARLO":
            return "mc"
        case "MOLDAVIA":
            return "md"
        case "MADAGASCAR":
            return "mg"
        case "ISOLE MARSHALL":
            return "mh"
        case "MACEDONIA":
            return "mk"
        case "MALI":
            return "ml"
        case "MYANMAR":
            return "mm"
        case "MONGOLIA":
            return "mn"
        case "MACAO":
            return "mo"
        case "ISOLE MARIANNE":
            return "mp"
        case "MARTINICA":
            return "mq"
        case "MAURITANIA":
            return "mr"
        case "MONTSERRAT":
            return "ms"
        case "MALTA":
            return "mt"
        case "MAURIZIO":
            return "mu"
        case "MALDIVE":
            return "mv"
        case "MALAWI":
            return "mw"
        case "MESSICO":
            return "mx"
        case "MALAISIA":
            return "my"
        case "MOZAMBICO":
            return "mz"
        case "NAMIBIA":
            return "na"
        case "NUOVA CALEDONIA":
            return "nc"
        case "NIGER":
            return "ne"
        case "ISOLA DI NORFOLK":
            return "nf"
        case "NIGERIA":
            return "ng"
        case "NICARAGUA":
            return "ni"
        case "OLANDA":
            return "nl"
        case "NORVEGIA":
            return "no"
        case "NEPAL":
            return "np"
        case "NAURU":
            return "nr"
        case "NUOVA ZELANDA":
            return "nz"
        case "OMAN":
            return "om"
        case "PANAMA":
            return "pa"
        case "PERU'":
            return "pe"
        case "POLINESIA FRANCESE":
            return "pf"
        case "PAPUA-NUOVA GUINEA":
            return "pg"
        case "FILIPPINE":
            return "ph"
        case "PAKISTAN":
            return "pk"
        case "POLONIA":
            return "pl"
        case "SAINT-PIERRE ET MIQ":
            return "pm"
        case "PITCAIRN":
            return "pn"
        case "PORTORICO":
            return "pr"
        case "PORTOGALLO":
            return "pt"
        case "ISOLE PALAU":
            return "pw"
        case "PARAGUAY":
            return "py"
        case "QATAR":
            return "qa"
        case "REUNION":
            return "re"
        case "ROMANIA":
            return "ro"
        case "RUSSIA":
            return "ru"
        case "RUANDA":
            return "rw"
        case "ARABIA SAUDITA":
            return "sa"
        case "ISOLE SALOMONE":
            return "sb"
        case "SEYCHELLES":
            return "sc"
        case "SUDAN":
            return "sd"
        case "SVEZIA":
            return "se"
        case "SINGAPORE":
            return "sg"
        case "ASCENSION":
            return "sh"
        case "SLOVENIA":
            return "si"
        case "REPUBBLICA SLOVACCA":
            return "sk"
        case "SIERRA LEONE":
            return "sl"
        case "SAN MARINO":
            return "sm"
        case "SENEGAL":
            return "sn"
        case "SOMALIA":
            return "so"
        case "SURINAME":
            return "sr"
        case "SAO TOME' E PRINCIP":
            return "st"
        case "UNIONE SOVIETICA":
            return "su"
        case "SALVADOR":
            return "sv"
        case "SIRIA":
            return "sy"
        case "SWAZILAND":
            return "sz"
        case "TURKS E CAICOS":
            return "tc"
        case "CIAD":
            return "td"
        case "ANTARTIDE FRANCESE":
            return "tf"
        case "TOGO":
            return "tg"
        case "TAILANDIA":
            return "th"
        case "TAGISKISTAN":
            return "tj"
        case "ISOLE TOKELAU":
            return "tk"
        case "TURKMENISTAN":
            return "tm"
        case "TUNISIA":
            return "tn"
        case "TONGA":
            return "to"
        case "TIMOR ORIENTALE":
            return "tp"
        case "TURCHIA":
            return "tr"
        case "TRINIDAD E TOBAGO":
            return "tt"
        case "TUVALU":
            return "tv"
        case "TAIWAN":
            return "tw"
        case "TANZANIA":
            return "tz"
        case "UCRAINA":
            return "ua"
        case "UGANDA":
            return "ug"
        case "ISOLE MINORI (USA)":
            return "um"
        case "STATI UNITI D'AMERICA":
            return "us"
        case "URUGUAY":
            return "uy"
        case "UZBEKISTAN":
            return "uz"
        case "CITTA' DEL VATICANO":
            return "va"
        case "SAINT VINCENT E GRE":
            return "vc"
        case "VENEZUELA":
            return "ve"
        case "ISOLE VERGINI (GB)":
            return "vg"
        case "ISOLE VERGINI (USA)":
            return "vi"
        case "VIETNAM":
            return "vn"
        case "VANUATU":
            return "vu"
        case "WALLIS E FUTUNA":
            return "wf"
        case "SAMOA OCCIDENTALI":
            return "ws"
        case "KOSOVO":
            return "xz"
        case "YEMEN":
            return "ye"
        case "MAYOTTE":
            return "yt"
        case "SERBIA E MONTENEGRO":
            return "yu"
        case "SUD AFRICA":
            return "za"
        case "ZAMBIA":
            return "zm"
        case "ZAIRE":
            return "zr"
        case "ZIMBABWE":
            return "zw"

        default:
            return
                "unknow"
        }
    }
    
}


