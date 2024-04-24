<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"&gt;</xsl:text>
        <html xmlns="http://www.w3.org/1999/xhtml" lang="pl">
            <head>
                <title>Rakiety i Misje Kosmiczne</title>
                <style type="text/css">
                    table {
                    width: 100%;
                    border-collapse: collapse;
                    }
                    th, td {
                    border: 1px solid black;
                    padding: 5px;
                    text-align: left;
                    }
                    th {
                    background-color: #f2f2f2;
                    }
                </style>
            </head>
            <body>
                <h1>Rakiety Kosmiczne</h1>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nazwa</th>
                        <th>Producent</th>
                        <th>Pierwszy lot</th>
                        <th>Status</th>
                    </tr>
                    <xsl:for-each select="rakietyKosmiczne/rakiety/rakieta">
                        <tr>
                            <td><xsl:value-of select="@id"/></td>
                            <td><xsl:value-of select="nazwa"/></td>
                            <td><xsl:value-of select="producent"/></td>
                            <td><xsl:value-of select="pierwszyLot"/></td>
                            <td><xsl:value-of select="status"/></td>
                        </tr>
                    </xsl:for-each>
                </table>

                <h2>Misje</h2>
                <table>
                    <tr>
                        <th>ID Misji</th>
                        <th>ID Rakiety</th>
                        <th>Nazwa Misji</th>
                        <th>Data</th>
                        <th>Wynik</th>
                    </tr>
                    <xsl:for-each select="rakietyKosmiczne/misje/misja">
                        <tr>
                            <td><xsl:value-of select="@id"/></td>
                            <td><xsl:value-of select="@rakietaId"/></td>
                            <td><xsl:value-of select="nazwa"/></td>
                            <td><xsl:value-of select="data"/></td>
                            <td><xsl:value-of select="wynik"/></td>
                        </tr>
                    </xsl:for-each>
                </table>

                <div>
                    <h2>Podsumowanie</h2>
                    <p>Liczba elementow danych: <xsl:value-of select="count(//*)"/></p>
                    <p>Liczba roznych kategorii elementow: <xsl:value-of select="count(distinct-values(//*/name()))"/></p>
                    <p>Data wygenerowania raportu: <xsl:value-of select="current-date()"/></p>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
