<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes"/>
<!-- **************************************************************************-->
<!-- 2023-11-27 ebb: This XSLT starter file is for the XPath/XSLT test in DIGIT 110. 
        
    CAUTION: Do NOT alter the stylesheet root element or the output line. (The source XML is not in a namespace, 
    so this stylesheet is designed to simply read non-namespaced input and output the HTML namespace.) 
    
   Your task is to transform the source XML document of Bram Stoker's novel Dracula into HTML with a 
   table of contents linked to a reading view, and styled with CSS. Your XSLT code needs to 
   * process one source XML file and output one valid and well-formed HTML file;
   * contain an HTML table  for the table of contents that features:
        * each chapter heading
        * each chapter's distinct sorted locations;
        * each chapter's distinct sorted technologies;
        
   * contain HTML <span> elements with @class attributes in the reading view to stylize the locations and technologies mentioned. 
   * contain internal links from the chapter headings in the table of contents down to the chapter headings in the reading view (using modal XSLT);
   * Prepare CSS to style your HTML. The XSLT should output the CSS link line to your CSS file accurately. 
   * Good luck! You can (and should!) use past homeworks and examples and videos from class to help as needed. 
   * This is a solo exam, so the test contents must be your own individual work. As always, partial credit applies, so complete as much of this as you can, and 
   write XML comments as needed to explain what you're trying to do if something isn't working. 
   
    -->  
    <!-- **************************************************************************-->
  
 <xsl:template match="/">
     <html>
         <head>
             <title>Dracula</title>
             <link rel="stylesheet" type="text/css" href="style.css"/>
         </head>
         <body>
             <h1 id="#top"><xsl:apply-templates select="descendant::title"/></h1>                         
             
             
             
             
             
             <!-- Table of contents. -->
             <section id="#contents"> 
                 <table>
                 <tbody>   
                 <tr>
                     <th>Chapter Number</th>
                     <th>Locations mentioned</th> 
                     <th>Tech mentioned</th>
                 </tr>
                     <!--trying to copy the example output, I couldnt figure out a way to repeat "<tr>
                         <td><a href="#C1">CHAPTER I</a></td>" for every chapter-->
            <!-- ebb: Prepare the table of contents representing each descendant chapter heading,
                   Hint: use <xsl:apply-templates with @mode here.  -->   
                 </tbody>     
             </table>
             </section>
             
             
             
             
             
             <!--Reading view of the chapters here. -->
             <section id="#readingView">
                 <xsl:apply-templates select="descendant::chapter"/>
             </section>
        </body>
     </html>
     
     
 </xsl:template>
    <!--span classes-->
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
    <!--span classes-->
             
             
    <xsl:template match="heading">      
        <h2 id="{@xml:id}"> <!--not really sure why the IDs are not working for the chapters sinces I copied this from the alice xslt06 exercise-->
            <xsl:apply-templates/> 
        </h2>
    </xsl:template>
    
    <xsl:template match="p">      
        <p>
            <xsl:apply-templates/> 
        </p>
    </xsl:template>
    
    
   <!--ebb: Continue writing template rules, some with @mode for the table of contents, and some without it for the reading view.  -->
    
    
</xsl:stylesheet>