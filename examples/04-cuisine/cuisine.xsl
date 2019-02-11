<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="recipe">
    <html>
      <head>
        <title>Recipes | Compiled by Rachel Dolores</title>
        <link rel="stylesheet" href="cuisine.css" type="text/css" />
      </head>
      <body>
        <div class="recipe">
          <xsl:apply-templates/>
        </div>
      </body>
    </html>
  </xsl:template>


<xsl:template match="recipe_head"><!-- Applies the "recipe_head" class to recipe_head element for CSS purposes, and uses an h1 element in case the stylesheet is unavailable -->
<h1 class="recipe_head">
  <xsl:apply-templates/>
</h1>
</xsl:template>

<xsl:template match="recipe_name">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="recipe_author">
  <span class="recipe_author">
    &#160;by&#160;<xsl:apply-templates/>
</span>
</xsl:template>

<xsl:template match="recipe_body">
  <div class="recipe_body">
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="pictures">
  <div class="pictures">
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="picture"><!-- Inserts an image using the contents of the "picture" element -->
<img src="{.}"></img>
</xsl:template>

<xsl:template match="links"><!-- Inserts a heading for the links box, creates a list for the links -->
<div class="links">
  <h3>links to other versions</h3>
  <ul><xsl:apply-templates/></ul>
</div>
</xsl:template>

<xsl:template match="link"><!-- Inserts a link using the link_url and link_description elements -->
<li><a href="{link_url}"><xsl:value-of select="link_description"/></a></li>
</xsl:template>

<xsl:template match="ingredients">
  <div class="ingredients">
    <h1>Ingredients</h1><!-- Inserts a the title "Ingredients" before the list of ingredients (Before, I only used CSS to do this) -->
    <ul><xsl:apply-templates/></ul>
  </div>
</xsl:template>

<xsl:template match="ingredient">
  <li><xsl:apply-templates/></li>
</xsl:template>

<xsl:template match="directions">
  <div class="directions">
    <h1>Directions</h1><!-- Inserts a the title "Directions" before the list of directions (Before, I only used CSS to do this) -->
    <ul><xsl:apply-templates/></ul>
  </div>
</xsl:template>

<xsl:template match="direction">
  <li><xsl:apply-templates/></li>
</xsl:template>

<xsl:template match="recipe_footer">
  <div class="recipe_footer">
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template match="serving">
  <div class="serving">
    Serves <xsl:apply-templates/>.
</div>
</xsl:template>

<xsl:template match="preparation_time">
  <div class="preparation_time">
    Ready in <xsl:apply-templates/>.
</div>
</xsl:template>

<xsl:template match="document_info"><!-- In the CSS file, document_info is displayed at "none" ... Here, we're defining the document_info class so it would not display -->
<div class="document_info">
  <xsl:apply-templates/>
</div>
</xsl:template>

</xsl:stylesheet>