<?xml version="1.0" encoding="UTF-8"?>

<!-- Define the XSL transformation element -->
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- Define the type of output as HTML -->
	<xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" />

	<!-- 
		Start by defining the transformation of each element that can be found in the DTD.
		We start with the root element "page".
		Since this is the root element, we will use it to inject an HTML5 simple template
	-->

	<xsl:template match="page">
		<html>
			<head>
				<title>Simple set-up of XML, DTD and XSLT</title>
			</head>

			<body>

				<!-- Since here we want our three children, we tell XSLT to apply other templates -->
				<xsl:apply-templates/>

			</body>
		</html>
	</xsl:template>

	<!-- 
		Then we define a match for each child element	
	-->

	<!-- Define the header transformation -->
	<xsl:template match="header">
		<header>
			<!-- We want the content inside an h1 tag, so we inject the apply-template inside it -->
			<h1>
				<xsl:apply-templates/>
			</h1>
		</header>
	</xsl:template>

	<!-- Define the main transformation -->
	<xsl:template match="main">
		<main>
			<!-- We want the content inside a generic div tag, to which we will give a class for later use, so we inject the apply-template inside it -->
			<div class="css-reference">
				<xsl:apply-templates/>
			</div>
		</main>
	</xsl:template>

	<!-- Define the footer transformation -->
	<xsl:template match="footer">
		<footer>
			<!-- We want the content inside a p tag, so we inject the apply-template inside it -->
			<p>
				<xsl:apply-templates/>
			</p>
		</footer>
	</xsl:template>

</xsl:stylesheet>