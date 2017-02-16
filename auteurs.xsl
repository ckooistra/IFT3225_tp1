<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    
    <xsl:template match="/">
        <html>
            <head></head>
            <body>
                <h2>Auteurs</h2>
                
                <table border="1">
                    
                    <tr>
                        <th style="text-align:left">Nom</th>
                        <th style="text-align:left">Prenom</th>
                        <th style="text-align:left">Pays</th>
                        <th style="text-align:left">Photo</th>
                        <th style="text-align:left">Commentaire</th>
                    </tr>

                    <xsl:for-each select="auteur/cd">
                    
                </table>
            </body>            
        </html>
    </xsl:template>
    
    
</xsl:stylesheet>