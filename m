Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiscom.nl (unknown [130.78.143.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90187482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Nov 2002 03:24:43 -0700 (MST)
Message-Id: <02Nov25.113607cet.119049@ns.hiscom.nl>
From: =?iso-8859-1?Q?=22Beerse=2C_Corn=E9=22?= <c.beerse@torex-hiscom.nl>
To: "'James Smith'" <james@compusmithllc.com>,
	parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Disk problems
Date: Mon, 25 Nov 2002 11:24:34 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2946C.D9807B10"
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

------_=_NextPart_001_01C2946C.D9807B10
Content-Type: text/plain;
	charset="iso-8859-1"

> -----Original Message-----
> From: James Smith [mailto:james@compusmithllc.com]
> I just got a pile of 712/60's - $80 for 10 of em :)

I got mine (1 and a half) for free ;-)

> i've set one up & now i'm going through the disks one at a time &
> cloning them as its quicker than going through the install each time
> i've hit one disk that gives me this whenever i try to fdisk it 
> 
> sixty:~# fdisk /dev/sdb
> 
> Unable to read /dev/sdb
> 
> 
> when i tried to zero the disk, i got this....
> 
> sixty:~# dd if=/dev/zero of=/dev/sdb count=1 bs=512 
> dd: writing `/dev/sdb': Input/output error
> 1+0 records in
> 0+0 records out

So you cannot read and cannot write to it.

> 
> the console sees the disk when i use search 
> 
> does this indicate a dead disk?
> 
> the disk was ok until i put it into a mac......

What where the results on the mac? Can you clone the disks using a mac? If
so, what are the results?

My experience: the 712 I have at home was my workhorse for over 5 years. It
never failed on me. Occasional reboots for obvious reasons never had any
problems. However, after being down for a couple of weeks, the harddisk does
not spin properly. It was reported with several of those older systems. The
ioscan and other tools that only access the firmware of the drive report no
problems. Actual access of the disk is a problem since (in my case) the disk
does not spin at all.

If you can access the data storage using your mac, you might have success
after warming the device. I know the powersupply in the 712 series is
limited and might not provide enough power to start a cold disk. You might
be able to clone disks using your mac.

In an disk array, I have a couple of disks that are all the same specs.
However, due to a hardware defect in one of them, a (HP-UX) `ioscan` reports
0 bytes for that disk where others report their actual value. If you hook
the disk to an HP-UX machine, what does `ioscan` report?

Sorry to say but I think your disk is dead

Success

CBee

------_=_NextPart_001_01C2946C.D9807B10
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
<TITLE>RE: [parisc-linux] Disk problems</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>&gt; -----Original Message-----</FONT>
<BR><FONT SIZE=3D2>&gt; From: James Smith [<A =
HREF=3D"mailto:james@compusmithllc.com">mailto:james@compusmithllc.com</=
A>]</FONT>
<BR><FONT SIZE=3D2>&gt; I just got a pile of 712/60's - $80 for 10 of =
em :)</FONT>
</P>

<P><FONT SIZE=3D2>I got mine (1 and a half) for free ;-)</FONT>
</P>

<P><FONT SIZE=3D2>&gt; i've set one up &amp; now i'm going through the =
disks one at a time &amp;</FONT>
<BR><FONT SIZE=3D2>&gt; cloning them as its quicker than going through =
the install each time</FONT>
<BR><FONT SIZE=3D2>&gt; i've hit one disk that gives me this whenever i =
try to fdisk it </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; sixty:~# fdisk /dev/sdb</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Unable to read /dev/sdb</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; when i tried to zero the disk, i got =
this....</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; sixty:~# dd if=3D/dev/zero of=3D/dev/sdb =
count=3D1 bs=3D512 </FONT>
<BR><FONT SIZE=3D2>&gt; dd: writing `/dev/sdb': Input/output =
error</FONT>
<BR><FONT SIZE=3D2>&gt; 1+0 records in</FONT>
<BR><FONT SIZE=3D2>&gt; 0+0 records out</FONT>
</P>

<P><FONT SIZE=3D2>So you cannot read and cannot write to it.</FONT>
</P>

<P><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; the console sees the disk when i use search =
</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; does this indicate a dead disk?</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; the disk was ok until i put it into a =
mac......</FONT>
</P>

<P><FONT SIZE=3D2>What where the results on the mac? Can you clone the =
disks using a mac? If so, what are the results?</FONT>
</P>

<P><FONT SIZE=3D2>My experience: the 712 I have at home was my =
workhorse for over 5 years. It never failed on me. Occasional reboots =
for obvious reasons never had any problems. However, after being down =
for a couple of weeks, the harddisk does not spin properly. It was =
reported with several of those older systems. The ioscan and other =
tools that only access the firmware of the drive report no problems. =
Actual access of the disk is a problem since (in my case) the disk does =
not spin at all.</FONT></P>

<P><FONT SIZE=3D2>If you can access the data storage using your mac, =
you might have success after warming the device. I know the powersupply =
in the 712 series is limited and might not provide enough power to =
start a cold disk. You might be able to clone disks using your =
mac.</FONT></P>

<P><FONT SIZE=3D2>In an disk array, I have a couple of disks that are =
all the same specs. However, due to a hardware defect in one of them, a =
(HP-UX) `ioscan` reports 0 bytes for that disk where others report =
their actual value. If you hook the disk to an HP-UX machine, what does =
`ioscan` report?</FONT></P>

<P><FONT SIZE=3D2>Sorry to say but I think your disk is dead</FONT>
</P>

<P><FONT SIZE=3D2>Success</FONT>
</P>

<P><FONT SIZE=3D2>CBee</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2946C.D9807B10--
