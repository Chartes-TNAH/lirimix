<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <xsl:template match="/">
        <ul id="908">
        <xsl:for-each select="teiCorpus/TEI/teiHeader/fileDesc/sourceDesc/recordingStmt/recording">
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
                <a href="/song/{ancestor::TEI/@n}"><xsl:apply-templates select="ancestor::teiHeader/fileDesc/titleStmt/title[@type = 'main']/text()"/></a><br/>
                <xsl:value-of select="concat('Length: ',@dur,'.')"/><br/>
                <xsl:apply-templates select="respStmt/resp"/><xsl:text>(s): </xsl:text>
                <xsl:for-each select="respStmt/name"><xsl:apply-templates select="text()"/><xsl:text>, </xsl:text></xsl:for-each>
                <br/>
                
                <xsl:text>Date: </xsl:text>
                <xsl:apply-templates select="date"/>
                
            </div>
        <br/>
   </xsl:for-each>
        </ul>
    </xsl:template>
</xsl:stylesheet>