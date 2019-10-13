source("mapShift.R")

ap_name_recode <- function(ap_col) {
  recode(
    ap_col,
    "Alabat" = "Alabat",
    "Allah Valley" = "Allah Valley",
    "Antique" = "Antique",
    "Awang" = "Awang",
    "Bacolod" = "Bacolod",
    "Bagabag" = "Bagabag",
    "Baganga" = "Baganga",
    "Baguio" = "Baguio",
    "Baler" = "Baler",
    "Bantayan" = "Bantayan",
    "Barobo" = "Barobo",
    "Basco" = "Basco",
    "Biliran" = "Biliran",
    "Bislig" = "Bislig",
    "Borongan" = "Borongan",
    "Bulan" = "Bulan",
    "Busuanga" = "Busuanga",
    "Butuan" = "Butuan",
    "Cagayan de Oro" = "Cagayan de Oro",
    "Cagayan De Oro Domestic Airport" = "Cagayan de Oro",
    "Cagayan de Sulu" = "Cagayan de Sulu",
    "Cagayan De Sulu" = "Cagayan de Sulu",
    "Cagayan de Tawi-Tawi" = "Cagayan de Tawi-Tawi",
    "Calapan" = "Calapan",
    "Calbayog" = "Calbayog",
    "Camiguin" = "Camiguin",
    "Catarman" = "Catarman",
    "Catbalogan" = "Catbalogan",
    "Caticlan" = "Caticlan",
    "Cauayan" = "Cauayan",
    "Clark" = "Clark",
    "Clr Airport" = "Clark",
    "Coron Airport" = "Coron Airport",
    "Cotabato" = "Cotabato",
    "Cubi Point Naval Air Station" = "Cubi Point Naval Air Station",
    "Culion" = "Culion",
    "Cuyo" = "Cuyo",
    "Daet" = "Daet",
    "Daniel Z. Romualdez" = "Daniel Z. Romualdez",
    "Davao (Dom.) " = "Davao",
    "Davao (Domestic" = "Davao",
    "Davao (Domestic)" = "Davao",
    "Davao (International)" = "Davao",
    "Davao (International) " = "Davao",
    "Davao (Intternational)" = "Davao",
    "Diosdado Macapagal International (Clark Int)" = "Clark",
    "Diosdado Macapagal International Airport" = "Clark",
    "Diosdado Macpagal International Airport" = "Clark",
    "Dipolog" = "Dipolog",
    "Dumaguete" = "Dumaguete",
    "El Nido" = "El Nido",
    "Evelio Javier" = "Evelio Javier",
    "Fernando Air Base" = "Fernando Air Base",
    "Floridablanca Ab" = "Floridablanca Ab",
    "Fort Magsaysay" = "Fort Magsaysay",
    "Francisco Bangoy International" = "Davao",
    "Gen Santos" = "General Santos",
    "General Santos Buauyan" = "General Santos",
    "General Santos International" = "General Santos",
    "General Santos Tambler" = "General Santos",
    "General Snatos Tambler" = "General Santos",
    "Guiuan" = "Guiuan",
    "Hilongos" = "Hilongos",
    "Iba" = "Iba",
    "Iligan" = "Iligan",
    "Iloilo" = "Iloilo",
    "Iloilo (International)" = "Iloilo",
    "Iloilo International" = "Iloilo",
    "Imelda Romualdez Marcos" = "Imelda Romualdez Marcos",
    "Ipil" = "Ipil",
    "Itbayat" = "Itbayat",
    "Jolo" = "Jolo",
    "Jomalig" = "Jomalig",
    "Kalibo" = "Kalibo",
    "Kalibo " = "Kalibo",
    "Kalibo (Domestic)" = "Kalibo",
    "Kalibo (International)" = "Kalibo",
    "Labo" = "Labo",
    "Laguindingan" = "Laguindingan",
    "Laoag(Domestic)" = "Laoag",
    "Laoag(International)" = "Laoag",
    "Laoag (Domestic)" = "Laoag",
    "Laoag (International)" = "Laoag",
    "Laoag International Airport" = "Laoag",
    "Legaspi" = "Legaspi",
    "Legazpi" = "Legaspi",
    "Liloy" = "Liloy",
    "Lingayen" = "Lingayen",
    "Loakan" = "Loakan",
    "Lubang" = "Lubang",
    "Lucena" = "Lucena",
    "Maasin" = "Maasin",
    "Mactan" = "Mactan-Cebu",
    "Mactan-Cebu International" = "Mactan-Cebu",
    "Mactan (Domestic)" = "Mactan-Cebu",
    "Mactan (International)" = "Mactan-Cebu",
    "Mactan/G. Aviation" = "Mactan/G. Aviation",
    "Malabang" = "Malabang",
    "Malay" = "Malay",
    "Malaybalay" = "Malaybalay",
    "Malita" = "Malita",
    "Mambajao" = "Mambajao",
    "Mamburao" = "Mamburao",
    "Maramag" = "Maramag",
    "Maria Cristina" = "Maria Cristina",
    "Marinduque" = "Marinduque",
    "Masbate" = "Masbate",
    "Mati" = "Mati",
    "Mcguire Fld" = "Mcguire Fld",
    "Mrmp" = "Mrmp",
    "Naga" = "Naga",
    "NAIA" = "Ninoy Aquino International Airport",
    "National" = "National",
    "Ninoy Aquino Intl Airport" = "Ninoy Aquino International Airport",
    "Nonoc" = "Nonoc",
    "Ormoc" = "Ormoc",
    "Ozamis" = "Ozamis",
    "Pagadian" = "Pagadian",
    "Palanan" = "Palanan",
    "Pasar" = "Pasar",
    "Pinamalayan" = "Pinamalayan",
    "Plaridel" = "Plaridel",
    "Puerto Princesa" = "Puerto Princesa",
    "Puerto Princesa " = "Puerto Princesa",
    "Puerto Princesa (Domestic)" = "Puerto Princesa",
    "Puerto Princesa (International)" = "Puerto Princesa",
    "Puerto Princesa International" = "Puerto Princesa",
    "Puerto Princesa Intl" = "Puerto Princesa",
    "Puerto Princessa" = "Puerto Princesa",
    "Pueurto Princesa " = "Puerto Princesa",
    "Romblon" = "Romblon",
    "Rosales" = "Rosales",
    "Roxas" = "Roxas",
    "Roxas City" = "Roxas City",
    "San Fernando" = "San Fernando",
    "San Jose" = "San Jose",
    "Sanga-Sanga" = "Sanga-Sanga",
    "Sangley Naval Stn" = "Sangley",
    "Sangley Point Nas" = "Sangley",
    "Siargao" = "Siargao",
    "Siasi" = "Siasi",
    "Sicogon Island" = "Sicogon Island",
    "Siocon" = "Siocon",
    "Siquijor" = "Siquijor",
    "Sorsogon" = "Sorsogon",
    "Subic" = "Subic",
    "Subic Bay Intl" = "Subic",
    "Surigao" = "Surigao",
    "Tablas Island" = "Tablas Island",
    "Tacloban" = "Tacloban",
    "Tagbilaran" = "Tagbilaran",
    "Tagbita" = "Tagbita",
    "Tandag" = "Tandag",
    "Tawitawi" = "Tawitawi",
    "Total" = "Total",
    "Tuguegarao" = "Tuguegarao",
    "Tuguegarao (Dom.)" = "Tuguegarao",
    "Tuguegarao (Domestic)" = "Tuguegarao",
    "Tuguegarao (Int'l.)" = "Tuguegarao",
    "Tuguegarao (International)" = "Tuguegarao",
    "Ubay" = "Ubay",
    "Vigan" = "Vigan",
    "Virac" = "Virac",
    "Wasig" = "Wasig",
    "Zamboanga" = "Zamboanga",
    "Zamboanga International" = "Zamboanga"
  )
}

coord2dec <- function(coord) {
  dec <- coord %>%
    str_replace_all(" ", "") %>%
    str_replace("°", "d") %>%
    char2dms() %>%
    as.numeric()
  return(dec)
}

fct_relevel_month <- function(vec) {
  return(fct_relevel(
    vec,
    c(
      "january",
      "february",
      "march",
      "april",
      "may",
      "june",
      "july",
      "august",
      "september",
      "october",
      "november",
      "december"
    )
  ))
}

mnth2num <- function(mnth) {
  recode(
    mnth,
    `january` = "01",
    `february` = "02",
    `march` = "03",
    `april` = "04",
    `may` = "05",
    `june` = "06",
    `july` = "07",
    `august` = "08",
    `september` = "09",
    `october` = "10",
    `november` = "11",
    `december` = "12"
  )
}

shift
remap_long <- function(long) {
  long_shift <- long + shift
  if (long_shift > 180) {
    return(long_shift - 360)
  }
  else{
    return(long_shift)
  }
}

regions <- c(
  "NCR (National Capital Region)",
  "CAR (Cordillera Administrative Region)",
  "Region I(ILOCOS REGION)",
  "Region II(CAGAYAN VALLEY)",
  "Region III(CENTRAL LUZON)",
  "Region IV-ACALABARZON",
  "Region IV-B MIMAROPA",
  "Region V(BICOL REGION)",
  "Region VI(WESTERN VISAYAS)",
  "Region VII (CENTRAL VISAYAS)",
  "Region VIII (EASTERN VISAYAS)",
  "Region X (NORTHERN MINDANAO)",
  "Region XII(SOCCSSARGEN)",
  "Region XIII (CARAGA)",
  "GRAND TOTAL"
)

regions_id <- c("NCR", "CAR", "Region", "GRAND TOTAL")

region_recode <- function(reg) {
  recode(
    reg,
    `Region I(ILOCOS REGION)` = "Region I (ILOCOS REGION)",
    `Region 0 (CAGAYAN VALLEY)` = "Region II (CAGAYAN VALLEY)",
    `Region II(CAGAYAN VALLEY)` = "Region II (CAGAYAN VALLEY)",
    `Region III(CENTRAL LUZON)` = "Region III (CENTRAL LUZON)",
    `Region IV-ACALABARZON` = "Region IV-A (CALABARZON)",
    `Region IV-A CALABARZON` = "Region IV-A (CALABARZON)",
    `Region IV-B MIMAROPA` = "Region IV-B (MIMAROPA)",
    `Region IX (ZAMBOANGA PENINS` = "Region IX (ZAMBOANGA PENINSULA)",
    `Region V(BICOL REGION)` = "Region V (BICOL REGION)",
    `Region VI(WESTERN VISAYAS)` = "Region VI (WESTERN VISAYAS)",
    `Region X (NORTHERN MINDANAO` = "Region X (NORTHERN MINDANAO)",
    `Region XI(DAVAO REGION)` = "Region XI (DAVAO REGION)",
    `Region XII(SOCCSSARGEN)` = "Region XII (SOCCSSARGEN)",
    `Autonomous Region of Muslim Mindanao (ARMM)` = "ARMM (AUTONOMOUS REGION OF MUSLIM MINDANAO)",
    `Bicol Region (Region V)` = "Region V (BICOL REGION)",
    `Cagayan Valley (Region II)` = "Region II (CAGAYAN VALLEY)",
    `CALABARZON (Region IV-A)` = "Region IV-A (CALABARZON)",
    `Caraga (Region XIII)` = "Region XIII (CARAGA)",
    `Central Luzon (Region III)` = "Region III (CENTRAL LUZON)",
    `Central Visayas (Region VII)` = "Region VII (CENTRAL VISAYAS)",
    `Cordillera Administrative Region (CAR)` = "CAR (Cordillera Administrative Region)",
    `Davao Region (Region XI)` = "Region XI (DAVAO REGION)",
    `Eastern Visayas (Region VIII)` = "Region VIII (EASTERN VISAYAS)",
    `Ilocos Region (Region I)` = "Region I (ILOCOS REGION)",
    `Metropolitan Manila` = "NCR (National Capital Region)",
    `MIMAROPA (Region IV-B)` = "Region IV-B (MIMAROPA)",
    `Northern Mindanao (Region X)` = "Region X (NORTHERN MINDANAO)",
    `SOCCSKSARGEN (Region XII)` = "Region XII (SOCCSSARGEN)",
    `Western Visayas (Region VI)` = "Region VI (WESTERN VISAYAS)",
    `Zamboanga Peninsula (Region IX))` = "Region IX (ZAMBOANGA PENINSULA)"
  )
}

municity_recode <- function(mc) {
  recode(
    mc,
    `lfugao` = "Ifugao",
    `Iloilo Province` = "Iloilo",
    `Sorsogon Province` = "Sorsogon",
    `Masbate Province` = "Masbate",
    `Kalookan City` = "Caloocan City",
    `Las Piï¿½as` = "Las Piñas City",
    `Malabon` = "Malabon City",
    `Mandaluyong` = "Mandaluyong City",
    `Marikina` = "Marikina City",
    `Muntinlupa` = "Muntinlupa City",
    `Navotas` = "Navotas City",
    `Pasay` = "Pasay City",
    `Paraï¿½aque` = "Parañaque City",
    `San Juan` = "San Juan City",
    `Taguig` = "Taguig City",
    `Valenzuela` = "Valenzuela City",
    `Batac City` = "Batac",
    `Bayugan City` = "Bayugan",
    `Boracay` = "Malay",
    `Anini-Y` = "Anini-y",
    `Laua-An` = "Laua-an",
    `Patnogon` = "Patnongnon",
    `San Remigio` = "San Remegio",
    `Lips City` = "Lipa City",
    `Mataas Na Kahoy` = "Mataas na Kahoy",
    `Tanauan City` = "Tanauan",
    `Tagbilaran City` = "Tagbilaran",
    `lvisan` = "Ivisan",
    `Ivisan` = "Ivisan",
    `Maayon` = "Maayon",
    `Ma-Ayon` = "Maayon"
    # # Capiz
    # `President Roxas` = "Pres. Roxas",
    # # Capiz
    # `Sapi-An` = "Sapian",
    # # Capiz
    # `General Trias` = "Gen. Trias",
    # # Cavite
    # `Trece Martires City` = "Trece Martires City",
    # # Cavite
    # `Trece Martirez` = "Trece Martires City",
    # # Cavite
    # `Aloquinsan` = "Aloguinsan",
    # # Cebu
    # `Amlan` = "Amlan",
    # # Cebu
    # `Cordoba` = "Cordova",
    # # Cebu
    # `Ginatllan` = "Ginatilan",
    # # Cebu
    # `Slbonga` = "Sibonga",
    # # Cebu
    # `Talisay` = "Talisay City",
    # # Cebu
    # `Samal City` = "Island Garden City of Samal",
    # # Davao del Norte
    # `General Macarthur` = "Gen. McArthur",
    # # Eastern Samar
    # `Guivan` = "Guiuan",
    # # Eastern Samar
    # `Sarat` = "Sarrat",
    # # Ilocos Norte
    # `Caries` = "Carles",
    # # Iloilo
    # `Januiay` = "Janiuay",
    # # Iloilo
    # `Milagao` = "Miagao",
    # # Iloilo
    # `Passi` = "Passi City",
    # # Iloilo
    # `Sta. Barbara` = "Santa Barbara",
    # # Iloilo
    # `Ilagan` = "Ilagan City",
    # # Isabela
    # `Baloaon` = "Balaoan",
    # # La Union
    # `Sto. Tomas` = "Santo Tomas",
    # #La Union
    # `Los 85005` = "Los Baños",
    # # Laguna
    # `Los Bañ0s` = "Los Baños",
    # # Laguna
    # `Los Baï¿½os` = "Los Baños",
    # `Alburera` = "Albuera",
    # # Leyte
    # `Bago` = "Bato",
    # # Leyte
    # `Kanangga` = "Kananga",
    # # Leyte
    # `Matatom` = "Matatom",
    # # Leyte
    # `McArthur` = "Matalom",
    # # Leyte
    # `Sta. Cruz` = "Santa Cruz",
    # # Marinduque
    # `Las Pinas City` = "Las Piñas City",
    # # Metropolitan Manila
    # `Paranaque City` = "Parañaque City",
    # # Metropolitan Manila
    # `Pasay City` = "Pasay City",
    # # Metropolitan Manila
    # `Cagayan de Om City` = "Cagayan de Oro City",
    # # Misamis Oriental
    # `Iligan City` = "Iligan City",
    # # Misamis Oriental
    # `lligan City` = "lligan City",
    # # Misamis Oriental
    # `Baguio City` = "Baguio City",
    # # Mountain Province
    # `Bangui` = "Bangui",
    # # Mountain Province
    # `Batac` = "Batac",
    # # Mountain Province
    # `Currimao` = "Currimao",
    # # Mountain Province
    # `Laoag City` = "Laoag City",
    # # Mountain Province
    # `Pagudpud` = "Pagudpud",
    # # Mountain Province
    # `Panay` = "Panay",
    # # Mountain Province
    # `Pasuquin` = "Pasuquin",
    # # Mountain Province
    # `Rocas Norte` = "Rocas Norte",
    # # Mountain Province
    # `San Nicolas` = "San Nicolas",
    # # Mountain Province
    # `Bago` = "Bago",
    # # Negros Occidental
    # `Cadiz` = "Cadiz",
    # # Negros Occidental
    # `DS Benedicto` = "DS Benedicto",
    # # Negros Occidental
    # `Escalante` = "Escalante",
    # # Negros Occidental
    # `Hinobaan` = "Hinobaan",
    # # Negros Occidental
    # `Iloilo City` = "Iloilo City",
    # # Negros Occidental
    # `Kabankalan` = "Kabankalan",
    # # Negros Occidental
    # `La Carlota` = "La Carlota",
    # # Negros Occidental
    # `Las Castellana` = "Las Castellana",
    # # Negros Occidental
    # `Mambukal` = "Mambukal",
    # # Negros Occidental
    # `Moises` = "Moises",
    # # Negros Occidental
    # `Sagay` = "Sagay",
    # # Negros Occidental
    # `San Carlos` = "San Carlos",
    # # Negros Occidental
    # `Silay` = "Silay",
    # # Negros Occidental
    # `Sipalay` = "Sipalay",
    # # Negros Occidental
    # `Talisay` = "Talisay",
    # # Negros Occidental
    # `Victorias` = "Victorias",
    # # Negros Occidental
    # `Bais` = "Bais",
    # # Negros Oriental
    # `Bayawan` = "Bayawan",
    # # Negros Oriental
    # `Canlaon` = "Canlaon",
    # # Negros Oriental
    # `Dumaguete` = "Dumaguete",
    # # Negros Oriental
    # `Guijulngan` = "Guijulngan",
    # # Negros Oriental
    # `Jimalaud` = "Jimalaud",
    # # Negros Oriental
    # `Tanjay` = "Tanjay",
    # # Negros Oriental
    # `Others (Cotabato Province)` = "Others (Cotabato Province)",
    # # North Cotabato
    # `Caput` = "Caput",
    # # Northern Samar
    # `Catarrnan` = "Catarrnan",
    # # Northern Samar
    # `Navar` = "Navar",
    # # Northern Samar
    # `Abrade Hog` = "Abrade Hog",
    # # Occidental Mindoro
    # `Abadan` = "Abadan",
    # # Palawan
    # `Brookes Point` = "Brookes Point",
    # # Palawan
    # `Callon` = "Callon",
    # # Palawan
    # `Espanola` = "Espanola",
    # # Palawan
    # `Clark` = "Clark",
    # # Pampanga
    # `Tarlac City` = "Tarlac City",
    # # Pampanga
    # `Alaminos` = "Alaminos",
    # # Pangasinan
    # `Bugallion` = "Bugallion",
    # # Pangasinan
    # `Alamat` = "Alamat",
    # # Quezon
    # `Angono` = "Angono",
    # # Quezon
    # `Antipolo City` = "Antipolo City",
    # # Quezon
    # `Baras` = "Baras",
    # # Quezon
    # `Binangonan` = "Binangonan",
    # # Quezon
    # `Cainta` = "Cainta",
    # # Quezon
    # `Cordona` = "Cordona",
    # # Quezon
    # `Gen Luna` = "Gen Luna",
    # # Quezon
    # `Gen. Nakar` = "Gen. Nakar",
    # # Quezon
    # `Jalajala` = "Jalajala",
    # # Quezon
    # `Macelolon` = "Macelolon",
    # # Quezon
    # `Morong` = "Morong",
    # # Quezon
    # `Pililia` = "Pililia",
    # # Quezon
    # `Rodriguez` = "Rodriguez",
    # # Quezon
    # `San Mateo` = "San Mateo",
    # # Quezon
    # `Tanay` = "Tanay",
    # # Quezon
    # `Tayabas` = "Tayabas",
    # # Quezon
    # `Taytay` = "Taytay",
    # # Quezon
    # `Teresa` = "Teresa",
    # # Quezon
    # `Cordona` = "Cordona",
    # # Rizal
    # `Jalajala` = "Jalajala",
    # # Rizal
    # `Pililia` = "Pililia",
    # # Rizal
    # `Roxas` = "Roxas",
    # # Rizal
    # `Sablayan` = "Sablayan",
    # # Rizal
    # `San Jose` = "San Jose",
    # # Rizal
    # `San Pablo` = "San Pablo",
    # # Rizal
    # `San Vicente` = "San Vicente",
    # # Rizal
    # `Santa Cruz` = "Santa Cruz",
    # # Rizal
    # `Sta. Rosa City` = "Sta. Rosa City",
    # # Rizal
    # `Taytay` = "Taytay",
    # # Rizal
    # `Victoria` = "Victoria",
    # # Rizal
    # `Puerto Princesa City` = "Puerto Princesa City",
    # # Romblon
    # `Puerto Princess City` = "Puerto Princess City",
    # # Romblon
    # `Bossy` = "Bossy",
    # # Samar
    # `Catbalogan` = "Catbalogan",
    # # Samar
    # `Cebu City` = "Cebu City",
    # #Siquijor
    # `E. Villanueva` = "E. Villanueva",
    # #Siquijor
    # `Lapu-lapu City` = "Lapu-lapu City",
    # # Siquijor
    # `Mandaue City` = "Mandaue City",
    # # Siquijor
    # `Others (Southern Leyte)` = "Others (Southern Leyte)",
    # # Southern Leyte
    # `Tacloban City` = "Tacloban City",
    # # Southern Leyte
    # `Cotabato City` = "Cotabato City",
    # # Sultan Kudarat
    # `Cotabato Province` = "Cotabato Province",
    # # Sultan Kudarat
    # `General Santos City` = "General Santos City",
    # # Sultan Kudarat
    # `Siargao Islands` = "Siargao Islands",
    # # Surigao del Norte
    # `Butuan City` = "Butuan City",
    # # Surigao del Sur
    # `Angeles City` = "Angeles City",
    # # Zambales
    # `SBMA` = "SBMA",
    # # Zambales
    # `Dapitan City` = "Dapitan City",
    # # Zamboanga del Norte
    # `Dipolog City` = "Dipolog City",
    # # Zamboanga del Norte
    # `Pagadian City` = "Pagadian City",
    # # Zamboanga del Sur
    # `Bukldnon` = "Bukldnon",
    # # Zamboanga Sibugay
    # `Isabela City` = "Isabela City",
    # # Zamboanga Sibugay
    # `Malaybalay City` = "Malaybalay City",
    # # Zamboanga Sibugay
    # `Valencia City` = "Valencia City",
    # # Zamboanga Sibugay
    # `Zamboanga City` = "Zamboanga City"# Zamboanga Sibugay
  )
}
