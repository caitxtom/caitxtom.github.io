<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="html"/>

<xsl:template match="/">
<html lang="en">
    <head>
        <title>CNIT 131A Homework 4</title>
    </head>
    <body>
        <h1>ABC Financial Startup</h1>

        <div style="text-align:center;">
            <img src="financialstartup.jpg" alt="two people high-fiving with stock arrow going up"/>
        </div>

            <!-- The paragraph below the image is a simple paragraph. -->
            <p>We are a very young financial manager company and we are proud of our clients.</p>

            <!-- The second paragraph uses what was learned in XPath to count the number of clients the company currently has -->
            <!-- . selects the current node and / selects from the root node -->
            <p>We have started with <xsl:value-of select="count(Accounts/Client/Years[. &gt;= 10])"/> client(s) a little bit more than 10 years ago and now we have <xsl:value-of select="count(Accounts/Client)"/> clients!</p>

            <!-- The third paragraph uses also what has been learned to list the names of the clients separated by , (comma), but the last name will come preceded by , and (comma and word and). -->
            <p>These are our clients:
                <xsl:for-each select="Accounts/Client">
                    <!-- First(space)Last, ..., First(space)Last, and First(space)Last. -->
                    <xsl:value-of select="Name/First"/><xsl:text> </xsl:text><xsl:value-of select="Name/Last"/>
                    <xsl:choose>
                        <xsl:when test="position()=last()">.</xsl:when>
                        <xsl:when test="position()=last()-1">, and </xsl:when>
                        <xsl:otherwise>, </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </p>

            <!-- The last paragraph also uses what has been learned in XPath to count the clients that have been with the company for more than 7 years! -->
            <p><xsl:value-of select="count(Accounts/Client/Years[. &gt;= 7])"/> of our clients are with us for more than 7 years!</p>
    </body>
</html>

</xsl:template>

</xsl:stylesheet>