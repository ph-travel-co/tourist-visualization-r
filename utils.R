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
    "Cebu" = "Mactan-Cebu",
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
    "Mactan International" = "Mactan-Cebu",
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
    `CAR (Cordillera Administrative Region)` = "CAR (Cordillera Administrative Region)",
    `NCR (National Capital Region)` = "NCR (National Capital Region)",
    `Region I  (ILOCOS REGION)` = "Region I (ILOCOS REGION)",
    `Region I (ILOCOS REGION)` = "Region I (ILOCOS REGION)",
    `Region 0 (CAGAYAN VALLEY)` = "Region II (CAGAYAN VALLEY)",
    `Region II  (CAGAYAN VALLEY)` = "Region II (CAGAYAN VALLEY)",
    `Region II (CAGAYAN VALLEY)` = "Region II (CAGAYAN VALLEY)",
    `Region III  (CENTRAL LUZON)` = "Region III (CENTRAL LUZON)",
    `Region III (CENTRAL LUZON)` = "Region III (CENTRAL LUZON)",
    `Region IV-A CALABARZON` = "Region IV-A (CALABARZON)",
    `Region IV-A  CALABARZON` = "Region IV-A (CALABARZON)",
    `Region IV-A (CALABARZON)` = "Region IV-A (CALABARZON)",
    `Region IV-B (MIMAROPA)` = "Region IV-B (MIMAROPA)",
    `Region IV-B MIMAROPA` = "Region IV-B (MIMAROPA)",
    `Region IX (ZAMBOANGA PENINS` = "Region IX (ZAMBOANGA PENINSULA)",
    `Region IX (ZAMBOANGA PENINSULA)` = "Region IX (ZAMBOANGA PENINSULA)",
    `Region V  (BICOL REGION)` = "Region V (BICOL REGION)",
    `Region V (BICOL REGION)` = "Region V (BICOL REGION)",
    `Region VI  (WESTERN VISAYAS)` = "Region VI (WESTERN VISAYAS)",
    `Region VI (WESTERN VISAYAS)` = "Region VI (WESTERN VISAYAS)",
    `Region VII (CENTRAL VISAYAS)` = "Region VII (CENTRAL VISAYAS)",
    `Region VIII (EASTERN VISAYAS)` = "Region VIII (EASTERN VISAYAS)",
    `Region X (NORTHERN MINDANAO` = "Region X (NORTHERN MINDANAO)",
    `Region X (NORTHERN MINDANAO)` = "Region X (NORTHERN MINDANAO)",
    `Region XI  (DAVAO REGION)` = "Region XI (DAVAO REGION)",
    `Region XI (DAVAO REGION)` = "Region XI (DAVAO REGION)",
    `Region XII  (SOCCSSARGEN)` = "Region XII (SOCCSSARGEN)",
    `Region XII (SOCCSSARGEN)` = "Region XII (SOCCSSARGEN)",
    `Region XIII (CARAGA)` = "Region XIII (CARAGA)",
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
    `Zamboanga Peninsula (Region IX))` = "Region IX (ZAMBOANGA PENINSULA)",
    `Zamboanga Peninsula (Region IX)` = "Region IX (ZAMBOANGA PENINSULA)"
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
    `Patnogon` = "Patnongon",
    `San Remigio` = "San Remegio",
    `Lips City` = "Lipa City",
    `Mataas Na Kahoy` = "Mataas na Kahoy",
    `Tanauan City` = "Tanauan",
    `Tagbilaran City` = "Tagbilaran",
    `Bukldnon` = "Bukidnon",
    # Bohol
    `Getafe` = "Jetafe",
    # Capiz
    `lvisan` = "Ivisan",
    `Ivisan` = "Ivisan",
    `Maayon` = "Maayon",
    `Ma-Ayon` = "Maayon",
    `Bumanga` = "Banga",
    `Pres. Roxas` = "President Roxas",
    `Sapi-An` = "Sapian",
    # Cavite
    `Gen. Trias` = "General Trias",
    `Trece Martires City` = "Trece Martires City",
    `Trece Martirez` = "Trece Martires City",
    # Cebu
    `Aloquinsan` = "Aloguinsan",
    `Amlan` = "Amlan",
    `Cordoba` = "Cordova",
    `Ginatllan` = "Ginatilan",
    `Lapu-lapu City` = "Lapu-Lapu City",
    `Slbonga` = "Sibonga",
    `Talisay` = "Talisay City",
    # Cotabato Province
    `Others (Cotabato Province)` = "Others",
    # Davao del Norte
    `Samal City` = "Island Garden City of Samal",
    # Davao Occidental
    `Davao Occcidental` = "Davao Occidental",
    # Eastern Samar
    `General Macarthur` = "Gen. McArthur",
    `Guivan` = "Guiuan",
    # Ilocos Norte
    `Sarat` = "Sarrat",
    `Panay` = "Paoay",
    # Pangasinan
    `Alaminos` = "Alaminos City",
    `Bugallion` = "Bugallon",
    # Iloilo
    `Caries` = "Carles",
    `Januiay` = "Janiuay",
    `Milagao` = "Miagao",
    `Passi` = "Passi City",
    `Sta. Barbara` = "Santa Barbara",
    # Isabela
    `Ilagan` = "Ilagan City",
    `Baloaon` = "Balaoan",
    # Laguna
    `Sto. Tomas` = "Santo Tomas",
    `Los 85005` = "Los Baños",
    `Los Bañ0s` = "Los Baños",
    `Los Baï¿½os` = "Los Baños",
    # Lanao del Norte
    `lligan City` = "Iligan City",
    # Leyte
    `Alburera` = "Albuera",
    `Kanangga` = "Kananga",
    `Matatom` = "Matalom",
    `McArthur` = "Matalom",
    `Sta. Cruz` = "Santa Cruz",
    # Metropolitan Manila
    `Las Pinas City` = "Las Piñas City",
    # Metropolitan Manila
    `Paranaque City` = "Parañaque City",
    # Misamis Oriental
    `Cagayan de Om City` = "Cagayan de Oro City",
    # Misamis Oriental
    `Iligan City` = "Iligan City",
    `lligan City` = "lligan City",
    # Negros Occidental
    `Bago` = "Bago City",
    `Cadiz` = "Cadiz City",
    `DS Benedicto` = "Salvador Benedicto",
    `Escalante` = "Escalante City",
    `Hinoba-An` = "Hinobaan",
    `Kabankalan` = "Kabankalan City",
    `La Carlota` = "La Carlota City",
    `Las Castellana` = "La Castellana",
    `Mambukal` = "Murcia",
    `Moises` = "Moises Padilla",
    `Sagay` = "Sagay City",
    `San Carlos` = "San Carlos City",
    `Silay` = "Silay City",
    `Sipalay` = "Sipalay City",
    `Talisay` = "Talisay City",
    `Victorias` = "Victorias City",
    # Negros Oriental
    `Bais` = "Bais City",
    `Bayawan` = "Bayawan City",
    `Canlaon` = "Canlaon City",
    `Dumaguete` = "Dumaguete City",
    `Guijulngan` = "Guihulngan City",
    `Jimalaud` = "Jimalalud",
    `Tanjay` = "Tanjay City",
    # North Cotabato
    `Others (Cotabato Province)` = "Others (Cotabato Province)",
    `North Cotabato` = "Cotabato Province",
    `Cotabato` = "Cotabato Province",
    # Northern Samar
    `Caput` = "Capul",
    `Catarrnan` = "Catarman",
    `Navar` = "Naval",
    # Occidental Mindoro
    `Abrade Hog` = "Abra de Ilog",
    # Palawan
    `Abadan` = "Aborlan",
    `Brookes Point` = "Brooke's Point",
    `Callon` = "Culion",
    `Espanola` = "Sofronio Espanola",
    # Pampanga
    `Tarlac City` = "Tarlac City",
    # Pangasinan
    `Alaminos` = "Alaminos",
    `Bugallion` = "Bugallion",
    # Quezon
    `Alamat` = "Alabat",
    # Rizal
    `Angono` = "Angono",
    `Antipolo City` = "Antipolo City",
    `Baras` = "Baras",
    `Binangonan` = "Binangonan",
    `Cainta` = "Cainta",
    # Laguna
    `Los BaÃ±os` = "Los Baños",
    `Los Bañ0s` = "Los Baños",
    `San Pablo` = "San Pablo City",
    `Santa Rosa` = "Santa Rosa City",
    `Sta. Rosa City` = "Santa Rosa City",
    # Quezon
    `Gen Luna` = "General Luna",
    `Gen. Nakar` = "General Nakar",
    `Jalajala` = "Jalajala",
    `Macelolon` = "Macalelon",
    `Tayabas` = "Tayabas City",
    # Rizal
    `Cordona` = "Cardona",
    `Jala-Jala` = "Jalajala",
    `Pililia` = "Pililla",
    `Roxas` = "Roxas",
    # Palawan
    `Puerto Princesa City` = "Puerto Princesa City",
    `Puerto Princess City` = "Puerto Princess City",
    # Samar
    `Bossy` = "Basey",
    `Catbalogan` = "Catbalogan City",
    # Siquijor
    `E. Villanueva` = "Enrique Villanueva",
    # Southern Leyte
    `Others (Southern Leyte)` = "Others",
    # Surigao del Norte
    `Pilar` = "Siargao Islands", # Use the municipality of Pilar as the representation of Siargao Island
    # Bukidnon
    `Bukldnon` = "Bukldnon",
    # Zambales
    `SBMA` = "Subic"
  )
}

# Replace city names conflicting with province names
municity_dup_recode <- function() {
  
  return ()
}
