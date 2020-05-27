<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:param name="idf"/>
    <xsl:template match="/">
        <xsl:for-each select="teiCorpus/teiHeader/profileDesc//person[@idf = $idf]">
            <div class="border border-success rounded">
                <h3>
                    <xsl:apply-templates select="persName[@xml:lang = 'en']/forename"/>
                </h3>
                <div>
                    <h5>For some biographical informations:</h5>
                    <xsl:choose>
                        <xsl:when test="persName[@xml:lang = 'en']/note/link">
                            <a href="{persName[@xml:lang = 'en']/note/link}">
                                <xsl:apply-templates select="persName[@xml:lang = 'en']/note/text()"
                                />
                            </a>
                        </xsl:when>
                        <xsl:otherwise>
                            <li>
                                <xsl:apply-templates select="persName[@xml:lang = 'en']/note"/>
                            </li>
                        </xsl:otherwise>
                    </xsl:choose>
                </div>
                </div>
            <br/>
                <div class="border border-success rounded">
                   <h3>
                       <xsl:apply-templates select="persName[@xml:lang = 'ga']/forename"/>
                   </h3>
                    <div>
                   <h5>Nótaí beathaisnéise:</h5>
                <xsl:choose>
                    <xsl:when test="persName[@xml:lang = 'ga']/note/link">
                        <a href="{persName[@xml:lang = 'ga']/note/link}">
                            <xsl:apply-templates select="persName[@xml:lang = 'ga']/note/text()"
                            />
                        </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <li>
                            <xsl:apply-templates select="persName[@xml:lang = 'ga']/note"/>
                        </li>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
            </div> 
        <div>
            <br/>
            <h5>Work on Lirimix: </h5>
            <xsl:for-each select="listBibl/bibl">
            <a href="/song/{@n}">
                <xsl:apply-templates
                    select="text()"/><br/>
            </a>
            </xsl:for-each>
        </div>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
