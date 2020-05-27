<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:param name="id_song"/>
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <link rel="stylesheet" type="text/css" href="bootstrap.css"/>
            </head>

            <h1>
                <xsl:apply-templates
                    select="TEI/teiHeader/fileDesc/titleStmt/title[@type = 'main']/@xml:id"/>
            </h1>
            <div class="col-sm-8">
                <h2>
                    <xsl:apply-templates
                        select="TEI/teiHeader/fileDesc/titleStmt/title[@type = 'main']"/>
                </h2>
                <ul>
                    <xsl:for-each
                        select="TEI/teiHeader/fileDesc/titleStmt/title[@type = 'alternative']">
                        <li><span>Alternatives titles</span> : <xsl:value-of select="./text()"
                            /></li>
                    </xsl:for-each>
                    <xsl:for-each select="/TEI/teiHeader/fileDesc/titleStmt/author">
                        <li><span>Author</span> : <xsl:value-of select="./@xml:lang='en'/text()"/></li>
                    </xsl:for-each>
                </ul>
            </div>
            <div>
                <h3>History</h3>
                <xsl:choose>
                    <xsl:when test="//text/front/div/p/head">
                        <h4>
                            <xsl:value-of select="/text()"/>
                        </h4>
                        <p>
                            <xsl:value-of select="//text/front/div[@xml:lang = 'en']/p/text()"/>
                        </p>
                    </xsl:when>
                    <xsl:otherwise>
                        <p>
                            <xsl:value-of select="//text/front/div[@xml:lang = 'en']/p/text()"/>
                        </p>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
            <div>
                <h3>Lyrics</h3>
                
                  
                <xsl:for-each select="//text/body/div/lg/l">
                    <ol>
                       <xsl:value-of select="."/>
                    </ol>  
                </xsl:for-each>
                
            </div>
            <div>
                <h3>Performances</h3>
                <xsl:choose>
                    <xsl:when test="TEI/teiHeader/fileDesc/sourceDesc/recordingStmt/recording">
                        <ul>
                            
                            <xsl:for-each
                                select="TEI/teiHeader/fileDesc/sourceDesc/recordingStmt/recording/media">
                                <li>
                                    <a href="{@url}">
                                        <xsl:value-of select="./desc/text()"/>
                                    </a>
                                </li>
                            </xsl:for-each> 
                                <xsl:for-each select="TEI/teiHeader/fileDesc/sourceDesc/recordingStmt/recording/respStmt">
                                    <li><xsl:value-of select="/resp/text()"/><xsl:text>: </xsl:text><xsl:value-of select="/name/text()"/></li>
                                </xsl:for-each>
                                
                            
                        </ul>
                    </xsl:when>
                </xsl:choose>
            </div>
        </html>
    </xsl:template>
</xsl:stylesheet>
