Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from imo-r05.mx.aol.com (imo-r05.mx.aol.com [152.163.225.101])
	by dsl2.external.hp.com (Postfix) with ESMTP id 13AA04840
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Nov 2003 13:45:13 -0700 (MST)
Received: from JjDunnjr@aol.com
	by imo-r05.mx.aol.com (mail_out_v36_r1.1.) id n.171.26ba943e (17377)
	 for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Nov 2003 15:45:02 -0500 (EST)
From: JjDunnjr@aol.com
Message-ID: <171.26ba943e.2cefd34e@aol.com>
Date: Fri, 21 Nov 2003 15:45:02 EST
Subject: Re: [parisc-linux] Boot-up challenges on a 715/75
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="part1_171.26ba943e.2cefd34e_boundary"
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

--part1_171.26ba943e.2cefd34e_boundary
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

To all who took the time to reply, thank you
Progress to date:
1. Set jumper to 512 k sector on the TEAC.  715/75 recognized it as a 
different model.
2. It spun the disk upon issuing the "bo P2" command, however, i still got 
the
ENTRY_INIT =-4 message

I will try to do a net boot next

if that fails, I will try to copy onto the boot 715/75 hard drive the 
necessary files.  Which leads me to my next question, which files(s) would be 
necessary for the 715/75 to boot

Would "lifimage" be enough or should i place "rescue.bin", "linux.bin" and 
"drivers.gz" on the hard drive

Thanks in advance for your remarkable response.

jack dunn

--part1_171.26ba943e.2cefd34e_boundary
Content-Type: text/html; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<HTML><FONT FACE=3Darial,helvetica><FONT  SIZE=3D2 FAMILY=3D"SANSSERIF" FACE=
=3D"Arial" LANG=3D"0">To all who took the time to reply, thank you<BR>
Progress to date:<BR>
1. Set jumper to 512 k sector on the TEAC.&nbsp; 715/75 recognized it as a d=
ifferent model.<BR>
2. It spun the disk upon issuing the "bo P2" command, however, i still got t=
he<BR>
ENTRY_INIT =3D-4 message<BR>
<BR>
I will try to do a net boot next<BR>
<BR>
if that fails, I will try to copy onto the boot 715/75 hard drive the necess=
ary files.&nbsp; Which leads me to my next question, which files(s) would be=
 necessary for the 715/75 to boot<BR>
<BR>
Would "lifimage" be enough or should i place "rescue.bin", "linux.bin" and "=
drivers.gz" on the hard drive<BR>
<BR>
Thanks in advance for your remarkable response.<BR>
<BR>
jack dunn</FONT></HTML>

--part1_171.26ba943e.2cefd34e_boundary--
