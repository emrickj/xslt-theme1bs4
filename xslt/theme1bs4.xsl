<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:param name="page"/>
   <xsl:param name="website"/>
   <xsl:param name="contents"/>
   <xsl:param name="wpm1"/>
   <xsl:param name="wpm2"/>
   <xsl:param name="title1" select="document('../data/website.xml')/website/title" />
   <xsl:param name="title2" select="document('../data/website2.xml')/website/title" />

<xsl:output method="html" doctype-system="about:legacy-compat" encoding="utf-8" indent="yes" />

<xsl:template match="website">
<html lang="{page[position()=$page]/@language}">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	<title><xsl:value-of select="$title1"/></title>
<style>
@media (min-width: 576px) {
	form label {text-align: right;}
}
<xsl:value-of select="document('../data/website.xml')/website/style" disable-output-escaping="yes" />
</style>
</head>
<body id="demo">
<div class="d-block d-md-none">
<nav class="navbar bg-dark navbar-dark fixed-top">
  <a class="navbar-brand" href="http://www.gem-editor.com/gwc/theme1bs4.php"><xsl:value-of select="$title1"/></a>
  <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#myNavbar">
	<span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="myNavbar">
    <ul class="navbar-nav">
       <xsl:call-template name="page" />
	</ul>
  </div>
</nav>
</div>
   <div class="container" style="padding-bottom: 20px;">
      <div class="d-block d-md-none" style="padding-top: 50px;"></div>
      <div class="row">
         <div class="col-md-3" style="padding: 20px" id="title">
         <b><h2><center><xsl:value-of select="$title1"/></center></h2></b>
         </div>
         <div class="col-md-9" style="padding-bottom: 20px;">
			<img class='img-fluid' src='{page[position()=$page]/image}' />
         </div>
      </div>
      <div class="row">
         <div class="col-md-3 d-none d-md-block">
                  <br />
                  <xsl:call-template name="btngroup" />
                  <br />
                  <br />
         </div>
         <div class="col-md-9">
           <div class="card bg-light">
               <div class="card-body">
					<xsl:call-template name="contents" />
               </div>
				<div class="card-footer">
					<center>This website was created using <a href="https://www.gem-editor.com">GEM</a>.</center>
				</div>			   
           </div>
         </div>
      </div>
   </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>

</xsl:template>

<xsl:template name="page">
    <xsl:for-each select="page">
		<xsl:if test="string-length(name) &gt; 2">
			<li class='nav-item'>
			  <a class='nav-link' href='?{$wpm1}p={position()}'>
				<xsl:if test="position() = $page">
				   <xsl:attribute name="class">nav-link active</xsl:attribute>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="substring(name,2,1)=' '">
					   <i class="fa fa-fw"><xsl:value-of select="substring(name,1,1)" /></i>
					   <xsl:value-of select="substring(name,2)" />
					</xsl:when>
					<xsl:otherwise>
					   <xsl:value-of select="name" disable-output-escaping="yes" />
					</xsl:otherwise>
				</xsl:choose>
			  </a>
			</li>
		</xsl:if>
	</xsl:for-each>
   <li class="nav-item">
	  <a class='nav-link' href='?{$wpm2}p=1'>
	     <xsl:choose>
		    <xsl:when test="$wpm2='w=2&amp;'">
		       <xsl:value-of select="$title2" disable-output-escaping="yes" />
			</xsl:when>
			<xsl:otherwise>
			   <xsl:value-of select="$title1" disable-output-escaping="yes" />
			</xsl:otherwise>
		 </xsl:choose>
	  </a>
   </li>
</xsl:template>

<xsl:template name="btngroup">
  <div class="btn-group-vertical btn-group-lg">
	<xsl:for-each select="document('../data/website.xml')/website/page">
	   <xsl:if test="string-length(name) &gt; 2">
		  <a href='?p={position()}' class='btn btn-primary'>
			<xsl:if test="$website=1 and position()=$page">
			   <xsl:attribute name="class">btn btn-primary active</xsl:attribute>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="substring(name,2,1)=' '">
				   <i class="fa"><xsl:value-of select="substring(name,1,1)" /></i>
				   <xsl:value-of select="substring(name,2)" />
				</xsl:when>
				<xsl:otherwise>
				   <xsl:value-of select="name" disable-output-escaping="yes" />
				</xsl:otherwise>
			</xsl:choose>
		  </a>
	   </xsl:if>
	</xsl:for-each>
	 <ul class="dropdown-menu" role="menu">
	<xsl:for-each select="document('../data/website2.xml')/website/page">
	   <xsl:if test="string-length(name) &gt; 2">
		 <li>
			<a class='dropdown-item' href='?w=2&amp;p={position()}'>
				<xsl:if test="$website=2 and position()=$page">
				   <xsl:attribute name="class">dropdown-item active</xsl:attribute>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="substring(name,2,1)=' '">
					   <i class="fa fa-fw"><xsl:value-of select="substring(name,1,1)" /></i>
					   <xsl:value-of select="substring(name,2)" />
					</xsl:when>
					<xsl:otherwise>
					   <xsl:value-of select="name" disable-output-escaping="yes" />
					</xsl:otherwise>
				</xsl:choose>
			</a>
		 </li>
	   </xsl:if>
	</xsl:for-each>
	 </ul>
	 <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		<xsl:value-of select="$title2" disable-output-escaping="yes" />
		<span class="caret"></span>
	 </button>
  </div>
</xsl:template>

<xsl:template name="contents">
	<xsl:value-of select="$contents" disable-output-escaping="yes" />
	<xsl:if test="page[position()=$page]/@type='comments'">
		 <div id='HCB_comment_box' style='color: inherit; background-color: inherit;'>   <a href="https://www.htmlcommentbox.com">HTML Comment Box</a> is loading comments...</div>
		 <link rel="stylesheet" type="text/css" href="https://www.htmlcommentbox.com/static/skins/default/skin.css" />
		 <script type="text/javascript" language="javascript" id="hcb">
		 <![CDATA[			 
		 if(!window.hcb_user){hcb_user={  };} (function(){s=document.createElement("script");s.setAttribute("type","text/javascript");s.setAttribute("src", "https://www.htmlcommentbox.com/jread?page="+escape((window.hcb_user && hcb_user.PAGE)||(""+window.location)).replace("+","%2B")+"&opts=470&num=10");if (typeof s!="undefined") document.getElementsByTagName("head")[0].appendChild(s);})();
		 ]]>
		 </script>
		 <!-- end htmlcommentbox.com -->
	</xsl:if>
	<xsl:if test="page[position()=$page]/@type='form'">
	   <form class="form-horizontal" role="form" method="post">
		  <div class="form-group row">
			 <label class="col-form-label col-sm-4" for="name">Name:</label>
			 <div class="col-sm-6">
				<input type="text" class="form-control" name="name" />
			 </div>
		  </div>
		  <div class="form-group row">
			 <label class="col-form-label col-sm-4" for="email">Email Address:</label>
			 <div class="col-sm-6">
				<input type="email" class="form-control" name="email" />
			 </div>
		  </div>
		  <div class="form-group row">
			 <label class="col-form-label col-sm-4" for="subject">Subject:</label>
			 <div class="col-sm-6">
				<input type="text" class="form-control" name="subject" />
			 </div>
		  </div>
		  <div class="form-group row">
			 <label class="col-form-label col-sm-4" for="message">Message:</label>
			 <div class="col-sm-6">
				<textarea class="form-control" rows="5" name="message"></textarea>
				<br />
				<input type="submit" class="btn btn-primary" value="Submit" />
			 </div>
		  </div>
	   </form>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>
