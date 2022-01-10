<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/FRechnung">
        <xsl:copy>
            <xsl:for-each select="Rechnung">
                <xsl:if test="substring-before(DatumAusstellung/text(), '-') > 2010">
                    <xsl:copy>

                        <xsl:if test="contains(Kontakt/Empfaenger/Adresse/Name, 'Herr') or contains(Kontakt/Empfaenger/Adresse/Name, 'Frau')">
                            <xsl:copy-of select="Kontakt/Empfaenger"/>
                            <xsl:copy-of select="Steuernummer"/>
                            <xsl:copy-of select="DatumAusstellung"/>
                            <xsl:copy-of select="Betrag/Brutto"/>
                            <Positionen>
                                <xsl:for-each select="Positionen/Pos">
                                    <Pos>
                                        <PosNummer>
                                            <xsl:value-of select="position()"/>
                                        </PosNummer>
                                        <xsl:copy-of select="Produkt"/>
                                        <xsl:copy-of select="Preis"/>
                                    </Pos>
                                </xsl:for-each>
                            </Positionen>
                        </xsl:if>
                    </xsl:copy>
                </xsl:if>
            </xsl:for-each>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>