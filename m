Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 34F644830
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Oct 2001 14:22:35 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15pbUN-0005RK-00
	for parisc-linux@lists.parisc-linux.org; Fri, 05 Oct 2001 22:22:31 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 15pbSO-0003XR-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 05 Oct 2001 22:20:28 +0200
Date: Fri, 5 Oct 2001 22:20:28 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] woody install on 720/50
Message-ID: <20011005222028.A13585@dogbert.localdomain>
References: <20011001175425.A31305@dogbert.localdomain> <Pine.NEB.4.33.0110021434430.24166-100000@www2.scram.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
In-Reply-To: <Pine.NEB.4.33.0110021434430.24166-100000@www2.scram.de>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello all,

An update on my 720/50. I've managed to get the install as far as
downloading all the packages. But when it starts extracting the first
package, base-files, it hangs. This is on 2.4.9-pa39.

Aside, when installing it seems one should create the palo
partition, create and initialise the swap partition, create and
initialise the ext2 partition. Now optionally set up the hostname and
networking, and then move directly to the installation of the base
system. This got me as far as getting all the packages downloaded, as
mentioned above.

I've booted a fresh nfsroot again, and as John Marvin mentioned a few
days ago, ls still hangs randomly, although it doesn't seem to depend on
the directory. On a previous boot I managed a ls -lR /, but now a simple
ls / hangs the system.

Any suggestions on how I proceed from here? What is still missing from
the kernel and what can I do to help fix it? :-)

Regards,

Albert

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7vhYMDg+hOeRZtkMRAvrSAJ9yw1+m9K4+KCY3bpqiEkina1ofowCeIjCo
pJJthWfLHjJ99chMQgMm+qU=
=d1to
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
