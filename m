Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id B5F2A49FC
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Sep 2001 15:24:46 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15n57i-0007b1-00
	for parisc-linux@lists.parisc-linux.org; Fri, 28 Sep 2001 23:24:42 +0200
Date: Fri, 28 Sep 2001 23:23:55 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: "Neulinger, Nathan" <nneul@umr.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Where to get recent parisc kernels w/o building?
Message-ID: <20010928232355.A23750@dogbert.localdomain>
References: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D7F4@umr-mail03.cc.umr.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
In-Reply-To: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D7F4@umr-mail03.cc.umr.edu>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, 28 Sep 2001, Neulinger, Nathan wrote:

> Is there any convenient place to grab a 2.4.9 (or more recent) vmlinux for
> parisc-linux other than getting it myself out of cvs? (Don't have a
> functional build environment at the moment.)

I suggest grabbing palo-latest, linux-latest and xc-latest from
ftp://puffin.external.hp.com (I can't get to it at the moment, but maybe
you can). Unless you are very lucky, you're going to at least need to
change the boot parameters, for which you need palo anyway. So grab 'em
and set up a build environment if you're REALLY serious about your HP.
:-)
=20
> Also, what about a working gcc? I've apt-get upgrade'd everything, and gcc
> complains about lots of header file goofiness when compiling even a simple
> hello world program.

As far as I know, we're still missing a kernel-headers package for hppa.
I could be wrong. Perhaps you should find the right person and complain
about this. :-) I think a suggested solution was to force-install the
sparc headers or something...
=20
> Also, does the kernel build have to be done cross-compile, or can it be
> built on the parisc-linux machine itself?

You can build it either way. I don't have a 2nd HP machine, so I have to
cross-compile. It's actually pretty nice considering that I have access
to a SMP p3-600 box. :-)

Regards,

Albert

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7tOpqDg+hOeRZtkMRAuOmAJ9OyPxT+t0zgz7xq9asT3368JMF4QCfR3L7
cIUnD3tN3TjyZhZfrslQD+M=
=g+Bm
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
