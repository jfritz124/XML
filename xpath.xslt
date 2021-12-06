<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">

        1. Die erste Zahlungsart der dritten Rechnung.
        <xsl:value-of select="FRechnung/Rechnung[3]/Zahlungsart/*[1]"/>
        2. Der Namenstext aus allen Adressen, die eine Telefonnummer enthalten.
        <xsl:for-each select="FRechnung/Rechnung">
            <xsl:value-of select="Kontakt/Sender/Adresse[boolean(Tel)]/Name"/>
        </xsl:for-each>
        3. Die Adresse jedes Leistungserbringers, die eine Postleitzahl beginnend mit der Ziffer
        7 besitzt.
        <xsl:for-each select="FRechnung/Rechnung">
            <xsl:value-of select="Kontakt/Sender/Adresse[starts-with(PLZ/text(), '7')]"/>
        </xsl:for-each>
        4. Jede Rechnungsposition, die einen Einzelpreis besitzt, der kleiner als 100.00 Euro ist.
        <xsl:for-each select="FRechnung/Rechnung">
            <xsl:for-each select="Positionen/Pos[100 > Preis div Menge]">
                <xsl:value-of select="Produkt"/>
            </xsl:for-each>
        </xsl:for-each>
        5. Die Rechnungsnummer jeder Rechnung mit mehr als 3 Positionen.
        <xsl:for-each select="FRechnung/Rechnung">
            <xsl:value-of select="RechnungsNummer[count(../Positionen/Pos) > 3]"/>
        </xsl:for-each>
        6. Jede Rechnung, bei der die Summe der Gesamtpreise der Positionen ungleich dem
        Rechnungsbruttobetrag ist.
        <xsl:for-each select="FRechnung/Rechnung[sum(Positionen/Pos/Preis) != Betrag/Brutto]">
            <xsl:value-of select="*"/>
        </xsl:for-each>

        7. Jede Rechnung, die in der Anrede der Empf¨angeradresse den Text Herr oder Frau
        enth¨alt.
        <xsl:for-each select="FRechnung/Rechnung[contains(Kontakt/Empfaenger/Adresse/Anrede, 'Herr') or contains(Kontakt/Empfaenger/Adresse/Anrede, 'Frau')]">
            <xsl:value-of select="*"/>
        </xsl:for-each>

        8. Jede Rechnung mit einem Brutto-Gesamtbetrag uber 1000.00. ¨
        <xsl:for-each select="FRechnung/Rechnung[Betrag/Brutto > 1000]">
            <xsl:value-of select="*"/>
        </xsl:for-each>

        9. Jede Rechnung mit einem Brutto-Gesamtbetrag uber dem durchschnittlichen Brutto- ¨
        Gesamtbetrag aller Rechnungen.
        <xsl:for-each select="FRechnung/Rechnung[Betrag/Brutto > sum(/FRechnung/Rechnung/Betrag/Brutto) div count(/FRechnung/Rechnung)]">
            <xsl:value-of select="*"/>
        </xsl:for-each>

    </xsl:template>
</xsl:stylesheet>