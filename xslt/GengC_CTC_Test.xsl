<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
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
    <xsl:variable name="CTC" as="document-node()+"
        select="collection('../xml/?select=*.xml')"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="webstyle.css"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Cautionary Tales for Children</title>
                
                
            </head>
            <body>
                <h1 id="bt">
                    Cautionary Tales for Children
                </h1>
                <h2>
                    Hilaire Belloc
                </h2>
    

                <!-- Table of contents. -->
                <section id="contents">
                    <table>
                        <tr>
                            <th>Poem Name</th>
                            <th>People mentioned</th>
                            <th>Action mentioned</th>
                            <th>Animal mentioned</th>
                        </tr>


                        <xsl:apply-templates select="$CTC//Title" mode="cp"/>



                        <!-- ebb: prepare the table of contents representing each descendant chapter heading,
                   Hint: use <xsl:apply-templates with @mode here.  -->

                    </table>

                </section>

                <!--Reading view of the chapters here. -->
                <section id="readingView">

                    <xsl:apply-templates select="$CTC//root"/>

                   
                </section>
            </body>

        </html>
    </xsl:template>
    


    <xsl:template match="root">
        <section>
            <h3 id="T{count(preceding::Title)+1}">
                <xsl:apply-templates select="Title"/>

            </h3>
            
                <xsl:apply-templates select="lg"/>
            
        </section>
    </xsl:template>


    <xsl:template match="root" mode="cp">
        <tr>
            <td>
                <a href="#T{count(preceding::Title)+1}">
                    <xsl:value-of select="$CTC//Title"/>
                </a>
            </td>
            
            <td>
                <xsl:apply-templates
                    select="descendant::tech ! normalize-space() => distinct-values() => sort() => string-join(', ')"
                    mode="tech"/>
            </td>
        </tr>
    </xsl:template>


    <xsl:template match="tech">
        <span class="tech">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="location">
        <span class="loca">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="time">
        <span class="time">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="date">
        <span class="date">
            <xsl:apply-templates/>
        </span>
    </xsl:template>


    <!--ebb: Continue writing template rules, some with @mode for the table of contents, and some without it for the reading view.  -->


</xsl:stylesheet>
