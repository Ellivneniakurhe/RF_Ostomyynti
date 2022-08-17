*** Settings ***
Metadata         Tekijä    Ville Ehrukainen

# Yleiset asetukset, kirjastot ja muuttujat kaikille testeille
Resource         init.robot

# Tuodaan avainsanoja omasta tiedostosta
Resource         ostomyynti_test_steps.robot

# Suoritetaan tämä avainsana jokaisen testitapauksen jälkeen
Test Teardown     Close All Browsers
Suite Teardown    Close All Browsers

# Komennot testi suorittamiseen:
# robot -i SMOKE -d ./reports/00 ./ostomyynti.robot
# ^ Ajaa kaikki testit SMOKE tägillä ja sijoittaa testin lokit reports/00 kansioon...
# robot -i 01 -d ./reports/01 ./ostomyynti.robot
# ^ Ajaa kaikki testit 01 tägillä ja sijoittaa testin lokit reports/01 kansioon...
# Jos ET halua ylikirjoittaa vanhoja lokeja lisää reports kansion nimeen yksi luku

*** Variables ***
# Määritetään muuttujia
${LINKKI}       omasivu
${SELAIN}       Chrome
${KAYTTAJA}     omakäyttäjä
${SALASANA}     omasalasana

*** Test Cases ***

# Testitapaus
01. Kirjautumistesti
    [Documentation]    Sisään- ja uloskirjaudutaan, varmistetaan toimivuus
    # Tagien avulla voidaan ajaa testejä
    [Tags]    SMOKE    01

    # Testitapauksen avainsanat
    Avaa Selain Sivulle    ${LINKKI}      ${SELAIN}
    Kirjaudu Sisaan        ${KAYTTAJA}    ${SALASANA}
    Kirjaudu Ulos


# Testitapaus
02. Luo Ilmoitus
    [Documentation]    Luo ilmoituksen annetulla otsikolla ja kuvauksella
    # Tagien avulla voidaan ajaa testejä
    [Tags]    SMOKE    02

    # Testitapauksen avainsanat
    Avaa Selain Sivulle    ${LINKKI}      ${SELAIN}
    Kirjaudu Sisaan        ${KAYTTAJA}    ${SALASANA}
    Tee Ilmoitus           Testiotsikko    Testikuvaus
    Kirjaudu Ulos


03. Poista Ilmoitus
    [Documentation]    Poistaa luodun ilmoituksen
    [Tags]    03
    # Tee oma testisi!
    # Saattaa olla vaikea riippuen sivuston rakenteesta, vaihtoehtoisesti
    # luo testitapaus joka etsii ilmoituksen tai muuttaa käyttäjän tietoja

