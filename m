Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8AFE0482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Nov 2001 05:10:36 -0700 (MST)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 15zd9b-0007M2-00
	for parisc-linux@lists.parisc-linux.org; Fri, 02 Nov 2001 14:10:31 +0200
Date: Fri, 2 Nov 2001 14:09:41 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: kenneth westelinck <kennywest1@hotmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Compiling Mozilla on parisc-linux fails
Message-ID: <20011102140941.B17393@dogbert.localdomain>
References: <OE761L3gJcYPqd2rg2Q00007507@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uAKRQypu60I7Lcqm"
In-Reply-To: <OE761L3gJcYPqd2rg2Q00007507@hotmail.com>
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

--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On Fri, 02 Nov 2001, kenneth westelinck wrote:

<snip>

> "--build=hppa-hpux --host=hppa-hpux" the right way to go? If so, can someone
> provide me with the model header file or the correct typedefs?

Unless I am very much mistaken, you probably don't want this. Even
though this is a HP system, it is running the Linux operating system,
with its associated header files.

AFAIK, we're still missing a kernel-headers package for hppa; someone
suggested simply install the sparc one. Don't know how well that works.

Regards,

Albert

--uAKRQypu60I7Lcqm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE74o0FDg+hOeRZtkMRAuTAAJ9bwHiQ1K0lKOZ8FJBjbNbmzl+u+QCfVhYJ
zBdih1sBtv1P6xFkJns8lHw=
=AjG6
-----END PGP SIGNATURE-----

--uAKRQypu60I7Lcqm--
