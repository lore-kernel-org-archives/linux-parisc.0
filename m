Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiscom.nl (unknown [130.78.143.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 88B7C482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Sep 2002 08:02:41 -0600 (MDT)
Message-Id: <02Sep25.161413cest.119074@ns.hiscom.nl>
From: =?iso-8859-1?Q?=22Beerse=2C_Corn=E9=22?= <c.beerse@torex-hiscom.nl>
To: "'Stephen J de Vries'" <paulhill20@juno.com>,
	parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] hardware newbie question...
Date: Wed, 25 Sep 2002 16:02:31 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2649C.30D8B720"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2649C.30D8B720
Content-Type: text/plain;
	charset="iso-8859-1"

> -----Original Message-----
> From: Stephen J de Vries [mailto:paulhill20@juno.com]
> I have a HP 712 that I'd purchased recently.
> 
> 
> Can I use a PC monitor, keyboard, and mouse to boot the thing 
> up?  If so,
> does the monitor have to be a multisync or something special?

I've had a 712 (running HP-UX 10.20) with a multisync monitor (compaq,
before the merger) running verry well.

As I recal, the monitor should do a sync-on-green. If you don't get a proper
picture and have a monitor-cable connection with bnc connectors, try putting
the cable-sync on the monitor-green. This should give a sharp (bad collored)
picture.

For the mouse, the HP mouse that came with the device looks verry much like
a logitech mouse with a black logitech icon. 2 exceptions: the labels differ
and the logitech has a shorter cable. The same logitech with a colored icon
on top does not work. The mouse must be a native ps/2 mouse, not one that
can do serial-mousing too.

For the keyboard: try and see what you get. No experiences with alternates
here. As with the mouse, the keyboard must be native ps/2 since it does not
get any initialize command. An easy test here is that if the bootloader
finds a keyboard, it wil use that keyboard and the video-card for
bootconsole. If the keyboard is not found, the serial-port (9600-8-N) is
used for console.

> 
> In addition, HP-UX is on the hard drive but is locked down.  I was
> thinking of buying an external CD drive and attempting to load debian
> 0.93.  Can anyone recommend a place to buy the CD drive that they have

Any scsi cd-rom that can do a 2K blocksize will do for booting. After boot,
there is no difference. HP-s are relabeled Toshiba's. 

> dealt with?  I also have a network so I could attempt a 
> network install
> but I am not sure what minimum requirements I'd need to 
> fulfill for that.
>  Is my approach the right one?

It's one right one, out of manny...


CBee

------_=_NextPart_001_01C2649C.30D8B720
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2654.45">
<TITLE>RE: [parisc-linux] hardware newbie question...</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>&gt; -----Original Message-----</FONT>
<BR><FONT SIZE=3D2>&gt; From: Stephen J de Vries [<A =
HREF=3D"mailto:paulhill20@juno.com">mailto:paulhill20@juno.com</A>]</FON=
T>
<BR><FONT SIZE=3D2>&gt; I have a HP 712 that I'd purchased =
recently.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Can I use a PC monitor, keyboard, and mouse to =
boot the thing </FONT>
<BR><FONT SIZE=3D2>&gt; up?&nbsp; If so,</FONT>
<BR><FONT SIZE=3D2>&gt; does the monitor have to be a multisync or =
something special?</FONT>
</P>

<P><FONT SIZE=3D2>I've had a 712 (running HP-UX 10.20) with a multisync =
monitor (compaq, before the merger) running verry well.</FONT>
</P>

<P><FONT SIZE=3D2>As I recal, the monitor should do a sync-on-green. If =
you don't get a proper picture and have a monitor-cable connection with =
bnc connectors, try putting the cable-sync on the monitor-green. This =
should give a sharp (bad collored) picture.</FONT></P>

<P><FONT SIZE=3D2>For the mouse, the HP mouse that came with the device =
looks verry much like a logitech mouse with a black logitech icon. 2 =
exceptions: the labels differ and the logitech has a shorter cable. The =
same logitech with a colored icon on top does not work. The mouse must =
be a native ps/2 mouse, not one that can do serial-mousing =
too.</FONT></P>

<P><FONT SIZE=3D2>For the keyboard: try and see what you get. No =
experiences with alternates here. As with the mouse, the keyboard must =
be native ps/2 since it does not get any initialize command. An easy =
test here is that if the bootloader finds a keyboard, it wil use that =
keyboard and the video-card for bootconsole. If the keyboard is not =
found, the serial-port (9600-8-N) is used for console.</FONT></P>

<P><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; In addition, HP-UX is on the hard drive but is =
locked down.&nbsp; I was</FONT>
<BR><FONT SIZE=3D2>&gt; thinking of buying an external CD drive and =
attempting to load debian</FONT>
<BR><FONT SIZE=3D2>&gt; 0.93.&nbsp; Can anyone recommend a place to buy =
the CD drive that they have</FONT>
</P>

<P><FONT SIZE=3D2>Any scsi cd-rom that can do a 2K blocksize will do =
for booting. After boot, there is no difference. HP-s are relabeled =
Toshiba's. </FONT></P>

<P><FONT SIZE=3D2>&gt; dealt with?&nbsp; I also have a network so I =
could attempt a </FONT>
<BR><FONT SIZE=3D2>&gt; network install</FONT>
<BR><FONT SIZE=3D2>&gt; but I am not sure what minimum requirements I'd =
need to </FONT>
<BR><FONT SIZE=3D2>&gt; fulfill for that.</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp; Is my approach the right one?</FONT>
</P>

<P><FONT SIZE=3D2>It's one right one, out of manny...</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>CBee</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2649C.30D8B720--
