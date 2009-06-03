<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:ntb="http://www.nitobi.com" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" omit-xml-declaration="yes"/>
<xsl:param name="browser" select="'IE'"/>
<xsl:param name="scrollbarWidth" select="17" />

<xsl:template match = "/">
<xsl:variable name="u" select="state/@uniqueID" />
<xsl:variable name="Id" select="state/@ID" />
<xsl:variable name="resizeEnabled" select="//ntb:treegrid/@GridResizeEnabled" />
<xsl:variable name="offset">
    <xsl:choose>
        <xsl:when test="$browser='IE'">1</xsl:when>
        <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
</xsl:variable>    

    &lt;div id="grid<xsl:value-of select="$u" />" class="ntb-treegrid ntb-treegrid-reset <xsl:value-of select="//ntb:treegrid/@Theme" />" style="overflow:visible;"&gt;
        &lt;div style="height:0px;width:0px;position:relative;"&gt;
                &lt;div id="ntb-treegrid-overlay<xsl:value-of select="$u" />" class="ntb-treegrid-overlay<xsl:value-of select="$u" />"&gt;&lt;/div&gt;
                <!-- Firefox or IE just uses a hidden div for keynav since on Mac at least it doesn't capture the paste event on an input -->
				<xsl:if test="not($browser='SAFARI')">&lt;div id="ntb-treegrid-keynav<xsl:value-of select="$u" />" tabindex="1" style="position:absolute;left:-3000px;width:1px;height:1px;border:0px;background-color:transparent;"&gt;&lt;/div&gt;</xsl:if>
				<!-- Safari can't capture key events on divs so need to use an input -->
                <xsl:if test="$browser='SAFARI'">&lt;input type="text" id="ntb-treegrid-keynav<xsl:value-of select="$u" />" tabindex="1" style="position:absolute;left:-3000px;width:1px;height:1px;border:0px;background-color:transparent;"&gt;&lt;/input&gt;</xsl:if>
        &lt;/div&gt;

    &lt;table cellpadding="0" cellspacing="0" border="0" &gt;
        &lt;tr&gt;
            &lt;td id="ntb-treegrid-scroller<xsl:value-of select="$u" />" class="ntb-treegrid-scrollerheight<xsl:value-of select="$u" /> ntb-treegrid-scrollerwidth<xsl:value-of select="$u" />" &gt;
                &lt;div id="ntb-treegrid-scrollerarea<xsl:value-of select="$u" />" class="ntb-treegrid-scrollerheight<xsl:value-of select="$u" />" style="overflow:hidden;" &gt;
                    &lt;div tabindex="2" id="ntb-treegrid-surface-container-<xsl:value-of select="$u" />" class="ntb-treegrid-scroller<xsl:value-of select="$u" /> ntb-treegrid-scrollerheight<xsl:value-of select="$u" />" &gt;
                    	<!-- The contents of this div will be filled in by surfaceXsl.xslt -->
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
            &lt;td id="ntb-treegrid-vscrollshow<xsl:value-of select="$u" />" class="ntb-treegrid-scrollerheight<xsl:value-of select="$u" />"&gt;&lt;div id="vscrollclip<xsl:value-of select="$u" />" class="ntb-treegrid-scrollerheight<xsl:value-of select="$u" /> ntb-treegrid-scrollbarwidth<xsl:value-of select="$u"/> ntb-scrollbar" style="overflow:hidden;" &gt;&lt;div id="vscroll<xsl:value-of select="$u" />" class="ntb-scrollbar" style="height:100%;width:<xsl:value-of select="number($offset)+number(//ntb:treegrid/@scrollbarWidth)"/>px;position:relative;top:0px;left:-<xsl:value-of select="$offset"/>px;overflow-x:hidden;overflow-y:scroll;" &gt;&lt;div class="vScrollbarRange<xsl:value-of select="$u" />" style="WIDTH:1px;overflow:hidden;"&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/td&gt;    
        &lt;/tr&gt;
        &lt;tr id="ntb-treegrid-hscrollshow<xsl:value-of select="$u" />" &gt;
            &lt;td &gt;&lt;div id="hscrollclip<xsl:value-of select="$u" />" class="ntb-treegrid-scrollbarheight<xsl:value-of select="$u" /> ntb-treegrid-scrollerwidth<xsl:value-of select="$u" /> ntb-hscrollbar" style="overflow:hidden;" &gt;
                &lt;div id="hscroll<xsl:value-of select="$u" />" class="ntb-treegrid-scrollbarheight<xsl:value-of select="$u" /> ntb-treegrid-scrollerwidth<xsl:value-of select="$u" /> ntb-scrollbar" style="overflow-x:scroll;overflow-y:hidden;height:<xsl:value-of select="number($offset)+number(//ntb:treegrid/@scrollbarHeight)"/>px;position:relative;top:-<xsl:value-of select="$offset"/>px;left:0px;" &gt;
                    &lt;div class="hScrollbarRange<xsl:value-of select="$u" />" style="HEIGHT:1px;overflow:hidden;"&gt;
                &lt;/div&gt;
            &lt;/td&gt;
            &lt;td class="ntb-treegrid-vscrollshow<xsl:value-of select="$u" /> ntb-scrollcorner" &gt;&lt;/td&gt;
        &lt;/tr&gt;
    &lt;/table&gt;

		&lt;div id="toolbarContainer<xsl:value-of select="$u" />" style="overflow:hidden;" class="ntb-treegrid-toolbarshow<xsl:value-of select="$u" /> ntb-treegrid-toolbarheight<xsl:value-of select="$u" /> ntb-treegrid-width<xsl:value-of select="$u" /> ntb-toolbar"&gt;&lt;/div&gt;

        &lt;div id="ntb-treegrid-toolscontainer<xsl:value-of select="$u"/>" style="height:0px;"&gt;
			<!-- In IE quirks the textarea has a forced height so need it to have a relative positioned container -->
	        &lt;div style="position:relative;overflow:hidden;height:0px;"&gt;
	            &lt;textarea id="ntb-clipboard<xsl:value-of select="$u"/>" class="ntb-clipboard" &gt;&lt;/textarea&gt;
	        &lt;/div&gt;
	        &lt;div style="position:relative;"&gt;
	            &lt;div id="ntb-column-resizeline<xsl:value-of select="$u" />" class="ntb-column-resizeline"&gt;&lt;/div&gt;
	            &lt;div id="ntb-treegrid-resizebox<xsl:value-of select="$u" />" class="ntb-treegrid-resizebox"&gt;&lt;/div&gt;
		    &lt;div id="ntb-column-dragbox<xsl:value-of select="$u" />" class="ntb-column-dragbox"&gt;&lt;/div&gt;
			&lt;/div&gt;
        &lt;/div&gt;

		<xsl:if test="$resizeEnabled = 1">
	        &lt;div id="ntb-treegrid-resizecontainer<xsl:value-of select="$u"/>" style="height:0px;position:relative;"&gt;
	        	&lt;div id="ntb-treegrid-resizeright<xsl:value-of select="$u" />" class="ntb-resize-indicator-right"&gt;&lt;/div&gt;
	        	&lt;div id="ntb-treegrid-resizebottom<xsl:value-of select="$u" />" class="ntb-resize-indicator-bottom"&gt;&lt;/div&gt;
	        &lt;/div&gt;
		</xsl:if>

    &lt;/div&gt;

</xsl:template>

</xsl:stylesheet>
