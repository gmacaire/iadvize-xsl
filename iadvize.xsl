<?xml version="1.0" encoding="utf-8"?>

<!-- Cette feuille de style XSL décrit la transformation en HTML d'un fichier de discussions iAdvize au format XML. -->
<!-- La mise en forme est réalisée avec Bootstrap (http://getbootstrap.com). -->
<!-- Auteur: Guillaume Macaire -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-system="about:legacy-compat" encoding="utf-8" indent="yes" />

    <xsl:template match="discussions">
        <xsl:variable name="title" select="concat('Discussions iAdvize pour ', @website)" />
        <html lang="fr">
            <head>
                <title><xsl:value-of select="$title" /></title>
                <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
                <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css" />
            </head>

            <body>
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <p class="lead"><xsl:value-of select="$title" /></p>
                        </div>
                    </div>
                    <xsl:for-each select="chat">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Chat #<xsl:value-of select="@id"/></h3>
                                    <span class="glyphicon glyphicon-user"></span> <xsl:value-of select="operator"/>,
                                    le <xsl:value-of select="datetime"/> 
                                    <span class="label label-info">
                                        <xsl:value-of select="concat(substring-before(duration, ':'), ' minute(s) ', substring-after(duration, ':'), ' seconde(s)')" />
                                    </span>
                                    <span class="label label-info">
                                        <xsl:value-of select="count(history/visitor|history/operator)"/> échanges
                                    </span>
                                </div>
                                <div class="panel-body">
                                    <xsl:for-each select="history/visitor|history/operator">
                                        <xsl:choose>
                                            <xsl:when test="name()='operator'">
                                                <p class="text-right">
                                                    (<xsl:value-of select="@time" />) 
                                                    <span class="glyphicon glyphicon-user"></span>
                                                    <xsl:value-of select="." />
                                                </p>
                                            </xsl:when>
                                            <xsl:when test="name()='visitor'">
                                                <p class="text-left">
                                                    (<xsl:value-of select="@time" />) <xsl:value-of select="." />
                                                </p>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <p class="text-center">
                                                    <span class="glyphicon glyphicon-info-sign"></span>
                                                    <em>(<xsl:value-of select="@time" />) <xsl:value-of select="." /></em>
                                                </p>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:for-each>
                                </div>
                            </div>
                        </div>
                    </div>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
