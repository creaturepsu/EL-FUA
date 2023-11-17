<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    
    <xsl:template match="/">
        <html>
            <head>
                <title>fonadsfid</title>
                <link rel="stylesheet" type="text/css" href="style.css"/> 
            </head>
            <body>                
                <h1><xsl:apply-templates select="descendant::titleStmt/title"/></h1>                 
                <div id="{xml:id}">                                    
                    <table>
                        <tr>
                            <th>Page</th>
                            <th>Panels</th>
                        </tr>
                        <xsl:apply-templates select=".//div[@type='page']" mode="toc"/>
                    </table>
                </div>     
                <div id="reading-view">        
                    <xsl:apply-templates select="descendant::body"/>                  
                </div>              
            </body>
        </html>
    </xsl:template> 
    
    <xsl:template match="heading">      
        <h2 class="heading">
            <xsl:apply-templates/> 
        </h2>
    </xsl:template>
    
    <xsl:template match="p">      
        <p class="paragraph">
            <xsl:apply-templates/> 
        </p>
    </xsl:template>
    
    <xsl:template match="char">      
        <span class="character">
            <xsl:apply-templates/> 
        </span>
    </xsl:template>
    
    <xsl:template match="lDiv">      
        <span class="litdevice">
            <xsl:apply-templates/> 
        </span>
    </xsl:template>
    
    <xsl:template match="yap">      
        <span class="nonsense">
            <xsl:apply-templates/> 
        </span>
    </xsl:template>
    
    <xsl:template match="chapter">
        <div id="{@xml:id}">
        <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template>
        
    </xsl:template>
    
    
    <!--ok im not really sure how this would even work and this is as far
    as I got but, I wanted to see how I could make a list of chapters at the top 
    of the page which sends you directly to to them like in the sonic cbml, but it seems
    like this is somehow taking priority over the literal html? I really dont follow. AVTS
    just dont seem to work here-->
    
    <xsl:template match="chapter">
        <ul>
            <a href="#n{count(preceding::chapter) + 1}">
                <xsl:value-of select="count(preceding::chapter) + 1"/>
            </a>
        </ul>
    </xsl:template>
    
    <xsl:template match="chapter">      
        <div class="chapter">
            <xsl:apply-templates/> 
        </div>
    </xsl:template>
    
    
    
</xsl:stylesheet>




