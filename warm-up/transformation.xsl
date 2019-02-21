<?xml version="1.0" encoding="UTF-8"?>

<!-- Define the XSL transformation element -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<!-- Define the type of output as HTML -->
	<xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes"/>
	<!-- 
		Start by defining the transformation of each element that can be found in the DTD.
		We start with the root element "page".
		Since this is the root element, we will use it to inject an HTML5 simple template
	-->
	<xsl:template match="addressBook">
		<html>
			<head>
				<title>Address Book</title>
			</head>
			<body>
				<h1>List of contacts</h1>
				<ul>
					<xsl:apply-templates/>
				</ul>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="person">
		<li>
			<xsl:apply-templates/>
		</li>
	</xsl:template>
	<xsl:template match="name">
		<strong><xsl:apply-templates/></strong>
	</xsl:template>
	<xsl:template match="family">
		<xsl:apply-templates/>,
	</xsl:template>
	<xsl:template match="given">
		<xsl:apply-templates/> |
	</xsl:template>
	<xsl:template match="email">
		Email : <a href="mailto:{.}"><xsl:apply-templates/></a> |
	</xsl:template>
</xsl:stylesheet>