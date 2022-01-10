<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:template match="/FRechnung">
        <xsl:for-each select="Rechnung">
            <xsl:if test="1000 > number(Brutto/text()) and boolean(Empfaenger)">
                <xsl:apply-templates select="Empfaenger/Adresse/Name"/>
                <xsl:text>.&#xa;</xsl:text>
                <xsl:text>Danke für die Zahlung von </xsl:text>
                <xsl:apply-templates select="Brutto"/>
                <xsl:text> für die Rechnung vom </xsl:text>
                <xsl:apply-templates select="DatumAusstellung"/>
                <xsl:text>.&#xa;</xsl:text>
                <xsl:text>Ich hoffe die </xsl:text>
                <xsl:apply-templates select="Positionen/Pos[last()]"/>
                <xsl:text> Einzelposten sind zu Ihrer Zufriedenheit geliefert worden.&#xa;&#xa;</xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="Name">
        <xsl:text><xsl:value-of select="."/></xsl:text>
    </xsl:template>

    <xsl:template match="Brutto">
        <xsl:text><xsl:value-of select="."/></xsl:text>
    </xsl:template>

    <xsl:template match="DatumAusstellung">
        <xsl:text><xsl:value-of select="substring-after(substring-after(., '-'), '-')"/></xsl:text>
        <xsl:text>.</xsl:text>
        <xsl:text><xsl:value-of select="string(number(substring-before(substring-after(., '-'), '-')))"/></xsl:text>
        <xsl:text>.</xsl:text>
        <xsl:text><xsl:value-of select="substring-before(., '-')"/></xsl:text>
    </xsl:template>

    <xsl:template match="Pos">
        <xsl:text><xsl:value-of select="PosNummer"/></xsl:text>
    </xsl:template>

</xsl:stylesheet>