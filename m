Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2821248A5
	for <parisc-linux@parisc-linux.org>; Mon, 24 Sep 2001 05:22:31 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15lTod-00015D-00
	for parisc-linux@parisc-linux.org; Mon, 24 Sep 2001 13:22:23 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 15lTo1-0002Gu-00
	for <parisc-linux@parisc-linux.org>; Mon, 24 Sep 2001 13:21:45 +0200
Date: Mon, 24 Sep 2001 13:21:45 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Debian bootfloppies with -pa22 fails on 720/50
Message-ID: <20010924132145.B8726@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Eek! :-)

After your changes (making case 18 fall through to case 28), I get the
following happy-and-warm-and-fuzzy message:

...
VFS: Mounted root (nfs filesystem) readonly.
init(1): unaligned access to 0x00090cf4 at ip=0x000157af
init[1]: Unaligned data reference 28

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111
r0-3     00000000 1035d973 1010ccb8 10038258
r4-7     10038648 ffffffff 00000012 faf0004c
r8-11    00000000 00069c48 000100c4 00014dd8
r12-15   10348000 00000000 00000000 00000000
r16-19   10038258 00000000 10348000 00000000
r20-23   00090cf4 0000001f 00000000 10038258
r24-27   00000001 00000001 1027b8e0 102a4010
r28-31   00000000 00000004 10038800 10118338
sr0-3    00000000 105b60c0 00000000 00000001
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1010ca64 1010ca68
 IIR: 0e93d222    ISR: 00000001  IOR: 00090cf4
 CPU:        0   CR30: 10038000 CR31: 10350000
 ORIG_R28: 10038600
Kernel panic: Attempted to kill init!

This doesn't mean much to me, so let me know what you want me to do now.
:-)

Regards,

Albert

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7rxdIDg+hOeRZtkMRAuZIAJ9cpIzS68xOk5yEsIlJG8lyDt9BJwCdF9Er
7LYIK0QeoPrJH+ySKNb3DrU=
=IUu4
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
