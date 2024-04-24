<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>

    <xsl:template match="/">
        <xsl:text>| ID    | Nazwa           | Producent     | Pierwszy Lot  | Status     |&#xA;</xsl:text>
        <xsl:text>|-------|-----------------|---------------|---------------|------------|&#xA;</xsl:text>

        <xsl:for-each select="rakietyKosmiczne/rakiety/rakieta">
            <xsl:text>| </xsl:text>
            <xsl:value-of select="format-number(substring-after(@id, 'rk'), '000')"/>
            <xsl:text>   | </xsl:text>
            <xsl:value-of select="substring(concat(nazwa, '                 '), 1, 15)"/>
            <xsl:text> | </xsl:text>
            <xsl:value-of select="substring(concat(producent, '               '), 1, 13)"/>
            <xsl:text> | </xsl:text>
            <xsl:value-of select="substring(concat(pierwszyLot, '               '), 1, 13)"/>
            <xsl:text> | </xsl:text>
            <xsl:value-of select="substring(concat(status, '            '), 1, 10)"/>
            <xsl:text> |</xsl:text>
            <xsl:text>&#xa;</xsl:text>
            <xsl:text>|-------|-----------------|---------------|---------------|------------|</xsl:text>
            <xsl:if test="position() != last()">
                <xsl:text>&#xa;</xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
