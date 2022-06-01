*** Settings ***
# Yleiset asetukset, kirjastot ja muuttujat kaikille testeille
Resource         init.robot

# Tuodaan avainsanat keywords robotista ja elementtien xpath view robotista
Resource    ostomyynti_keywords.robot
Resource    ostomyynti_view.robot

*** Keyword ***
# Avainsanat joita kutsutaan testitapauksissa
# Avainsanat jotka sisältävät monia toiminnallisuuksia kuuluvat tänne

Avaa Selain Sivulle
    [Arguments]     ${linkki}    ${selain}
    Log    Avataan selain sivulle    console=True
    # Asetetaan testin suoritusnopeus ja avainsanojen odotusaika
    Set Selenium Speed           ${SELENIUM_SPEED}
    Set Selenium Timeout         ${SELENIUM_TIMEOUT}

    Open Browser    ${linkki}    ${selain}
    Maximize Browser Window

Kirjaudu Sisaan
    [Arguments]    ${kayttaja}    ${salasana}    ${tarkista}=False
    Log   Kirjaudutaan sisään    console=True
    Syota Teksti   ${kayttajakentta_xp}    ${kayttaja}
    Syota Teksti   ${salasanakentta_xp}    ${salasana}    True

    Klikkaa Elementtia           ${kirjaudunappi_xp}
    Tarkista Elementti Status    ${sisaanvarmista_xp}    Kirjautuminen epäonnistui

    Log    Kirjautuminen onnistui    console=True

Kirjaudu Ulos
    Log   Kirjaudutaan ulos      console=True

    Klikkaa Elementtia           ${uloskirjaudu_xp}
    Tarkista Elementti Status    ${ulosvarmista_xp}    Uloskirjautuminen epäonnistui

    Log    Uloskirjautuminen onnistui    console=True

Tee Ilmoitus
    [Arguments]    ${ilmoitusnimi}    ${ilmoituskuvaus}
    Klikkaa Elementtia    ${lisaailmoitus_xp}
    Syota Teksti          ${ilmoitusnimi_xp}      ${ilmoitusnimi}
    Syota Teksti          ${ilmoituskuvaus_xp}    ${ilmoituskuvaus}
    Klikkaa Elementtia    ${lahetailmoitus_xp}
    Tarkista Ilmoitus     ${ilmoitusnimi}         ${ilmoituskuvaus}