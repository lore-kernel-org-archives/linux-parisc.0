Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 072D9485D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 23 Sep 2001 15:22:59 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15lGiE-0007QX-00
	for parisc-linux@lists.parisc-linux.org; Sun, 23 Sep 2001 23:22:54 +0200
Date: Sun, 23 Sep 2001 23:15:36 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] nfsroot login problems on 720/50
Message-ID: <20010923231535.A5896@dogbert.localdomain>
References: <20010921193553.A11874@dogbert.localdomain> <20010921180529.C32145@megatonmonkey.net> <20010922015609.A14166@dogbert.localdomain> <20010922125826.C6488@megatonmonkey.net> <20010923160005.A30607@dogbert.localdomain> <20010923135550.B1512@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
In-Reply-To: <20010923135550.B1512@megatonmonkey.net>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I've tried compiling a kernel with devfs, but I'm not having any luck.
I'm using xc-latest from about a week ago, and make palo dies with the
following message:

fs/fs.o: In function `devfs_alloc_major':
fs/fs.o(.text.devfs_alloc_major+0x5c): undefined reference to `__set_bit'
hppa-linux-ld: fs/fs.o(.text.devfs_alloc_major+0x5c): cannot find stub entry 00000571___set_bit+0
hppa-linux-ld: fs/fs.o(.text.devfs_alloc_major+0x5c): cannot handle R_PARISC_PCREL17F for __set_bit
fs/fs.o: In function `devfs_dealloc_major':
fs/fs.o(.text.devfs_dealloc_major+0x20): undefined reference to `__test_and_clear_bit'
hppa-linux-ld: fs/fs.o(.text.devfs_dealloc_major+0x20): cannot find stub entry 00000571___test_and_clear_bit+0
hppa-linux-ld: fs/fs.o(.text.devfs_dealloc_major+0x20): cannot handle R_PARISC_PCREL17F for __test_and_clear_bit
fs/fs.o: In function `L854':
fs/fs.o(.text.devfs_alloc_devnum+0x114): undefined reference to `__set_bit'
hppa-linux-ld: fs/fs.o(.text.devfs_alloc_devnum+0x114): cannot find stub entry 00000571___set_bit+0
hppa-linux-ld: fs/fs.o(.text.devfs_alloc_devnum+0x114): cannot handle R_PARISC_PCREL17F for __set_bit
fs/fs.o: In function `L913':
fs/fs.o(.text.devfs_alloc_devnum+0x1d8): undefined reference to `__set_bit'
hppa-linux-ld: fs/fs.o(.text.devfs_alloc_devnum+0x1d8): cannot find stub entry 00000571___set_bit+0
hppa-linux-ld: fs/fs.o(.text.devfs_alloc_devnum+0x1d8): cannot handle R_PARISC_PCREL17F for __set_bit
fs/fs.o: In function `L941':
fs/fs.o(.text.devfs_dealloc_devnum+0xdc): undefined reference to `__test_and_clear_bit'
hppa-linux-ld: fs/fs.o(.text.devfs_dealloc_devnum+0xdc): cannot find stub entry 00000571___test_and_clear_bit+0
hppa-linux-ld: fs/fs.o(.text.devfs_dealloc_devnum+0xdc): cannot handle R_PARISC_PCREL17F for __test_and_clear_bit
fs/fs.o: In function `L948':
fs/fs.o(.text.devfs_alloc_unique_number+0xa8): undefined reference to `__set_bit'
hppa-linux-ld: fs/fs.o(.text.devfs_alloc_unique_number+0xa8): cannot find stub entry 00000571___set_bit+0
hppa-linux-ld: fs/fs.o(.text.devfs_alloc_unique_number+0xa8): cannot handle R_PARISC_PCREL17F for __set_bit
fs/fs.o: In function `L990':
fs/fs.o(.text.devfs_dealloc_unique_number+0x48): undefined reference to `__test_and_clear_bit'
hppa-linux-ld: fs/fs.o(.text.devfs_dealloc_unique_number+0x48): cannot find stub entry 00000571___test_and_clear_bit+0
hppa-linux-ld: fs/fs.o(.text.devfs_dealloc_unique_number+0x48): cannot handle R_PARISC_PCREL17F for __test_and_clear_bit
make: *** [vmlinux] Error 1

I'm using debootstrap on my i386 system to build a new root tarball.
Naturally the post-install scripts and such inside the chroot aren't
going to run, but I hope to get it along far enough to boot.

Regards,

Albert

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7rlD3Dg+hOeRZtkMRAg3SAJ9laC3pFriXvtEuo7UeK1DLJJW88QCfXrQ+
oxhzOYhHyGSqcWJdWdC3oHw=
=tnr0
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
