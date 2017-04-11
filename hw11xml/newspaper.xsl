<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<!--
author: William Gillespie
assignment: hw11 xml / xsl
course: COSC 540 Web Programming
date: 2017-04-11
-->
<html>
<body>
  <h2>My Newspaper</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Headline</th>
      <th style="text-align:left">Byline</th>
      <th style="text-align:left">Lead</th>
      <th style="text-align:left">Body</th>
      <th style="text-align:left">Notes</th>
    </tr>
    <xsl:for-each select="NEWSPAPER/ARTICLE">
    <tr>
      <td><xsl:value-of select="HEADLINE"/></td>
      <td><xsl:value-of select="BYLINE"/></td>
      <td><xsl:value-of select="LEAD"/></td>
      <td><xsl:value-of select="BODY"/></td>
      <td><xsl:value-of select="NOTES"/></td>
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
