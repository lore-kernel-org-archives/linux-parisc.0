Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2EEEE482B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Nov 2001 06:55:33 -0700 (MST)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 1616hN-0002DO-00
	for parisc-linux@lists.parisc-linux.org; Tue, 06 Nov 2001 15:55:29 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 1616gQ-0001EH-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 06 Nov 2001 15:54:30 +0200
Date: Tue, 6 Nov 2001 15:54:28 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: hppa binutils/glibc updates
Message-ID: <20011106155428.A4719@dogbert.localdomain>
References: <20011105024952.C4441@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.21.0111050136140.2956-100000@spawn.hockeyfiend.com> <20011105214227.M505@tausq.org> <20011106101650.A29917@dogbert.localdomain> <20011106152317.A4530@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
In-Reply-To: <20011106152317.A4530@dogbert.localdomain>
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

--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I've managed to battle with apt a bit more. Some more stuff is now
installed. I broke screen though. Some nfs thing.

Anyway, next mini-hurdle:

init-2.05# apt-get update
Get:1 http://ftp.leg.uct.ac.za testing/main Packages [1139kB]
Get:Illegal instruction

dmesg output:

!!die_if_kernel: apt-get(3956): Privileged register - shouldn't happen! 11

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001111
r0-3     00000000 401e43fc 401845ff 00045990
r4-7     401e5bfc faf00d10 faf00b90 0000000a
r8-11    0004d1b0 faf00948 0004d1d8 faf00ba8
r12-15   00000000 faf00b98 000c5210 00000000
r16-19   00000000 00000000 10348000 00045220
r20-23   00000002 401cec20 401845b0 00000000
r24-27   00000020 00045998 faf00d90 00040220
r28-31   faf00d10 00000005 faf00e00 00026f03
sr0-3    00000000 0000004c 00000000 0000004c
sr4-7    0000004c 0000004c 0000004c 0000004c

IASQ: 0000004c 0000004c IAOQ: 401cec23 401cec27
 IIR: 00040948    ISR: 0000004c  IOR: 00000000
 CPU:        0   CR30: 15bb0000 CR31: 10350000
 ORIG_R28: 00000001

Clearly it does happen. Mehehe. :-)

Should I decode this? I think I'll find instructions in the list
archive? Search for "decode"?

That's about it for now. Keep on rollin'! :-)

Regards,

Albert

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE75+uUDg+hOeRZtkMRAulkAJ9P9dK5hxecKRFjBrpNLwwaHXxcFwCeLNqF
fzpH+hphy9zByOKJWo/m+tM=
=xMgG
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
