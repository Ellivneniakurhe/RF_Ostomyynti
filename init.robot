*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     OperatingSystem
Library     Process

*** Variables ***
# Yleiset asetukset
${SELAIN}              Chrome
${SELENIUM_SPEED}      0.3
${SELENIUM_TIMEOUT}    3

# Osto- ja myyntikanavan asetukset
${LINKKI}        https://villeehrukainen.fi/osto/kirjautuminen.html

*** Keywords ***

Luo Webdriver Asetuksilla
    [Arguments]    ${LINKKI}
    IF    "${SELAIN}" == "Chrome"
        ${chrome_options} =    Evaluate    selenium.webdriver.ChromeOptions()
        Call Method    ${chrome_options}    add_argument    --start-maximized
        Create WebDriver    Chrome    chrome_options=${chrome_options}
    END
    
    # Asetetaan testin suoritusnopeus ja avainsanojen odotusaika
    Set Selenium Speed           ${SELENIUM_SPEED}
    Set Selenium Timeout         ${SELENIUM_TIMEOUT}

    Goto    ${LINKKI}