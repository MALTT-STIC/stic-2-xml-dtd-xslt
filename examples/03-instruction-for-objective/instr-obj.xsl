<?xml version="1.0" encoding="UTF-8"?>

<!-- Define the XSL transformation element -->
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" />



    <xsl:template match="objectives">
        <html>
            <head>
                <title>A list of objectives</title>
            </head>

            <body>
                <h1>A list of objectives</h1>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>



    <xsl:template match="objective">
        <section>
            <xsl:apply-templates />
        </section>
    </xsl:template>

    <xsl:template match="title">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>

    <xsl:template match="description">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="sequence">
        <!-- Since it is ordered, we transform in ol -->
        <ol>
            <xsl:apply-templates/>
        </ol>
    </xsl:template>

    <xsl:template match="list">
        <!-- Since it is unordered, we transform in ul -->
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>

    <xsl:template match="instruction">
        <!-- All instruction will be li, and will inherit a number or a bullet depending on where they are inserted -->
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>

</xsl:stylesheet>