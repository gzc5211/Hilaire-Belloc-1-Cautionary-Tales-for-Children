<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:template match="lg">    
        <lg num="{count (preceding-sibling::lg)+1}">
            <xsl:apply-templates/>
        </lg>
    </xsl:template>
    
    <xsl:template match="l">
        <l num="{count (preceding-sibling::l)+1}">
            <xsl:apply-templates/>
        </l>
    </xsl:template>
</xsl:stylesheet>