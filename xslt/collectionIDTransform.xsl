<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no"
        indent="yes"/>
    <xsl:variable name="CTC-coll" as="document-node()+" select="collection('../xml/?select=*.xml')"/>
    
    <xsl:template match="/">
        <xsl:for-each select="CTC-coll">
            <xsl:variable name="currentFile" as="xs:string" select="base-uri() ! tokenize(., '/')[last()]"/>
            <xsl:result-document method="xml" indent="yes" href="../output/{$currentFile}">
                
                <xsl:if test="not(processing-instruction())">
                    <xsl:processing-instruction name="xml-model">
                        <xsl:text>href="CTC_Schema.rnc" type="application/relax-ng-compact-syntax"</xsl:text>
    
                    </xsl:processing-instruction>
             <!--  <?xml-model href="CTC_Schema.rnc" type="application/relax-ng-compact-syntax"?>-->
                </xsl:if>
                <xsl:apply-templates/>
            
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
    
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