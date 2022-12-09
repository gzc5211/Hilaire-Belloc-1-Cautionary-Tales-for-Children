<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" include-content-type="no"
        indent="yes"/>
    <xsl:variable name="CTC" as="document-node()+"
        select="collection('../xml/?select=*.xml')"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Hilaire Belloc : Cautionary Tales for Children</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <h1>Hilaire Belloc : Cautionary Tales for Children</h1>
                <section id="toc">
                    <h2>Contents</h2>
                   
             <table>
               <tr>
                            
                            
                            
                            <th>Book Name</th>
                   
                            <th>Person Mentioned</th>
                   
                            <th>Action Mentioned</th>
                             <th>Animal Mentioned</th>
           </tr>
                        
        <xsl:apply-templates select="$CTC//root" mode="toc"/>
                        
                        
                </table>
                    
                    
                    
              </section>






          <section id="fulltext">
              <xsl:apply-templates select="$CTC//root"/>
          </section>
                
            </body>
        </html>
    </xsl:template>
    
    
   
   <xsl:template match="root" mode="toc">
       <tr>
           <td>
               <a href="#{@id}">
                   <xsl:apply-templates select="Title ! normalize-space() => distinct-values() => sort() => string-join('| ') "/>
               </a>
             
        </td>
           <td>
               <xsl:value-of select="//person ! normalize-space() => distinct-values() => sort() => string-join('| ') "/>
                  
               
           </td>
           <td>
               <xsl:value-of select="//action ! normalize-space() => distinct-values() => sort() => string-join('| ') "/>
           </td>
           
           
           <td>
               <xsl:value-of select="//animal ! normalize-space() => distinct-values() => sort() => string-join('| ') "/>
           </td>
           
           
           
       </tr>
                </xsl:template>
    
   
        
        


    
    <xsl:template match="root">
        <div id="{@id}">
         <h2>     
            <xsl:apply-templates select="Title"/>
         </h2>
         <p class="des">
             <xsl:apply-templates select="descrip"/>
         </p>   
            <xsl:apply-templates/>
        </div>
        
    </xsl:template>
    
    <xsl:template match="lg">
        
        <div class="lg">
            <xsl:apply-templates/>
        </div>
        
    </xsl:template>
    
    <xsl:template match="l">
        <p class="l">
            <xsl:apply-templates/>
            <span class="num">
                <xsl:value-of select="@num"/>
            </span>
        </p>
    </xsl:template>
    <xsl:template match="picture">
       <figure>
           <img class="picture" src="{@url ! substring-after(., 'docs/')}"/>
           <figcaption>
               <xsl:apply-templates select="interp"/>
           </figcaption>
       </figure>
           
    </xsl:template>
    <xsl:template match="person | place | animal | action ">
        
        <span class="{name()}">
            <xsl:apply-templates/>
        </span>
        
    </xsl:template>
    
  






</xsl:stylesheet>
