Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiscom.nl (unknown [130.78.143.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id D100A482E
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Aug 2003 07:04:29 -0600 (MDT)
Message-Id: <03Aug5.152448cest.119163@ns.hiscom.nl>
From: =?iso-8859-1?Q?=22Beerse=2C_Corn=E9=22?= <c.beerse@torex-hiscom.nl>
To: "'Nahkola Mikko'" <mnahkola@trinms01.ntc.nokia.com>,
	parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Terminfo/termcap for a 70096 ...
Date: Tue, 5 Aug 2003 15:04:24 +0200 
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C35B52.17F0F8A0"
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

------_=_NextPart_001_01C35B52.17F0F8A0
Content-Type: text/plain;
	charset="iso-8859-1"

> -----Original Message-----
> From: Nahkola Mikko [mailto:mnahkola@trinms01.ntc.nokia.com]
> 
> I tried to ask this question in the comp.sys.hp.hpux newsgroup once but 
> didn't get any useful answers... anyone here know better?

The /etc/termcap file on a RedHat 7.3 machine does contain a bunch of HP
terminals, including 700 series like 700 44 and 700 92. I think the latter
one will suit your needs. There are even more. As far as I know, it all ends
in hpterm, the hp-terminal emulator (xterm equivalent) for X11 (vue) with
similar capabilities as the 700 series terminals.

Unfortunatly, while installing DebianWoody on a D370, I found none of them
in the terminfo database (and no termcap file). And the HP700/96 came with
the D370. I know one thing to do after finalizing the install....

> 
> (yes, I know, this is probably specifically _not_ a problem on 
> parisc-linux as all the parisc stuff is supposed to have a HP-UX license 
> in the first place, for some version of HP-UX.)
> 
> Is it legal to copy terminfo and termcap entries (from HP-UX in this 
> case)?

I don't think it is illegal to tune any system to use HP hardware with a
published interface and I think the manual of the terminal clearly publishes
the codes as used in the termcap or terminfo files.

> 
> The problem is that HP-UX is pretty much the only thing that comes with a 
> terminfo entry for a 70096, and we have a bunch of those that  could be 
> useful on other systems too ... except that the scrollback doesn't work 
> in the emulation modes. 

Some settings of $TERM that come to mind include 'hpterm', 'hp700',
'hp70092'. I recal I've used them between HP-UX and Solaris machines, hence
Solaris also might have suitable termcap or terminfo entries.

> 
> It would therefore be better to be able to run in native mode, but this 
> pretty much _requires_ the terminfo/termcap entry ... 
> 
> Oh, and about the cursor keys on the 70096, if I were to put 
> them in the 
> "application" mode, would that help with bash et al.? They seem to be 
> working in swinstall and such on HP-UX ... but the default 
> mode seems to 
> be non-transmitting, right? (yes, I could use that too myself, and 
> re-enter stuff from the buffer with the print/enter key and do the 
> line-modify thing... but the others have a hard time learning that.)

don't know, just put the terminal in em220 (vt220 emulation) mode to install
debian.





CBee

------_=_NextPart_001_01C35B52.17F0F8A0
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
<TITLE>RE: [parisc-linux] Terminfo/termcap for a 70096 ...</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>&gt; -----Original Message-----</FONT>
<BR><FONT SIZE=3D2>&gt; From: Nahkola Mikko [<A =
HREF=3D"mailto:mnahkola@trinms01.ntc.nokia.com">mailto:mnahkola@trinms01=
.ntc.nokia.com</A>]</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; I tried to ask this question in the =
comp.sys.hp.hpux newsgroup once but </FONT>
<BR><FONT SIZE=3D2>&gt; didn't get any useful answers... anyone here =
know better?</FONT>
</P>

<P><FONT SIZE=3D2>The /etc/termcap file on a RedHat 7.3 machine does =
contain a bunch of HP terminals, including 700 series like 700 44 and =
700 92. I think the latter one will suit your needs. There are even =
more. As far as I know, it all ends in hpterm, the hp-terminal emulator =
(xterm equivalent) for X11 (vue) with similar capabilities as the 700 =
series terminals.</FONT></P>

<P><FONT SIZE=3D2>Unfortunatly, while installing DebianWoody on a D370, =
I found none of them in the terminfo database (and no termcap file). =
And the HP700/96 came with the D370. I know one thing to do after =
finalizing the install....</FONT></P>

<P><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; (yes, I know, this is probably specifically =
_not_ a problem on </FONT>
<BR><FONT SIZE=3D2>&gt; parisc-linux as all the parisc stuff is =
supposed to have a HP-UX license </FONT>
<BR><FONT SIZE=3D2>&gt; in the first place, for some version of =
HP-UX.)</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Is it legal to copy terminfo and termcap =
entries (from HP-UX in this </FONT>
<BR><FONT SIZE=3D2>&gt; case)?</FONT>
</P>

<P><FONT SIZE=3D2>I don't think it is illegal to tune any system to use =
HP hardware with a published interface and I think the manual of the =
terminal clearly publishes the codes as used in the termcap or terminfo =
files.</FONT></P>

<P><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; The problem is that HP-UX is pretty much the =
only thing that comes with a </FONT>
<BR><FONT SIZE=3D2>&gt; terminfo entry for a 70096, and we have a bunch =
of those that&nbsp; could be </FONT>
<BR><FONT SIZE=3D2>&gt; useful on other systems too ... except that the =
scrollback doesn't work </FONT>
<BR><FONT SIZE=3D2>&gt; in the emulation modes. </FONT>
</P>

<P><FONT SIZE=3D2>Some settings of $TERM that come to mind include =
'hpterm', 'hp700', 'hp70092'. I recal I've used them between HP-UX and =
Solaris machines, hence Solaris also might have suitable termcap or =
terminfo entries.</FONT></P>

<P><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; It would therefore be better to be able to run =
in native mode, but this </FONT>
<BR><FONT SIZE=3D2>&gt; pretty much _requires_ the terminfo/termcap =
entry ... </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Oh, and about the cursor keys on the 70096, if =
I were to put </FONT>
<BR><FONT SIZE=3D2>&gt; them in the </FONT>
<BR><FONT SIZE=3D2>&gt; &quot;application&quot; mode, would that help =
with bash et al.? They seem to be </FONT>
<BR><FONT SIZE=3D2>&gt; working in swinstall and such on HP-UX ... but =
the default </FONT>
<BR><FONT SIZE=3D2>&gt; mode seems to </FONT>
<BR><FONT SIZE=3D2>&gt; be non-transmitting, right? (yes, I could use =
that too myself, and </FONT>
<BR><FONT SIZE=3D2>&gt; re-enter stuff from the buffer with the =
print/enter key and do the </FONT>
<BR><FONT SIZE=3D2>&gt; line-modify thing... but the others have a hard =
time learning that.)</FONT>
</P>

<P><FONT SIZE=3D2>don't know, just put the terminal in em220 (vt220 =
emulation) mode to install debian.</FONT>
</P>
<BR>
<BR>
<BR>
<BR>

<P><FONT SIZE=3D2>CBee</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C35B52.17F0F8A0--
