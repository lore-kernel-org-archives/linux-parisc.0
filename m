Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0522048BA
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 06:59:22 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15lVKR-0001wZ-00
	for parisc-linux@lists.parisc-linux.org; Mon, 24 Sep 2001 14:59:19 +0200
Date: Mon, 24 Sep 2001 14:52:00 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Jurriaan Kalkman <Jurriaan.Kalkman@zrt.nl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: Betr.: Re: [parisc-linux] Debian bootfloppies with -pa22 fails on 720/50
Message-ID: <20010924145200.E8726@dogbert.localdomain>
References: <sbaf46e9.067@ms-zrt1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zS7rBR6csb6tI2e1"
In-Reply-To: <sbaf46e9.067@ms-zrt1>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I've since tried the other case 18 fall-through option, and it worked up
to the point where I am now installing from the 0.9.2 CD-ROM.

Do you still want me to decode this crash?

Regards,

Albert

On Mon, 24 Sep 2001, Jurriaan Kalkman wrote:

> >Eek! :-)
> >
> >After your changes (making case 18 fall through to case 28), I get the
> >following happy-and-warm-and-fuzzy message:
> >
> >...
> >VFS: Mounted root (nfs filesystem) readonly.
> >init(1): unaligned access to 0x00090cf4 at ip=3D0x000157af
> >init[1]: Unaligned data reference 28
> >
> >     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> >PSW: 00000000000001001111111100001111
> >r0-3     00000000 1035d973 1010ccb8 10038258
> >r4-7     10038648 ffffffff 00000012 faf0004c
> >r8-11    00000000 00069c48 000100c4 00014dd8
> >r12-15   10348000 00000000 00000000 00000000
> >r16-19   10038258 00000000 10348000 00000000
> >r20-23   00090cf4 0000001f 00000000 10038258
> >r24-27   00000001 00000001 1027b8e0 102a4010
> >r28-31   00000000 00000004 10038800 10118338
> >sr0-3    00000000 105b60c0 00000000 00000001
> >sr4-7    00000000 00000000 00000000 00000000
> >
> >IASQ: 00000000 00000000 IAOQ: 1010ca64 1010ca68
> > IIR: 0e93d222    ISR: 00000001  IOR: 00090cf4
> > CPU:        0   CR30: 10038000 CR31: 10350000
> > ORIG_R28: 10038600
> >Kernel panic: Attempted to kill init!
> >
> >This doesn't mean much to me, so let me know what you want me to do now.
> >:-)
> >
> Look up the thread on 'nmap -O fails on 712/60' from just 2 weeks ago and
> decode this using your own system.map.....
>=20
> Good luck,
> Jurriaan
>=20

--zS7rBR6csb6tI2e1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7ryxvDg+hOeRZtkMRAsFKAJ4vTcp7qLZFOKUSA8iIWiHiS0INWwCfX9o3
XikgXTs/GHsnmdqXyeglHSA=
=/K62
-----END PGP SIGNATURE-----

--zS7rBR6csb6tI2e1--
