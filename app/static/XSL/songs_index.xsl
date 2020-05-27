<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:template match="/">
        <ul id='909'>
        <xsl:for-each select="teiCorpus/TEI">
       <span>     <a href="/song/{@n}">
                <p>  <xsl:apply-templates
                      select="teiHeader/fileDesc/titleStmt/title[@type = 'main']/text()"/> 
                </p></a></span>
        </xsl:for-each>
        </ul>
    </xsl:template>
</xsl:stylesheet>
