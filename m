Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id EB1624842
	for <parisc-linux@parisc-linux.org>; Tue,  6 Nov 2001 04:48:57 -0700 (MST)
Message-ID: <3BE7CD23.1315D53B@esiee.fr>
Date: Tue, 06 Nov 2001 12:44:35 +0100
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: kenneth westelinck <kennywest1@hotmail.com>
Cc: Kaj-Michael Lang <milang@tal.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Compiling Mozilla on parisc-linux fails
References: <OE761L3gJcYPqd2rg2Q00007507@hotmail.com> <003101c163a9$48570590$56dc10c3@amos> <OE13GhAj5p1Fjxe0ymQ00007efc@hotmail.com> <20011105032426.A1671@solo.franken.de> <OE72TyAAfCKQBu8Etaa00008646@hotmail.com>
Content-Type: text/plain; charset=us-ascii
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

Hi Kenneth,
> 
> I tried to do a dpkg-buildpackage. He seems to be complaining about the
> "zip" package. Appearantly the build depends on this package. However, when
> I tried a "apt-get install zip" the package was not found. Is there an alias
> for this package, or do I also need to build this package from the
> source-deb?
The package "zip" is non-US. So, you have to add the non-US server in
your source.list and do a "apt-get source zip" and then build the
package. 

But, I will say that in
http://ftp.fr.debian.org/debian-non-US/pool/non-US/main/z/zip/ , you
have the hppa binary
http://ftp.fr.debian.org/debian-non-US/pool/non-US/main/z/zip/zip_2.30-3_hppa.deb

Since I do not know if it is very legal to do that. It is up to you :-)

After installing it, you will be able to start the building of
mozilla...

Good luck, Thomas.
ESIEE Team
