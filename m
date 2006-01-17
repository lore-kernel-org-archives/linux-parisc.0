From: "Craig D. Lansing" <clansing@charter.net>
Subject: [parisc-linux] J2240 Update
Date: Mon, 16 Jan 2006 21:56:23 -0500
Message-ID: <001001c61b11$9a3004b0$3301a8c0@POGO>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1631003007=="
To: <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.

--===============1631003007==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0011_01C61AE7.B159FCB0"

This is a multi-part message in MIME format.

------=_NextPart_000_0011_01C61AE7.B159FCB0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

In case anyone is interested I have been gradually setting up my environment
on the J2240 to match my i386 Red Hat 9 environment just to see how
compatible they really are.

Here's how things have worked out so far.

 

telnet: successful

 

ssh: successful

 

wu-ftp: successful.  Both anonymous and "real" ftp work.  Upload to J2240
works.  Some timeouts using Reflection FTP and DOS FTP. may have been
related to Norton Internet Security bug.  FTP via IE (i.e.
ftp://192.168.1.52 <ftp://192.168.1.52/> ) works.

 

Apache 2.0: successful.  Straight HTML, perl CGI (inc. postgresql), and php4
(inc. postgresql)

 

postgresql: successful.  Also upgraded to 8.1.2 via source and it works.
Had to use -without-readline and -without-zlib.  Also had to link
/var/run/postgresql/.s.PGSQL.5432 --> /tmp/.s.PGSQL.5432

 

perl: successful.  Command line and Apache2 CGI scripts work.  Had to
manually install Getopt::Mixed.pm because make failed.  Postgresql 8.1.2
access works.  Seems to be much slower than PIII/600 RH 9.0.  Killed test
script after 12 hours.  This script runs in 4 hours on PIII/600 RH 9.0 and
ActiveState perl under DOS.

 

php4: successful.  Command line and Apache2 work.  Postgresql 8.1.2 access
works.

 

ToDo:

X/XDMCP:  gdm runs, but desktop is really large (unusable) on the HP p1120
monitor.  Also mouse is not recognized. it does work with the HP-UX boot /
CDE.  Once I got telnet working I didn't spend much time on this.

xinetd (is this OK to use w/ Debian? i.e. with packages update xinetd
scripts or only inet?)

mysql

php5 (am I asking for trouble here?)

 

 

 

 

 

 

 

 


------=_NextPart_000_0011_01C61AE7.B159FCB0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>In case anyone is interested I have been gradually =
setting
up my environment on the J2240 to match my i386 Red Hat 9 environment =
just to
see how compatible they really are.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Here&#8217;s how things have worked out so =
far&#8230;<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>telnet: successful<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>ssh: successful<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>wu-ftp: successful.&nbsp; Both anonymous and =
&#8220;real&#8221;
ftp work.&nbsp; Upload to J2240 works.&nbsp; Some timeouts using =
Reflection FTP
and DOS FTP&#8230; may have been related to Norton Internet Security =
bug.&nbsp;
FTP via IE (i.e. <a href=3D"ftp://192.168.1.52/">ftp://192.168.1.52</a>) =
works.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Apache 2.0: successful.&nbsp; Straight HTML, perl CGI =
(inc.
postgresql), and php4 (inc. postgresql)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>postgresql: successful.&nbsp; Also upgraded to 8.1.2 =
via
source and it works.&nbsp; Had to use &#8211;without-readline and =
&#8211;without-zlib.&nbsp;
Also had to link /var/run/postgresql/.s.PGSQL.5432 </span></font><font =
size=3D2
face=3DWingdings><span =
style=3D'font-size:10.0pt;font-family:Wingdings'>&agrave;</span></font><f=
ont
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'>
/tmp/.s.PGSQL.5432<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>perl: successful.&nbsp; Command line and Apache2 CGI =
scripts
work.&nbsp; Had to manually install Getopt::Mixed.pm because make =
failed.&nbsp;
Postgresql 8.1.2 access works.&nbsp; Seems to be much slower than =
PIII/600 RH
9.0.&nbsp; Killed test script after 12 hours.&nbsp; This script runs in =
4 hours
on PIII/600 RH 9.0 and ActiveState perl under =
DOS.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>php4: successful.&nbsp; Command line and Apache2 =
work.&nbsp;
Postgresql 8.1.2 access works.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>ToDo:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>X/XDMCP:&nbsp; gdm runs, but desktop is really large
(unusable) on the HP p1120 monitor.&nbsp; Also mouse is not =
recognized&#8230;
it does work with the HP-UX boot / CDE.&nbsp; Once I got telnet working =
I didn&#8217;t
spend much time on this.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>xinetd (is this OK to use w/ Debian? i.e. with =
packages
update xinetd scripts or only inet?)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>mysql<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>php5 (am I asking for trouble =
here?)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0011_01C61AE7.B159FCB0--


--===============1631003007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1631003007==--
