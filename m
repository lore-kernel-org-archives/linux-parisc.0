Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from c014.sfo.cp.net (c014-h001.c014.sfo.cp.net [209.228.12.65])
	by dsl2.external.hp.com (Postfix) with SMTP id 68D53482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Aug 2001 07:45:09 -0600 (MDT)
Message-ID: <000001c12bda$3a018e90$701e10ac@winxp>
Reply-To: "jacobsbd" <jacobsbd@jacobs.coxatwork.com>
From: "jacobsbd" <jacobsbd@jacobs.coxatwork.com>
To: <parisc-linux@lists.parisc-linux.org>
Cc: <jacobsbd@aol.com>
Date: Thu, 23 Aug 2001 05:15:34 -0700
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C12B92.A33F9FC0"
Subject: [parisc-linux] PA-RISC linux newby needs help doing an install
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0005_01C12B92.A33F9FC0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

OK, I am sure I am overlooking some obvious things here, but it looks =
like I am stuck to the point of needing help so here goes.

I downloaded the iso and burned it with Nero on a win2k machine (the =
only burner I have easy access to)

my configurtion is hp 735/125 workstation,  209 meg ram, =20
on narrow SCSI chain I have  2 gig ST32550N (currently HP-UX), NEC 6x =
external CD-ROM drive. 4mm dds1 tape drive.
on fast wide HVD 4gig ST15150W=20

I can not seem to get the serial ports to work on this system even when =
I run HP_UX 11.00. I have tried unplugging the keyboard and the video =
card to no effect.

When I boot off of the CD-ROM i get the following (summarized and =
perhaps with some typos as I can not capture it)
note: "..." on a line by itself mean one or more skipped lines.  Let me =
know if you need to see anything that is there.


...
Hard Booted.
palo ipl 0.92 root@spqr Mon Jun 25 23:03:13 CEST 2001
0/vmlinux32 2853588 bytes @ 0x6ad6800
...
...
Command line: 'root=3D/dev/ram/ console=3Dtty0 sti=3D0 =
sti_font=3DVGA8x16 TERM=3Dlinux'
...
...
Warning: kernel name doesn't end with 32 or 64... Guessing Anoyance: =
Firmware
does not support PDC_MODELS_CAPABILITES call
32
ELF 32 executable
...
...
Loading ramdisk 1991209 bytes @ 0ce09000...
branching to kernel entry point 0x00100000

and it stays on that last line as long as I want to wait. I do not hear =
disk noises or other indications it may be doing anything.


Perhaps I need to work more on getting the serial lines to work but the =
serial lines may be a hardware problem. =20

tried with graphics card removed but did not even get the usual beep.  =
Oh, I have the graphics card with the 4 BNC on it.  Red, Green, Blue, =
and Stereo.

no problems when doing a cold install of HP-UX 11.00 so I asume the =
drives are ok.=20

I have other resources like our own LAN, and a red hat linux machine I =
can work with. but I have no ideas.=20

Thanks in advance.


PS:

if anyone needs them (but do take them just to resell) I have two EISA =
e-net cards and two EISA SCSI cards (single ended 50 pin). I also have =
about seventeen 2 gig fast wide HVD loose drives. If I can get this to =
work, I may be able to put linux installs on them and give them away  ( =
I believe can also build hp-ux on them if the recipient will take care =
of the license issues with HP)=20

All are available to anyone to use if they pay for shipping. =20




------=_NextPart_000_0005_01C12B92.A33F9FC0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2505.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>OK, I am sure I am overlooking some =
obvious things=20
here, but it looks like I am stuck to the point of needing help so here=20
goes.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I downloaded&nbsp;the iso and burned it =
with Nero=20
on a win2k machine (the only burner I have easy access to)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>my configurtion is hp 735/125 =
workstation,=20
&nbsp;209 meg ram,&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>on narrow SCSI chain I have&nbsp; 2 gig =
ST32550N=20
(currently HP-UX), NEC 6x external CD-ROM drive. 4mm dds1 tape=20
drive.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>on fast wide HVD 4gig ST15150W =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I can not seem to get the serial ports =
to work on=20
this system even when I run HP_UX 11.00. I have tried unplugging the =
keyboard=20
and the video card to no effect.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>When I boot off of the CD-ROM i get the =
following=20
(summarized and perhaps with some typos as I can not capture =
it)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>note: "..." on a line by itself mean =
one or more=20
skipped lines.&nbsp; Let me know if you need to see anything that is=20
there.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Hard Booted.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>palo ipl 0.92 <A=20
href=3D"mailto:root@spqr">root@spqr</A> Mon Jun 25 23:03:13 CEST =
2001</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>0/vmlinux32 2853588 bytes @ =
0x6ad6800</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Command line: 'root=3D/dev/ram/ =
console=3Dtty0 sti=3D0=20
sti_font=3DVGA8x16 TERM=3Dlinux'</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Warning: kernel name doesn't end with =
32 or 64...=20
Guessing Anoyance: Firmware</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>does not support PDC_MODELS_CAPABILITES =

call</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>32</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>ELF 32 executable</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Loading ramdisk 1991209 bytes @=20
0ce09000...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>branching to kernel entry point=20
0x00100000</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>and it stays on that last line as long =
as I want to=20
wait. I do not hear disk noises or other indications it may be doing=20
anything.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Perhaps I need to work more on getting =
the serial=20
lines to work but&nbsp;the serial lines&nbsp;may be a hardware =
problem.&nbsp;=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>tried with graphics card removed but =
did not even=20
get the usual beep.&nbsp; Oh, I have the graphics card with the 4 BNC on =

it.&nbsp; Red, Green, Blue, and Stereo.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>no problems when doing a =
cold&nbsp;install of HP-UX=20
11.00 so I asume the drives are ok. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have other resources like =
our&nbsp;own=20
LAN,&nbsp;and a red hat&nbsp;linux machine I can work with. but I have =
no ideas.=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks in advance.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>PS:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>if anyone needs them (but do =
take&nbsp;them=20
just&nbsp;to resell) I have two EISA e-net cards and two EISA SCSI cards =
(single=20
ended 50 pin). I also have about seventeen 2 gig fast wide HVD loose =
drives. If=20
I can get this to work, I may be able to put linux installs on them and =
give=20
them away&nbsp; ( I believe can also build hp-ux on them if the =
recipient will=20
take care of the license issues with HP) </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>All are available to anyone to use if =
they pay for=20
shipping.&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0005_01C12B92.A33F9FC0--
