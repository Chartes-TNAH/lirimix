<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:template match="/">
        
            <xsl:for-each
                select="teiCorpus/teiHeader/profileDesc/particDesc/listPerson/person[@idf]">
                <a href="/author/{@idf}">
                    <li><xsl:apply-templates select="persName[@xml:lang='en']/forename"/><br/></li>
                </a>
            </xsl:for-each>


        
    </xsl:template>
</xsl:stylesheet>
