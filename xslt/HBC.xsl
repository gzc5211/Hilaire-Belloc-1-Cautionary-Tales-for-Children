<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes"/>
<!-- **************************************************************************-->
<!-- 2022-11-17 ebb: This XSLT starter file is for the XSLT test in DIGIT 110. 
    Do not alter the stylesheet root element or the output line. 
    
   Your task is to transform the source XML document of Bram Stoker's novel Dracula into HTML with a 
   table of contents linked to a reading view, and styled with CSS. Your XSLT code needs to 
   * process one source XML file and output one valid and well-formed HTML file;
   * contain an HTML table  for the table of contents featuring:
        * each chapter heading
        * each chapter's distinct sorted locations
        * each chapter's distinct sorted technologies;
        
   * contain internal links from the chapter headings in the table of contents to the chapter headings;
   * contain span elements in the reading view to stylize the locations and technologies mentioned. 
   * Prepare CSS to style your HTML. The XSLT should output the CSS link line to your CSS file accurately. 
   
   
    -->  
    <!-- **************************************************************************-->
  <xsl:variable name="HBC" select="collection('../xml/?select=*.xml')"/>
 <xsl:template match="/">
     
     <!--RESULT DOC-->
    <xsl:for-each select="$HBC">
     <xsl:result-document method="xhtml" href="../docs/HBC.html">
     <html>
         <head>
             <title>Hilaire-Belloc-1-Cautionary-Tales-for-Children</title>
             <link rel="stylesheet" type="text/css" href="style.css"/>
         </head>
         <body>
           <h1 id="top"><!-- ebb: Use XSLT to pull the title of the novel as represented in the XML file here --></h1>
             
             <!-- Table of contents. -->
             <section id="contents"> 
                 <table> 
                 <tr>
                     <th>Story Name</th>
                    
                     <th>N/A</th>
                    
                     
                    
                 </tr>
                     <tr>
                         <td><a href="#C{count(preceding::Title)+1}"><xsl:apply-templates select="descendant::Title"/> </a></td>
                         
                         <td> <xsl:apply-templates select="descendant::location"/></td>
                         <td> <xsl:apply-templates select="descendant::tech"/></td>
                     </tr>
            <!-- ebb: prepare the table of contents representing each descendant chapter heading,
                   Hint: use <xsl:apply-templates with @mode here.  -->   
          
         
             </table>
             </section>
             
             <!--Reading view of the chapters here. -->
             <section id="readingView">
                 <xsl:apply-templates select="descendant::Title"/>
                 <xsl:apply-templates select="descendant::root"/>
                <!-- ebb: process the same descendant chapter heading elements here, but this time to start processing the reading view.  -->
             </section>
        </body>
        
     </html>
     </xsl:result-document>
    </xsl:for-each>
 </xsl:template>
    
   <!--ebb: Continue writing template rules, some with @mode for the table of contents, and some without it for the reading view.  -->
    
    
    <xsl:template match="location">
        <span class="location">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tech">
        <span class="tech">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="date">
        <span class="date">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    
    <xsl:template match="time">
        <span class="time">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="root">
        <section>
            <h2 id="C{count(preceding::Title)+1}"><xsl:apply-templates select="Title"/></h2>
            <div><xsl:apply-templates select="lg"/></div>
        </section>
    </xsl:template>
    
    <xsl:template match="Title">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="lg">
        <p>
        <ul>
            <xsl:apply-templates/>
        </ul>
        </p>
    </xsl:template>
    <xsl:template match="l">

           <li> 
            <xsl:apply-templates/>
        </li>

    </xsl:template>
</xsl:stylesheet>