<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output  method="html"/>
    <xsl:param name="auteur" select="'default'" />
    
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="authors.css" />
            </head>
            
            <body>
                <div id="main">
                    <h2>Auteurs</h2>
                    
                    
                                                
                        <xsl:if test="$auteur='default'">
                            <table id="authors">
                                <tr>
                                    <th>Nom</th>
                                    <th>Prenom</th>
                                    <th>Pays</th>
                                    <th>Photo</th>
                                    <th>Commentaire</th>
                                    <th>Livres</th>
                                </tr>
                                <xsl:for-each select="bibliotheque/auteur">
                                    <xsl:sort select="nom"/>
                                    <xsl:call-template name="allAuthors" />
                                </xsl:for-each>
                            </table>
                        </xsl:if>
                        <xsl:if test="$auteur!='default'">
                            <xsl:choose>                                
                                <xsl:when test="/bibliotheque/auteur[nom=$auteur]">
                                    <h1><xsl:value-of select="/bibliotheque/auteur[nom=$auteur]/nom"/> </h1>
                                    <h1>Information pour auteur <xsl:value-of select="$auteur"/></h1>
                                </xsl:when>
                               
                                <xsl:otherwise>
                                    <h3>Auteur n'est pas trouvé dans la base de données!</h3>
                                </xsl:otherwise>
                                
                            </xsl:choose>
                        </xsl:if>
                        
                    
                </div>
            </body>            
        </html>
    </xsl:template>
    
    
    <xsl:template name="allAuthors" >
        <xsl:variable name="id">
            <xsl:value-of select="@ident"/>
        </xsl:variable>
        <tr>
            <td><xsl:value-of select="nom"/></td>
            <td><xsl:value-of select="prenom"/></td>
            <td><xsl:value-of select="pays"/></td>
            <td><xsl:value-of select="photo"/></td>
            <td><xsl:value-of select="commentaire"/></td>
            <td>
                <xsl:for-each select="//livre[contains(@auteurs, $id)]">
                    <xsl:value-of select="titre"/> 
                    <xsl:if test="position() != last()" >
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </td>
        </tr>       
    </xsl:template>
    
    
</xsl:stylesheet>