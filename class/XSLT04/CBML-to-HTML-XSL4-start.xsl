<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:cbml="http://www.cbml.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>
    
    <!-- COLLECTION VARIABLES: Uncomment one of these if you need to process a collection!  -->
    <!--   <xsl:variable name="cbml-collection" as="document-node()+" select="collection('cbml/?select=*.xml')"/>-->
    
    <!-- 2023-11-08 ebb: MAKE SURE THERE ARE NO EXTRA SPACES in the collection() variable!   -->
    <!-- Alternative collection variable if your files are nested deeply below where your XSLT is saved: -->    
    <!-- <xsl:variable name="cbml-DeepNested" as="document-node()+" select="collection('.?select=*.xml;recurse=yes')"/>-->
    
    
    <xsl:template match="/">
        <html>
            <head>
                <title>A New CBML Transformation!</title>
                <link rel="stylesheet" type="text/css" href="style.css"/> 
            </head>
            <body>                
                <h1><xsl:apply-templates select="descendant::titleStmt/title"/></h1>                 
                <div id="characterTable">                                    
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

    <xsl:template match="div[@type='page']" mode="toc">
        <tr>
            <td>Page <xsl:value-of select="@xml:id ! substring-after(.,'_')"/></td>
            <td>Panels:
                <ul>
                    <xsl:apply-templates select=".//cbml:panel" mode="toc"/>
                </ul>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="cbml:panel" mode="toc">
        <li>
            <a href="#{parent::div/@xml:id}_panel_{@n}">Panel<xsl:value-of select="@n"/></a>
        </li>
    </xsl:template>
    

    <!-- READING VIEW TEMPLATES -->
    <xsl:template match="div[@type='page']">
        <section class="{@type}" id="{@xml:id}">
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    
    <xsl:template match="cbml:panel">
        <div class="panel" id="{parent::div/@xml:id}_panel_{@n}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="cbml:caption">
        <p class="caption">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="panelDesc">
        <span class="panelDesc">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="cbml:balloon">
        <strong class="balloon">
            <xsl:apply-templates/>
        </strong>
    </xsl:template>
    
    <xsl:template match="sound">
        <span class="sound">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="emph">
        <em>
            <xsl:apply-templates/>
        </em>
    </xsl:template>
    
    <xsl:template match="note">
        <span class="note">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!--ebb: Most <figure> and <figdesc> elements from CBML  can be handled with the HTML <figure> element,
       which is a top-level block HTML element (not allowed inside an HTML <p>).
       
       But in the Sonic XML files there are some figure and figDescs coded inside <p> elements, so 
       if we processed all of them this way, the HTML output will have errors and not be valid HTML. 
       I'm using an XPath predicate filter to exclude the figDesc and figure elements that are housed inside <p> elements from
   processing as <figure> and <p> for this project. 
   -->
    
    <xsl:template match="figure[not(parent::p)]">
        <figure class="figure">
            <xsl:apply-templates/>
        </figure>
        
    </xsl:template>
    
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    
    
</xsl:stylesheet>