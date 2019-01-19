<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="1.0" encoding="UTF-8" omit-xml-declaration="yes" indent="yes" media-type="text/html" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd" standalone="no"/>
	<!--The parameter 'page-break contains the list of id's of projects that require a page break before being printed-->
	<xsl:param name="page-break"/>
	<xsl:template match="cv">
		<html>
			<head>
				<META name="Author">
					<xsl:attribute name="Content"><xsl:value-of select="/cv/personal_details/name"/></xsl:attribute>
				</META>
				<META name="ROBOTS" content="NOINDEX,NOFOLLOW"/>
				<title>
					<xsl:text>CV </xsl:text>
					<xsl:value-of select="personal_details/name"/>
					<xsl:text> (last update:</xsl:text>
					<xsl:value-of select="@last_update"/>
					<xsl:text>)</xsl:text>
				</title>
				<STYLE>
					body {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: x-small}
					.customer {  font-weight: bold}
					.function {  font-weight: bold}
					h1 {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: small; margin-top: 0px}
					td {  font-size: x-small}
					h2 {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: x-small; font-weight: bold; margin-bottom: 4px; margin-top: 15px}
					tr {  vertical-align: text-top}
					.project {  margin-top: 1px; margin-bottom: 1px}
					.project_name { font-weight: bold}
					.label_function {  font-weight: normal; text-align:right }
					.label_technologies {  font-weight: normal; }
					.technologies {  font-weight: normal}
					.activity {  margin-bottom: 0px}
					hr {  height: 1px; margin-top: 0px; margin-bottom: 0px}
					.avoid-page-break {page-break-inside: avoid;}
				</STYLE>				
			</head>
			<body>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="headlines">
		<h1>
			<xsl:value-of select="/cv/personal_details/name"/>
			<br/>
			<xsl:apply-templates/>
		</h1>
	</xsl:template>
	<xsl:template match="headline">
		<xsl:value-of select="."/>
		<br/>
	</xsl:template>
	<xsl:template match="availability">
		<h2>Availability: <xsl:apply-templates/>
		</h2>
	</xsl:template>
	<xsl:template match="personal_details">
		<h2>Personal Details</h2>
		<xsl:apply-templates select="email"/>
		<!--  
		<xsl:apply-templates select="address"/>
		-->
		<xsl:apply-templates select="date_of_birth"/>
		<!-- 
		<xsl:apply-templates select="phone"/>
		-->
		<!-- 
		<xsl:apply-templates select="fax"/>
		-->
	</xsl:template>
	<xsl:template match="name">
		<div class="name">
			<xsl:value-of select="."/>
		</div>
	</xsl:template>
	<xsl:template match="email">
		<div>
			<xsl:text>E-mail: </xsl:text>
			<a>
				<xsl:attribute name="href"><xsl:text>mailto:</xsl:text><xsl:apply-templates/></xsl:attribute>
				<xsl:apply-templates/>
			</a>
		</div>
	</xsl:template>
	<xsl:template match="address">
		<table cellspacing="0" cellpadding="0">
			<tr>
				<td>
					<xsl:text>Address: </xsl:text>
				</td>
				<td>
					<xsl:apply-templates/>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template match="address_line">
		<div>
			<xsl:value-of select="."/>
		</div>
	</xsl:template>
	<xsl:template match="date_of_birth">
		<div>
			<xsl:text>Date of birth: </xsl:text>
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template match="phone">
		<div>
			<xsl:text>Phone: </xsl:text>
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template match="fax">
		<div>
			<xsl:text>Fax: </xsl:text>
			<xsl:apply-templates/>
		</div>
	</xsl:template>
	<xsl:template match="projects">
		<h2>Professional Experience</h2>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="project">
		<div class="avoid-page-break">
			<hr/>
			<table class="project" width="100%" cellspacing="4" cellpadding="0">
				<col width="18%"/>
				<col/>
				<tr>
					<td colspan="2">
						<table cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td>
									<span class="customer">
										<xsl:value-of select="customer"/>
									</span>
									<xsl:apply-templates select="./intermediary"/>
								</td>
								<td class="date" align="right">
									<xsl:value-of select="datefrom"/>
									<xsl:text>-</xsl:text>
									<xsl:value-of select="dateto"/>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
					<!-- 
						<div class="label_function">Function : </div>
						 -->
					</td>
					<td>
						<div class="function">
							<xsl:value-of select="function"/>
						</div>
					</td>
				</tr>
				<tr>
					<td/>
					<td class="activity">
						<div class="activity">
							<ul>
								<li>
									<span class="project_name">
										<xsl:value-of select="@name"/>
									</span>
									<xsl:text> project: </xsl:text>									
									<xsl:apply-templates/>
								</li>
								<xsl:for-each select="activity">
									<li>
										<xsl:value-of select="."/>
									</li>
								</xsl:for-each>
							</ul>
						</div>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
						<span class="label_technologies">Technologies : </span>
						<span class="technologies">
							<xsl:for-each select="technology">
								<xsl:value-of select="."/>
								<xsl:if test="not(position()=last())">, </xsl:if>
							</xsl:for-each>
						</span>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<xsl:template match="intermediary">
		<span class="intermediary">
			<xsl:text> (via </xsl:text>
			<xsl:apply-templates/>
			<xsl:text>)</xsl:text>
		</span>
	</xsl:template>
	<xsl:template match="education_and_training">
		<div class="avoid-page-break">
			<h2>Education and Training</h2>
			<table width="100%">
				<col width="20%"/>
				<col width="80%"/>
				<xsl:apply-templates/>
			</table>
		</div>
	</xsl:template>
	<xsl:template match="training">
		<tr>
			<td>
				<xsl:value-of select="@date"/>
			</td>
			<td>
				<xsl:value-of select="."/>
				<xsl:text> (</xsl:text>
				<xsl:value-of select="@place"/>
				<xsl:text>) </xsl:text>
				<xsl:apply-templates select="@duration"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="@duration">
		<xsl:if test="string-length() > 0">
			<xsl:text> - </xsl:text>
			<xsl:value-of select="."/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="skills">
		<div class="avoid-page-break">
			<h2>Computer skills</h2>
			<table width="100%">
				<col width="20%"/>
				<col width="80%"/>
				<xsl:for-each select="skill">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</table>
		</div>
	</xsl:template>
	<xsl:template match="skill">
		<tr>
			<td>
				<xsl:value-of select="@name"/>
				<xsl:text>:</xsl:text>
			</td>
			<td>
				<xsl:for-each select="subskill">
					<xsl:apply-templates select="."/>
					<xsl:if test="not(position()=last())">, </xsl:if>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="subskill">
		<xsl:value-of select="."/>
	</xsl:template>
	<xsl:template match="languages">
		<div class="avoid-page-break">
			<h2>Languages</h2>
			<table>
				<xsl:for-each select="language">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</table>
		</div>
	</xsl:template>
	<xsl:template match="language">
		<tr>
			<td>
				<xsl:value-of select="."/>
				<xsl:text>:</xsl:text>
			</td>
			<td>
				<xsl:value-of select="@level"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="project_description">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="br">
		<br/>
	</xsl:template>

	<xsl:template match="ul">
		<ul>
			<xsl:apply-templates/>
		</ul>
	</xsl:template>

	<xsl:template match="li">
		<li><xsl:value-of select="."/></li>
	</xsl:template>

</xsl:stylesheet>
