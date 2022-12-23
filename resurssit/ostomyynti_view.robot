*** Settings ***
Documentation    Yleiset xpath muuttujat elementeille

*** Variables ***
# Xpath on kieli jolla haetaan xml dokumenttityyppisistä dokumenteista elementtejä/tietoja...
# https://www.swtestacademy.com/xpath-selenium/#dynamic-web-elements-selenium

# Kentät
${kayttajakentta_xp}     //input[@id="tunnus"]
${salasanakentta_xp}     //input[@id="salasana"]
${ilmoituslaji_xp}       //select[@id="ilmoitus_laji"]
${ilmoitusosasto_xp}     //select[@id="ilmoitus_osasto"]
${ilmoitusnimi_xp}       //input[@id="ilmoitus_nimi"]
${ilmoituskuvaus_xp}     //textarea[@id="ilmoitus_kuvaus"]

# Napit, linkit
${kirjaudunappi_xp}      //button[contains(text(),'Kirjaudu')]
${uloskirjaudu_xp}       //a[contains(text(),'Kirjaudu ulos')]
${lisaailmoitus_xp}      //a[contains(text(),'Lisää ilmoitus')]
${lahetailmoitus_xp}     //button[contains(text(),"Lähetä")]

# Varmista elementti
${sisaanvarmista_xp}     //p[contains(text(),'Tervetuloa käyttämään palvelua')]
${ulosvarmista_xp}       //title[contains(text(),"Etusivu")]