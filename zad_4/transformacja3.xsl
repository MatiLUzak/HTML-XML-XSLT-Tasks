<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/rakietyKosmiczne">
        <svg width="1000" height="500" xmlns="http://www.w3.org/2000/svg">
            <!-- Tytuł wykresu -->
            <text x="10" y="20" font-family="Verdana" font-size="18">Rocket Launches per Status</text>

            <!-- Legenda -->
            <text x="20" y="60" font-family="Verdana" font-size="14">Aktywna</text>
            <rect x="10" y="50" width="10" height="10" style="fill:blue;" />

            <text x="20" y="80" font-family="Verdana" font-size="14">Wycofana</text>
            <rect x="10" y="70" width="10" height="10" style="fill:red;" />

            <!-- Osie wykresu -->
            <line x1="50" y1="100" x2="50" y2="400" style="stroke:black;stroke-width:2"/>
            <line x1="50" y1="400" x2="950" y2="400" style="stroke:black;stroke-width:2"/>

            <!-- Słupki wykresu -->
            <xsl:variable name="activeCount" select="count(//rakieta[status='Aktywna'])" />
            <xsl:variable name="retiredCount" select="count(//rakieta[status='Wycofana'])" />
            <xsl:variable name="maxCount" select="$activeCount + $retiredCount" />
            <xsl:variable name="scaleFactor" select="300 div $maxCount" />

            <!-- Słupek dla rakiet aktywnych -->
            <rect x="100" y="{400 - ($activeCount * $scaleFactor)}" width="200" height="{$activeCount * $scaleFactor}" style="fill:blue;">
                <title>Aktywna: <xsl:value-of select="$activeCount"/></title>
            </rect>

            <!-- Słupek dla rakiet wycofanych -->
            <rect x="400" y="{400 - ($retiredCount * $scaleFactor)}" width="200" height="{$retiredCount * $scaleFactor}" style="fill:red;">
                <title>Wycofana: <xsl:value-of select="$retiredCount"/></title>
            </rect>

            <!-- Etykiety -->
            <text x="200" y="420" font-family="Verdana" font-size="14" text-anchor="middle">Aktywna</text>
            <text x="500" y="420" font-family="Verdana" font-size="14" text-anchor="middle">Wycofana</text>
        </svg>
    </xsl:template>
</xsl:stylesheet>
