Return-Path: <Ivar.Olav.Harstad.Orskaug@idi.ntnu.no>
Received: from ray.idi.ntnu.no (ray.idi.ntnu.no [129.241.107.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 46DB74854
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 14 Jan 2004 03:42:36 -0700 (MST)
Received: from db-gr1.idi.ntnu.no (db-gr1.idi.ntnu.no [129.241.111.242])
	by ray.idi.ntnu.no (8.12.10/8.12.10) with ESMTP id i0EAgXDx003660
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 14 Jan 2004 11:42:33 +0100 (MET)
Date: Wed, 14 Jan 2004 11:42:33 +0100 (CET)
From: Ivar Orskaug <Ivar.Olav.Harstad.Orskaug@idi.ntnu.no>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kernel compilation time
In-Reply-To: <400324B600000D55@ocpmta1.freegates.net>
Message-ID: <Pine.BSF.4.58.0401141140100.27282@db-gr1.idi.ntnu.no>
References: <400324B600000D55@ocpmta1.freegates.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, 13 Jan 2004, Joel Soete wrote:

> Either apply manualy this patch (in fact remove spaces):
> <http://lists.parisc-linux.org/pipermail/parisc-linux/2003-July/020426.html>
>
> or use a more recent kernel (cvs one seems ok for me ;) )

	A CVS checkout worked, the other tarballs propably breaks with
	Sarge, thanks,

	Ivar

>
> hth,
>     Joel
>
> >-- Original Message --
> >Date: Tue, 13 Jan 2004 18:29:21 +0100 (CET)
> >From: Ivar Orskaug <Ivar.Olav.Harstad.Orskaug@idi.ntnu.no>
> >To: parisc-linux@lists.parisc-linux.org
> >Subject: Re: [parisc-linux] kernel compilation time
> >
> >
> >On Tue, 13 Jan 2004, Randolph Chung wrote:
>
> > > just installed a fresh Debian on a C3000/8500. I did a kernel
> > > recompile and after 15 minutes binutils terminated compilation,
> > > complaining about too long arguments.  However, is this normal com
> >ilation
> > > time? I know this is not an acurate metric, but gives an idea. I
> > > just did an make oldconfig and then rebuilt the kernel. What is the normal
> > > kernel compilation time on these machines?
> > > The running kernel was 2.4.21.
> >
> > do y
> >u have latest binutils installed? it shouldn't terminate. can you
> > please post your config and binutils/gcc version? ~10-15 minutes sounds
> > reasonable for a c3k, but depends on amount of memory, speed of disk,
> > etc...
>
> 	OK, running binutils 2.1
> >.90.0.7-3, gcc 3.3.2
>
> 	output from make:
>
> 	real2.S:126: Error: too many positional arguments
> 	make[1]: *** [real2.o] Error 1
> 	make[1]: Leaving directory
> 	`/usr/src/kernel-source-2.4.21/arch/parisc/kernel'
> 	make: *** [_dir_arch/parisc/kernel] Er
> >or 2
>
> 	line 126 in
> /usr/src/kernel-source-2.4.21/arch/parisc/kernel/real2.S:
>
> 	 126          load32  PA(save_cr_space + (N_SAVED_REGS * REG_SZ)), %r26
> >
> > randolph
> >
> _______________________________________________
> parisc-linux mailing list
> p
> >risc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
>
>
> -------------------------------------------------------------------------
> Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
> le monde.
> http://reg.tiscali.be/default.asp?lg=fr
>
>
