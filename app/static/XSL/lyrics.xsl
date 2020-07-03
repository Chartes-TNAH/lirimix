<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:param name="number"/>
    <xsl:template match="/">

        <xsl:for-each select="teiCorpus/TEI[@n = $number]">
            <div>
                <h2>
                    <xsl:apply-templates
                        select="teiHeader/fileDesc/titleStmt/title[@type = 'main']/text()"/>
                </h2>
                <div>
                    <h4>Alternative Title(s)/Ainm mhalartach :</h4>
                    <ul>
                    <xsl:for-each select="teiHeader/fileDesc/titleStmt/title[@type = 'alternative']">
                        <li>
                            <xsl:value-of select="./text()"/>
                        </li>
                    </xsl:for-each>
                    </ul>
                </div>
                <br/>
                
                <div>
                    <h4>Author(s) :</h4>
                    <xsl:for-each select="teiHeader/fileDesc/titleStmt/author">
                            <h5>  <xsl:apply-templates select="name[@xml:lang='en']/text()"/> </h5>
                    </xsl:for-each>
                    <br/>
       
                   <h4> Údar(an) :</h4>
                    <xsl:for-each select="teiHeader/fileDesc/titleStmt/author">
                        <h5>  <xsl:apply-templates select="name[@xml:lang='ga']/text()"/> </h5>
                    </xsl:for-each>
                </div>
                <br/>
                <br/>
                <div>
                    <h3>History</h3>
                    <div>
                        <xsl:apply-templates select="text/front/div[@xml:lang = 'en']/p" />
                    </div>
                </div>
                <div>
                    <h3>Scéal</h3>
                    <div>
                        <xsl:apply-templates select="text/front/div[@xml:lang = 'ga']/p" />
                    </div>
                </div>
 <br/>
                <br/>
                <div>
                    <h3>Lyrics/Lirici</h3>
                    <div>
                        <xsl:apply-templates select=".//div/lg" />
                    </div>
                </div>
                <h3>Performances/Léiriú</h3>
                <div>
                    <xsl:for-each select="teiHeader/fileDesc/sourceDesc/recordingStmt/recording">
                        <div class="border border-success rounded">
                            <a href="{media/@url}">
                                <xsl:choose><xsl:when test="media[@mimeType ='video/mp4']">
                                    <img src="../static/img/video_img.png" alt="" class="img-thumbnail" width="75" height="75"/>
                                    
                                </xsl:when>
                                    <xsl:otherwise>
                                        <img src="../static/img/audio_img.png" alt="" class="img-thumbnail" width="75" height="75"/>    
                                    </xsl:otherwise>
                                </xsl:choose>
                            </a>
                            <xsl:apply-templates select="media/desc/text()"/><br/>
                            <xsl:value-of select="concat('Length: ',@dur,'.')"/><br/>
                            <xsl:apply-templates select="respStmt/resp"/><xsl:text>(s): </xsl:text>
                            <xsl:for-each select="respStmt/name"><xsl:apply-templates select="text()"/><xsl:text>, </xsl:text></xsl:for-each>
                            <br/>
                            
                            <xsl:text>Date: </xsl:text>
                            <xsl:apply-templates select="date"/>
                        </div>
                        <br/>
                    </xsl:for-each>
                    
                </div>
            </div>
        </xsl:for-each>



    </xsl:template>
    <xsl:template match="p">
        <p><xsl:apply-templates /></p>
    </xsl:template>
    <xsl:template match="l">
        <li><xsl:apply-templates /></li>
    </xsl:template>
    <xsl:template match="lg">
        <ul style="list-style-type: none;">
            <xsl:apply-templates />
        </ul>
    </xsl:template>

</xsl:stylesheet>
