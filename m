Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiscom.nl (unknown [130.78.143.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 61943482E
	for <parisc-linux@parisc-linux.org>; Tue,  5 Aug 2003 04:49:58 -0600 (MDT)
Message-Id: <03Aug5.131008cest.119165@ns.hiscom.nl>
From: "Beerse, Corne" <c.beerse@torex-hiscom.nl>
To: "'maillist parisc-linux'" <parisc-linux@parisc-linux.org>,
	"'maillist HP-UX-admin'" <hpux-admin@DutchWorks.nl>
Subject: Summary: [HPADM][parisc-linux] testing HP-PA risc hardware
Date: Tue, 5 Aug 2003 12:49:45 +0200 
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C35B3F.48453BF0"
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

------_=_NextPart_001_01C35B3F.48453BF0
Content-Type: text/plain

I got several nice answers from both the HPAdmin and the PARisc-Linux lists.

The answer from Bill Hassell noted that is was most likely not a memory
problem, but a CPU problem. Since there are 2 of them inside the box, I
expect no problems with a single processor linux. I will be verry carefull
on installing smp linux...

Most of them pointed me to ODE (Offline Diagnostics Environement) on the
"Support Plus" cd that came with HP-UX.

The recipy on HP-UX machines:
- Boot from the CDRom
- Interact wit IPL: YES
- (set/read the current itme with CLKUTIL)
- ODE, then, at the ODE prompt:
  - ls for a list of tests and options
  - menu promisses to be a nice one
Unfortunatly, all is protected with a password and the password I got from
one of you did not match the distribution I have here ("HPUX 11.0, march
2001")

Meanwhile, I'm installing Debian linux on the box, without any hardware
bumps. In the HP-70096 terminal menu, I found the way to have it emulate
VT100 (called "EM100") (starting at the <user-system> button, left to <F5>).

Thanks.


Origional message:

Here I have an HP D370 machine that (during my holidays) crashed. Since the
machine was replaced since long and only kept running for fast access to old
stuff, not a real problem.

At first, we suspected the boot disk since its led keeps buring. However,
booting HP-UX from CDRom for a new fresh install, the boot of the kernel
crashes at roughly the same point, even with all disks removed. Hence we
suspected the core memory. However, changing or replacing the memory does
not change anything in the behavoure.

Is there a way to somehow test the hardware of a PA-Risc machine? Either
from HP or from the linux world? 

Kind of like the test tools as found on the (intel-) linux distributions? 

btw: I can get debian-woody booted up to the message that if this is the
last message on screen, check the faq. A second terminal (HP 700/96) on tty1
shows a lot of (vt100?) junk. How can I either put the HP700/96 terminal in
VT100 mode or whats the magic name of this terminal in the 'TERM=...' kernel
parameter?




CBee 


mailto:c.beerse@torex-hiscom.nl

------_=_NextPart_001_01C35B3F.48453BF0
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2654.45">
<TITLE>Summary: [HPADM][parisc-linux] testing HP-PA risc =
hardware</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>I got several nice answers from both the HPAdmin and =
the PARisc-Linux lists.</FONT>
</P>

<P><FONT SIZE=3D2>The answer from Bill Hassell noted that is was most =
likely not a memory problem, but a CPU problem. Since there are 2 of =
them inside the box, I expect no problems with a single processor =
linux. I will be verry carefull on installing smp linux...</FONT></P>

<P><FONT SIZE=3D2>Most of them pointed me to ODE (Offline Diagnostics =
Environement) on the &quot;Support Plus&quot; cd that came with =
HP-UX.</FONT>
</P>

<P><FONT SIZE=3D2>The recipy on HP-UX machines:</FONT>
<BR><FONT SIZE=3D2>- Boot from the CDRom</FONT>
<BR><FONT SIZE=3D2>- Interact wit IPL: YES</FONT>
<BR><FONT SIZE=3D2>- (set/read the current itme with CLKUTIL)</FONT>
<BR><FONT SIZE=3D2>- ODE, then, at the ODE prompt:</FONT>
<BR><FONT SIZE=3D2>&nbsp; - ls for a list of tests and options</FONT>
<BR><FONT SIZE=3D2>&nbsp; - menu promisses to be a nice one</FONT>
<BR><FONT SIZE=3D2>Unfortunatly, all is protected with a password and =
the password I got from one of you did not match the distribution I =
have here (&quot;HPUX 11.0, march 2001&quot;)</FONT></P>

<P><FONT SIZE=3D2>Meanwhile, I'm installing Debian linux on the box, =
without any hardware bumps. In the HP-70096 terminal menu, I found the =
way to have it emulate VT100 (called &quot;EM100&quot;) (starting at =
the &lt;user-system&gt; button, left to &lt;F5&gt;).</FONT></P>

<P><FONT SIZE=3D2>Thanks.</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Origional message:</FONT>
</P>

<P><FONT SIZE=3D2>Here I have an HP D370 machine that (during my =
holidays) crashed. Since the machine was replaced since long and only =
kept running for fast access to old stuff, not a real =
problem.</FONT></P>

<P><FONT SIZE=3D2>At first, we suspected the boot disk since its led =
keeps buring. However, booting HP-UX from CDRom for a new fresh =
install, the boot of the kernel crashes at roughly the same point, even =
with all disks removed. Hence we suspected the core memory. However, =
changing or replacing the memory does not change anything in the =
behavoure.</FONT></P>

<P><FONT SIZE=3D2>Is there a way to somehow test the hardware of a =
PA-Risc machine? Either from HP or from the linux world? </FONT>
</P>

<P><FONT SIZE=3D2>Kind of like the test tools as found on the (intel-) =
linux distributions? </FONT>
</P>

<P><FONT SIZE=3D2>btw: I can get debian-woody booted up to the message =
that if this is the last message on screen, check the faq. A second =
terminal (HP 700/96) on tty1 shows a lot of (vt100?) junk. How can I =
either put the HP700/96 terminal in VT100 mode or whats the magic name =
of this terminal in the 'TERM=3D...' kernel parameter?</FONT></P>
<BR>
<BR>
<BR>

<P><FONT SIZE=3D2>CBee </FONT>
</P>
<BR>

<P><FONT SIZE=3D2><A =
HREF=3D"mailto:c.beerse@torex-hiscom.nl">mailto:c.beerse@torex-hiscom.nl=
</A></FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C35B3F.48453BF0--
