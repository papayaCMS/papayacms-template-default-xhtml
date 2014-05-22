<?xml version="1.0"?>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="#default"
>
  <xsl:template name="content-area">
    <xsl:param name="pageContent" select="content/topic" />
    <xsl:call-template name="youtube-player">
      <xsl:with-param name="pageContent" select="$pageContent" />
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template name="youtube-player">
    <xsl:param name="pageContent" />
    <xsl:variable name="url" select="$pageContent/video/player/@url"/>
    <xsl:variable name="videoId" select="$pageContent/video/player/@videoId" />
    <xsl:variable name="autoplay" select="$pageContent/video/player/@autoplay" />
    <xsl:variable name="rel" select="$pageContent/video/player/@rel"/>
    <xsl:variable name="info" select="$pageContent/video/player/@info"/>
    <xsl:variable name="controls" select="$pageContent/video/player/@controls"/>
    <xsl:variable name="html5" select="$pageContent/video/player/@html5"/>
    <xsl:variable name="embedUrl">
      <xsl:value-of select="$url"/>
      <xsl:text>/embed/</xsl:text>
      <xsl:value-of select="$videoId"/>
      <xsl:text>?autoplay=</xsl:text>
      <xsl:value-of select="$autoplay"/>
      <xsl:text>&amp;rel=</xsl:text>
      <xsl:value-of select="$rel"/>
      <xsl:text>&amp;showinfo=</xsl:text>
      <xsl:value-of select="$info"/>
      <xsl:text>&amp;controls=</xsl:text>
      <xsl:value-of select="$controls"/>
      <xsl:text>&amp;wmode=transparent</xsl:text>
      <xsl:if test="$html5 = 'yes'">
        <xsl:text>&amp;html5=1</xsl:text>
      </xsl:if>
    </xsl:variable>
    <h2>
      <xsl:value-of select="$pageContent/video/title" />
    </h2>
    <iframe 
      width="{$pageContent/video/player/@width}"
      height="{$pageContent/video/player/@height}"
      src="{$embedUrl}"
      frameborder="0"
      >
     
    </iframe>
    <div class="videoText">
      <xsl:apply-templates select="$pageContent/video/text/node()" />
    </div>
  </xsl:template>

</xsl:stylesheet>
