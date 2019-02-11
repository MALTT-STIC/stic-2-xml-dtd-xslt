<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes" />

  <xsl:template match="web-app">
    <html>
      <head>
        <meta charset="utf-8" />
        <title>MVC collaboration template</title>
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
        <link rel="stylesheet" href="/http:/netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css" />
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"/>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"/>
        <style>
          body {
          font-family: "Trebuchet MS", Verdana, sans-serif;
          font-size: 16px;
          color: #1B1B1B;
          line-height: 22px;
          }

          .jumbotron {
          background-color: #351602;
          color: #FFFFFF;
          }
          label, .text-info {
          margin-right: 10px;
          }

          h2 {
          color: #351602;
          }
        </style>
      </head>

      <body>
        <div class="jumbotron">
          <div class="container">
            <h1>MVC collaboration template</h1>
            <p>An xml/dtd/xslt combination to ease the collaboration to build web applications according to the Model View Controller (MVC) pattern.</p>
          </div>
        </div>
        <div class="container">
          <div class="alert alert-warning">Warning: the application described in this page does not exist!</div>
          <!-- Nav tabs -->
          <ul class="nav nav-tabs">
            <li class="active">
              <a href="#web-app" data-toggle="tab">
                <span class="glyphicon glyphicon-globe"/>
                Application
              </a>
            </li>
            <li>
              <a href="#pages" data-toggle="tab">
                <span class="glyphicon glyphicon-file"/>
                Pages
              </a>
            </li>
            <li>
              <a href="#components" data-toggle="tab">
                <span class="glyphicon glyphicon-cog"/>
                Components
              </a>
            </li>
          </ul>
          <!-- Tab panes -->
          <div class="tab-content">
            <div class="tab-pane fade in active" id="web-app">
              <h2>About the application</h2>
              <xsl:apply-templates select="app-info" />
              <h3>Technical outlook</h3>
              <p>
                <label>Number of pages:</label>
                <span class="badge">
                  <xsl:value-of select="count(pages/page)"/>
                </span>
                <br />
                <label>Number of components:</label>
                <span class="badge">
                  <xsl:value-of select="count(components/component)"/>
                </span>
                <br />
                <label>Number of processes in business logic:</label>
                <span class="badge">
                  <xsl:value-of select="count(pages/page/model/processes/process)"/>
                </span>
                <br />
                <label>Number of layout sketches availables:</label>
                <span class="badge">
                  <xsl:value-of select="count(pages/page/view/sketch)"/>
                </span>
                <br />
                <label>Number of user action identified:</label>
                <span class="badge">
                  <xsl:value-of select="count(pages/page/controller/actions/action)"/>
                </span>
              </p>
            </div>
            <div class="tab-pane fade" id="pages">
              <xsl:apply-templates select="pages" />
            </div>
            <div class="tab-pane fade" id="components">
              <xsl:apply-templates select="components" />
            </div>
          </div>
        </div>
        <div class="footer">
          <div class="container">
            <hr />
            <p class="text-right">
              <strong>
                <a href="http://tecfaetu.unige.ch/perso/maltt/fritz0/">MAF</a>
              </strong>
              (29/03/2014)
            </p>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="app-info">
    <p>
      <label>Application name:</label>
      <xsl:value-of select="app-name"/>
    </p>
    <p>
      <label>Application description:</label>
      <xsl:value-of select="app-description"/>
    </p>
    <p>
      <label>Application URL:</label>
      <span class="glyphicon glyphicon-link"/>
      <a href="{app-url}">
        <xsl:value-of select="app-url"/>
      </a>
    </p>
  </xsl:template>
  <xsl:template match="pages">
    <xsl:apply-templates />
  </xsl:template>
  <xsl:template match="page">
    <article>
      <h2>
        <span class="glyphicon glyphicon-file"/>
        <xsl:value-of select="page-title"/>
      </h2>
      <p>
        <label>Page URL:</label>
        <xsl:value-of select="page-href"/>
      </p>
      <p>
        <label>Description:</label>
        <xsl:value-of select="page-description"/>
      </p>
      <div class="row">
        <div class="col-md-4">
          <xsl:apply-templates select="model" />
        </div>
        <div class="col-md-4">
          <xsl:apply-templates select="view" />
        </div>
        <div class="col-md-4">
          <xsl:apply-templates select="controller" />
        </div>
      </div>
    </article>
  </xsl:template>
  <xsl:template match="model">
    <div class="panel panel-info">
      <div class="panel-heading">Model</div>
      <div class="panel-body">
        <p>
          <label>Processes:</label>
        </p>
        <ul>
          <xsl:for-each select="processes/process">
            <li>
              <xsl:value-of select="process-description"/>
            </li>
          </xsl:for-each>
        </ul>
        <p>
          <label>Variables available for layout:</label>
        </p>
        <ul>
          <xsl:for-each select="variables/var">
            <li>
              <span class="text-info">
                <xsl:value-of select="var-name"/>
              </span>
              <small>
                <span class="badge">
                  <xsl:value-of select="var-type"/>
                </span>
              </small>
              <br />
              <xsl:value-of select="var-content"/>
            </li>
          </xsl:for-each>
        </ul>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="view">
    <div class="panel panel-warning">
      <div class="panel-heading">View</div>
      <div class="panel-body">
        <xsl:if test="sketch != ''">
          <p>
            <img src="{sketch}" class="img-responsive" />
          </p>
        </xsl:if>
        <p>
          <label>Description:</label>
          <xsl:value-of select="layout-description"/>
        </p>
        <xsl:if test="count(components-list/component-name) &gt; 0">
          <p>
            <label>Components in this page:</label>
          </p>
          <ul>
            <xsl:for-each select="components-list/component-name">
              <li>
                <xsl:value-of select="current()"/>
              </li>
            </xsl:for-each>
          </ul>
        </xsl:if>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="controller">
    <div class="panel panel-success">
      <div class="panel-heading">Controller</div>
      <div class="panel-body">
        <p>
          <label>Actions available for the User:</label>
        </p>
        <ul>
          <xsl:for-each select="actions/action">
            <li>
              <xsl:value-of select="current()"/>
            </li>
          </xsl:for-each>
        </ul>
      </div>
    </div>
  </xsl:template>
  <xsl:template match="components">
    <xsl:apply-templates />
  </xsl:template>
  <xsl:template match="component">
    <article>
      <h2>
        <span class="glyphicon glyphicon-cog"/>
        <xsl:value-of select="component-name"/>
      </h2>
      <p>
        <label>Description:</label>
        <xsl:value-of select="component-description"/>
      </p>
      <div class="row">
        <div class="col-md-4">
          <xsl:apply-templates select="model" />
        </div>
        <div class="col-md-4">
          <xsl:apply-templates select="view" />
        </div>
        <div class="col-md-4">
          <xsl:apply-templates select="controller" />
        </div>
      </div>
    </article>
  </xsl:template>
</xsl:stylesheet>