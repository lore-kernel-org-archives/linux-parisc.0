Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from imo-d05.mx.aol.com (imo-d05.mx.aol.com [205.188.157.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2217A4840
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Nov 2003 14:31:45 -0700 (MST)
Received: from JjDunnjr@aol.com
	by imo-d05.mx.aol.com (mail_out_v36_r1.1.) id n.1e2.13b31f0d (4446)
	 for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Nov 2003 16:31:23 -0500 (EST)
From: JjDunnjr@aol.com
Message-ID: <1e2.13b31f0d.2cebe9ab@aol.com>
Date: Tue, 18 Nov 2003 16:31:23 EST
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="part1_1e2.13b31f0d.2cebe9ab_boundary"
Subject: [parisc-linux] Boot-up challenges on a 715/75
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

--part1_1e2.13b31f0d.2cebe9ab_boundary
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Gentlepersons:
Attempting to install Debian for HPPA on my 715/75 diskless workstation.
Setup includes: 2 2gig Seagate drives, scsi, IDs set at 5 and 6
an external TEAC  CD-R55S, scsi, ID set at 2

1. Interrupt boot process with SEC
2. Get a list of boot devices, as follows:

P0   scsi.6.0 seagate ST32550N
P1   scsi.5.0 seagate ST32171N
P2   scsi 0.0 TEAC cd-R55S

enter P2, where the Debian Official CD Binary-1 HPPA  is located
Message follows:

Failed to Initialize scsi.0.0
ENTRY_INIT status= -4
80000007  00000001  00000000  00000000  00000000  00000000  00000000  
00000000
00000000  00000000  00000000  00000000  00000000  00000000  00000000  
00000000  
00003510  000000FF  FF0003BF 84000007  800100DC  00000000  0025F000  00000400
98080000  00000000  0000D4D8  00000000  000000FF  00000002  00000004  
00000001

Occasiionally, I can get:
ENTRY_INIT status= -7

I have tried several ways to call up this CD-RW.  I have specified the scsi 
address; I have rewritten the PATHs to direct boot up.  All to no avail
It is clear that the 715/75 recognizes the TEAC but does not recognize the 
scsi Address.

any help

Thanks in advance
jack dunn






--part1_1e2.13b31f0d.2cebe9ab_boundary
Content-Type: text/html; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<HTML><FONT FACE=3Darial,helvetica><FONT  SIZE=3D2 FAMILY=3D"SANSSERIF" FACE=
=3D"Arial" LANG=3D"0">Gentlepersons:<BR>
Attempting to install Debian for HPPA on my 715/75 diskless workstation.<BR>
Setup includes: 2 2gig Seagate drives, scsi, IDs set at 5 and 6<BR>
an external TEAC&nbsp; CD-R55S, scsi, ID set at 2<BR>
<BR>
1. Interrupt boot process with SEC<BR>
2. Get a list of boot devices, as follows:<BR>
<BR>
P0&nbsp;&nbsp; scsi.6.0 seagate ST32550N<BR>
P1&nbsp;&nbsp; scsi.5.0 seagate ST32171N<BR>
P2&nbsp;&nbsp; scsi 0.0 TEAC cd-R55S<BR>
<BR>
enter P2, where the Debian Official CD Binary-1 HPPA&nbsp; is located<BR>
Message follows:<BR>
<BR>
Failed to Initialize scsi.0.0<BR>
ENTRY_INIT status=3D -4<BR>
80000007&nbsp; 00000001&nbsp; 00000000&nbsp; 00000000&nbsp; 00000000&nbsp; 0=
0000000&nbsp; 00000000&nbsp; 00000000<BR>
00000000&nbsp; 00000000&nbsp; 00000000&nbsp; 00000000&nbsp; 00000000&nbsp; 0=
0000000&nbsp; 00000000&nbsp; 00000000&nbsp; <BR>
00003510&nbsp; 000000FF&nbsp; FF0003BF 84000007&nbsp; 800100DC&nbsp; 0000000=
0&nbsp; 0025F000&nbsp; 00000400<BR>
98080000&nbsp; 00000000&nbsp; 0000D4D8&nbsp; 00000000&nbsp; 000000FF&nbsp; 0=
0000002&nbsp; 00000004&nbsp; 00000001<BR>
<BR>
Occasiionally, I can get:<BR>
ENTRY_INIT status=3D -7<BR>
<BR>
I have tried several ways to call up this CD-RW.&nbsp; I have specified the=20=
scsi address; I have rewritten the PATHs to direct boot up.&nbsp; All to no=20=
avail<BR>
It is clear that the 715/75 recognizes the TEAC but does not recognize the s=
csi Address.<BR>
<BR>
any help<BR>
<BR>
Thanks in advance<BR>
jack dunn<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
</FONT></HTML>
--part1_1e2.13b31f0d.2cebe9ab_boundary--
