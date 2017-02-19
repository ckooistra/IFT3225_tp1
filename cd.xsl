<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Ma CDtheque</title>
                <style type="text/css">
                    th {  background-color: silver;  }                     
            	   .ligne {background-color: #FFCCCC; }
                    td {
                        border-style: solid;
                        border-width: 1px;
                    }</style>
            </head>
            <body>
                <h2>Bibliotheque</h2>
                <table>
                    <tr>
                        <th>Titre</th>
                        <th>Auteur</th>
                        <th>Prix</th>
                    </tr>
                    <xsl:for-each select="catalog/cd">
                        <xsl:sort select="artist" order="descending"/>
                        <xsl:sort select="year" order="ascending" data-type="number"/>
                        <tr>
                            <xsl:if test="position() mod 2 = 0">
                                <xsl:attribute name="class">ligne</xsl:attribute>
                            </xsl:if>
                            
                            <td>
                                <xsl:value-of select="title"/>
                            </td>
                            <td>
                                <xsl:value-of select="concat(artist, ',', year)"/>
                            </td>
                            <td>
                                <xsl:value-of select="price"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>