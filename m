From: "Craig D. Lansing" <clansing@charter.net>
Subject: [parisc-linux] J2240 mouse
Date: Sun, 22 Jan 2006 16:26:57 -0500
Message-ID: <001601c61f9a$9314db00$3301a8c0@POGO>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0127094609=="
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

--===============0127094609==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0017_01C61F70.AA3ED300"

This is a multi-part message in MIME format.

------=_NextPart_000_0017_01C61F70.AA3ED300
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

 

I'm almost there with X from the console.  Gnome "looks" good.  I finally
got the video settings where I want them, I just can't seem to get the mouse
to work.  I've tried almost every option via `dpkg-reconfigure
xserver-xfree86`, but no luck.  I rebooted into HP-UX and the mouse does
work there, so it isn't a hardware problem.  HP-UX sees the mouse as "8/12/7
Built-in Keyboard/Mouse ps2 ".  Hopefully some of the information below will
show the error of my ways.  Any help would be greatly appreciated!!!!

 

 

 

 

/etc/X11/XF86Config-4:

Section "InputDevice"

        Identifier      "Configured Mouse"

        Driver          "mouse"

        Option          "CorePointer"

        Option          "Device"                "/dev/psaux"

        Option          "Protocol"              "PS/2"

        Option          "Emulate3Buttons"       "true"

        Option          "ZAxisMapping"          "4 5"

EndSection

 

ll /dev/psaux

crw-rw----  1 root root 10, 1 Jan 22 15:30 /dev/psaux

 

 

End of XFree86.0.log

 

(II) Keyboard "Generic Keyboard" handled by legacy driver

(**) Option "Protocol" "PS/2"

(**) Configured Mouse: Protocol: "PS/2"

(**) Option "CorePointer"

(**) Configured Mouse: Core Pointer

(**) Option "Device" "/dev/psaux"

(**) Option "Emulate3Buttons" "true"

(**) Configured Mouse: Emulate3Buttons, Emulate3Timeout: 50

(**) Option "ZAxisMapping" "4 5"

(**) Configured Mouse: ZAxisMapping: buttons 4 and 5

(**) Configured Mouse: Buttons: 5

(II) XINPUT: Adding extended input device "Configured Mouse" (type: MOUSE)

(II) Configured Mouse: ps2EnableDataReporting: succeeded

Could not init font path element unix/:7100, removing from list!

AUDIT: Sun Jan 22 16:09:07 2006: 3943 X: client 4 rejected from local host

 

 

howlin:/boot# grep -i mouse config-2.6.8-2-32-smp

CONFIG_INPUT_MOUSEDEV=y

CONFIG_INPUT_MOUSEDEV_PSAUX=y

CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024

CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768

CONFIG_INPUT_MOUSEDEV_PSAUX_ENABLE=y

CONFIG_INPUT_MOUSE=y

CONFIG_MOUSE_PS2=m

CONFIG_MOUSE_SERIAL=m

CONFIG_MOUSE_INPORT=m

# CONFIG_MOUSE_ATIXL is not set

CONFIG_MOUSE_LOGIBM=m

CONFIG_MOUSE_PC110PAD=m

CONFIG_MOUSE_VSXXXAA=m

CONFIG_MOUSE_HIL=m

CONFIG_USB_MOUSE=m

 

 


------=_NextPart_000_0017_01C61F70.AA3ED300
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
	{font-family:r_ansi;
	panose-1:2 11 6 9 2 2 2 2 2 4;}
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
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>I&#8217;m almost there with X from the console.&nbsp; =
Gnome &#8220;looks&#8221;
good.&nbsp; I finally got the video settings where I want them, I just =
can&#8217;t
seem to get the mouse to work.&nbsp; I&#8217;ve tried almost every =
option via `dpkg-reconfigure
xserver-xfree86`, but no luck.&nbsp; I rebooted into HP-UX and the mouse =
does
work there, so it isn&#8217;t a hardware problem.&nbsp; HP-UX sees the =
mouse as
&#8220;8/12/7 Built-in Keyboard/Mouse ps2 &#8220;.&nbsp; Hopefully some =
of the
information below will show the error of my ways.&nbsp; Any help would =
be
greatly appreciated!!!!<o:p></o:p></span></font></p>

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
font-family:Arial'>/etc/X11/XF86Config-4:<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>Section =
&quot;InputDevice&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
Identifier&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Configured =
Mouse&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
Driver&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&quot;mouse&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
Option&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&quot;CorePointer&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
Option&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&quot;Device&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&quot;/dev/psaux&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
Option&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&quot;Protocol&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;
&quot;PS/2&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
Option&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&quot;Emulate3Buttons&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&quot;true&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
Option&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&quot;ZAxisMapping&quot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
&quot;4 5&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>EndSection<o:p></o:p></span=
></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>ll /dev/psaux<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"r_ansi"><span =
style=3D'font-size:10.0pt;
font-family:r_ansi'>crw-rw----&nbsp; 1 root root 10, 1 Jan 22 15:30 =
/dev/psaux</span></font><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>End of XFree86.0.log<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>(II) Keyboard =
&quot;Generic
Keyboard&quot; handled by legacy driver<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>(**) Option =
&quot;Protocol&quot;
&quot;PS/2&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>(**) Configured Mouse: =
Protocol:
&quot;PS/2&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>(**) Option =
&quot;CorePointer&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>(**) Configured Mouse: =
Core Pointer<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>(**) Option =
&quot;Device&quot;
&quot;/dev/psaux&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>(**) Option
&quot;Emulate3Buttons&quot; =
&quot;true&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>(**) Configured Mouse:
Emulate3Buttons, Emulate3Timeout: 50<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>(**) Option
&quot;ZAxisMapping&quot; &quot;4 5&quot;<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>(**) Configured Mouse:
ZAxisMapping: buttons 4 and 5<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>(**) Configured Mouse: =
Buttons: 5<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>(II) XINPUT: Adding =
extended input
device &quot;Configured Mouse&quot; (type: =
MOUSE)<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>(II) Configured Mouse:
ps2EnableDataReporting: succeeded<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>Could not init font path =
element
unix/:7100, removing from list!<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"r_ansi"><span =
style=3D'font-size:10.0pt;
font-family:r_ansi'>AUDIT: Sun Jan 22 16:09:07 2006: 3943 X: client 4 =
rejected
from local host</span></font><font size=3D2 face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>howlin:/boot# grep -i =
mouse
config-2.6.8-2-32-smp<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>CONFIG_INPUT_MOUSEDEV=3Dy<o=
:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>CONFIG_INPUT_MOUSEDEV_PSAUX=
=3Dy<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>CONFIG_INPUT_MOUSEDEV_SCREE=
N_X=3D1024<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>CONFIG_INPUT_MOUSEDEV_SCREE=
N_Y=3D768<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>CONFIG_INPUT_MOUSEDEV_PSAUX=
_ENABLE=3Dy<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>CONFIG_INPUT_MOUSE=3Dy<o:p>=
</o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>CONFIG_MOUSE_PS2=3Dm<o:p></=
o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>CONFIG_MOUSE_SERIAL=3Dm<o:p=
></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>CONFIG_MOUSE_INPORT=3Dm<o:p=
></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'># CONFIG_MOUSE_ATIXL is =
not set<o:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>CONFIG_MOUSE_LOGIBM=3Dm<o:p=
></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>CONFIG_MOUSE_PC110PAD=3Dm<o=
:p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>CONFIG_MOUSE_VSXXXAA=3Dm<o:=
p></o:p></span></font></p>

<p class=3DMsoNormal style=3D'text-autospace:none'><font size=3D2 =
face=3D"r_ansi"><span
style=3D'font-size:10.0pt;font-family:r_ansi'>CONFIG_MOUSE_HIL=3Dm<o:p></=
o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"r_ansi"><span =
style=3D'font-size:10.0pt;
font-family:r_ansi'>CONFIG_USB_MOUSE=3Dm</span></font><font size=3D2 =
face=3DArial><span
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0017_01C61F70.AA3ED300--


--===============0127094609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0127094609==--
