Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout06.sul.t-online.com (mailout06.sul.t-online.com [194.25.134.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id 032E0482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 May 2002 23:42:14 -0600 (MDT)
From: Alexander Gabert <pappy@nikita.ath.cx>
Date: Tue, 7 May 2002 07:42:01 +0200
To: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Subject: [pappy: Re: [parisc-linux] grsecurity patch 2.4.18]
Message-ID: <20020507054201.GA10597@nikita.ath.cx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
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

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

basically, what we are trying to do is getting either lids or grsec to
work with a 2418-hppa kernel.

the first steps were with "normal" lids, which bombed at early stage
(shortly after init mounted the rootfs, even with security=3D0)

then i tried to make grsecurity patch fit the hppa kernel (but without
deeper knowledge about the differences between i386 stacks and hppa
stack layout i cannot make any code redesign in the stack protector and
the like), the grsec patch did not even build, so i assume, i made a
little mistake somewhere or the patch is not "proposed" to build
platform-independent.
i guess, i will have to look through parisc mem mgmt and proc arch
documentation before i can continue to make the patch fit

current situation:
with some minor changes 2418-hppa-lsm-lids compiles clean, boots, but
the "modprobe lids" in the box gives the following:
drehmoos:/lib/modules/2.4.18-lsm/kernel/security/lids# modprobe lids

=2E.. dmesg output ...

break 0,0: pid=3D236 command=3D'modprobe'
modprobe (pid 236): Breakpoint (code 0)
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
    =20
PSW: 00000000000001101111010100001111 Not tainted
r00-03  00000000 00044810 0003b8d0 0003a000
r04-07  1b360000 401f51e8 ffffffea 401eb008
r08-11  00000004 00000060 00000004 1b360000
r12-15  1b361000 1bb048a0 1b538550 00000003
r16-19  000444fc 00044cfc 00000000 00000040
r20-23  0000000f 01000000 0003b8bc 00000000
r24-27  00000000 00000000 000449b8 102b6010
r28-31  00000000 000006c0 1b538680 10117e6c
sr0-3   00000000 00000000 00000000 00000346
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 00034200 00034204
 IIR: 00000000    ISR: 00000000  IOR: 00000000
  CPU:        0   CR30: 1b538000 CR31: 10330000
   ORIG_R28: 102c6810

=2E...=20


after logging in via ssh and just trying to reinsert it a second time,
the module enters:
drehmoos:~# modprobe lids
drehmoos:~# lsmod
Module                  Size  Used by    Not tainted
lids                  500780   1  (initializing)

drehmoos:~# lidsadm -V
VIEW
open: No such file or directory
lidsadm: cannot open /proc/sys/lids/locks

drehmoos:~# ls /proc/sys/lids
ls: /proc/sys/lids: No such file or directory

looks like there is some exercise left to the reader :-)

anyway, i gotta go to work now, it is 7:30 in the morning in .de and my
boss is likely to kill me for being late :-)

bye, pappy

--=20
pub  1024/05E1A80C 2001/12/16 Alexander Gabert (http://nikita.ath.cx) <papp=
y@nikita.ath.cx>
          Key fingerprint =3D  2D 84 B0 CB F5 67 8A 22  8D 37 6E 6B 8A 3B 7=
F D6  05 E1 A8 0C

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE812koijt/1gXhqAwRArxtAJ9rAwBJP14EMyX2yY3wvRa9m5DIAACeLdY7
2622wd21lzpC9F9WyrsgkTk=
=H/vX
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
