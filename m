Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe72.law4.hotmail.com [216.33.148.168])
	by dsl2.external.hp.com (Postfix) with ESMTP id B20AB482B
	for <parisc-linux@parisc-linux.org>; Tue,  6 Nov 2001 01:17:32 -0700 (MST)
From: "kenneth westelinck" <kennywest1@hotmail.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Kaj-Michael Lang" <milang@tal.org>,
	<parisc-linux@parisc-linux.org>
References: <OE761L3gJcYPqd2rg2Q00007507@hotmail.com> <003101c163a9$48570590$56dc10c3@amos> <OE13GhAj5p1Fjxe0ymQ00007efc@hotmail.com> <20011105032426.A1671@solo.franken.de>
Subject: Re: [parisc-linux] Compiling Mozilla on parisc-linux fails
Date: Tue, 6 Nov 2001 09:04:04 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Message-ID: <OE72TyAAfCKQBu8Etaa00008646@hotmail.com>
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

Hi,


I tried to do a dpkg-buildpackage. He seems to be complaining about the
"zip" package. Appearantly the build depends on this package. However, when
I tried a "apt-get install zip" the package was not found. Is there an alias
for this package, or do I also need to build this package from the
source-deb?

Thanks.

Kenneth
----- Original Message -----
From: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
To: "kenneth westelinck" <kennywest1@hotmail.com>
Cc: "Kaj-Michael Lang" <milang@tal.org>; <parisc-linux@parisc-linux.org>
Sent: Monday, November 05, 2001 3:24 AM
Subject: Re: [parisc-linux] Compiling Mozilla on parisc-linux fails


> On Sun, Nov 04, 2001 at 07:46:23PM +0100, kenneth westelinck wrote:
> > Nope, same error (see the attached file). Any other ideas?
>
> how about using dpkg-buildpackage or applying the patches by hand ?
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessary a
> good idea.                                 [ Alexander Viro on
linux-kernel ]
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
