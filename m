From: Guy Martin <gmsoft@gentoo.org>
Subject: [parisc-linux] IDE cdrom crash when trying to mount it on C3600/B2K
Date: Fri, 29 Apr 2005 20:15:03 +0200
Message-ID: <20050429201503.35d767d3.gmsoft@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1461017967=="
To: parisc-linux@lists.parisc-linux.org
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

--===============1461017967==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1";
	boundary="Signature=_Fri__29_Apr_2005_20_15_03_+0200_acdA=M1vQRUJtqo_"

--Signature=_Fri__29_Apr_2005_20_15_03_+0200_acdA=M1vQRUJtqo_
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Hello guys,


I have experienced a really bad bug when trying to create a installation
cd for gentoo. When I try to mount a ide cd I only have this :


hope root # mount /dev/hda /mnt/cdrom/
Kernel panic - not syncing: Kernel Fault


There is no stack trace or anything else.

It only happends when trying to read on the cd. Reading the cdrom
parameters works fine. This is of course with DMA disabled.
Trying to read a single block with dd also crash the box.

I'm not the only one who experienced this. I have reports from several
people with several kernels from 2.6.10-pa11 to the latest one. I don't
know about the older kernels.

I don't have the skills to fix this. I would be really happy if someone
could have a look at this since ide cdrom support is kinda required for
install cdrom :)

If you need more info, I'd be glad to provide it.


TIA

-- 
Guy Martin
Gentoo Linux - HPPA port Lead / IPv6 team


--Signature=_Fri__29_Apr_2005_20_15_03_+0200_acdA=M1vQRUJtqo_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCcnmqrpShrnoH4YYRAiMcAJ9LnIEsWHfCioZ95VnedE5EuCM2AgCfaBXb
5XcIY9pZ4RbZqe9ngf62n/I=
=67Fl
-----END PGP SIGNATURE-----

--Signature=_Fri__29_Apr_2005_20_15_03_+0200_acdA=M1vQRUJtqo_--

--===============1461017967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1461017967==--
