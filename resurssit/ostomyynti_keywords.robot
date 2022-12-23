*** Settings ***
Library    SeleniumLibrary

*** Keyword ***
# Avainsanat joita kutsutaan teststep tasolla
# Avainsanat jotka yleensä suorittavat yhtä toiminnallisuutta kuuluvat tänne

Syota Teksti
    # Avainsanan vastaanottaman muuttujat eli argumentit, salasana oletuksena False eli 
    # ei tarvitse välttämättä antaa kun oletus on määritetty
    [Arguments]    ${elementti_xp}      ${teksti}    ${salasana}=False
    Wait Until Page Contains Element    ${elementti_xp}
    IF    ${salasana}
        Input Password    ${elementti_xp}    ${teksti}
    ELSE
        Input Text        ${elementti_xp}    ${teksti} 
    END

Klikkaa Elementtia
    [Arguments]    ${elementti_xp}
    Wait Until Page Contains Element    ${elementti_xp}
    Click Element                       ${elementti_xp}

Tarkista Elementti Status
    [Arguments]    ${elementti_xp}    ${virheviesti}
    Sleep    2s
    # Tarkistetaan, että elementti on sivustolla
    ${elem_status}    Run Keyword And Return Status    Wait Until Page Contains Element    ${elementti_xp}
    IF    not ${elem_status}
        Fail    ${virheviesti}
    END

Tarkista Ilmoitus
    [Arguments]    ${ilmoitusnimi}    ${ilmoituskuvaus}
    # Tarkista, että sivulla on elementti joka on divin alla ja sisältää otsikko h4 joka sisältää
    # annetun ilmoituksen nimen JA elementillä on p joka sisältää ilmoituksen kuvauksen
    Tarkista Elementti Status    //div/h4[contains(text(),"${ilmoitusnimi}")]     Ilmoituksen lisääminen epäonnistui
    Tarkista Elementti Status    //div/p[contains(text(),"${ilmoituskuvaus}")]    Ilmoituksen lisääminen epäonnistui