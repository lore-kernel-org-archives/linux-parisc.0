Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0D54483D
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  3 May 2004 14:26:15 -0600 (MDT)
Date: Mon, 3 May 2004 16:28:05 +0000
Message-ID: <408D439D00004B0C@ocpmta3.freegates.net>
In-Reply-To: <20040501180143.GW12850@baldric.uwo.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] hppa glibc status 2004-05-01
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello Carlos,

Just finished the make -k check of the today cvs co (ie 20040503) and no
more Errors then well known ones :)

Thanks a lot,
    Joel
> -- Original Message --
> Date: Sat, 1 May 2004 14:01:43 -0400
> From: Carlos O'Donell <carlos@baldric.uwo.ca>
> To: parisc-linux@lists.parisc-linux.org
> Subject: [parisc-linux] hppa glibc status 2004-05-01
> 
> 
> 
parisc-linux,

If you are building glibc for something other than debian, and you
follow upstream closely (looks at gentoo folks), the you should only see
the following set of failures (TIMEOUTFACTOR set appropriately for slow
tests):

make[2]
>  *** [/build-hppa/math/test-float.out] Error 1
make[2]: *** [/build-hppa/math/test-double.out] Error 1
make[2]: *** [/build-hppa/math/test-ifloat.out] Error 1
make[1]: *** [math/tests] Error 2
make[2]: *** [/build-hppa/stdlib/tst-strtod.out] Error 
> 
make[2]: *** [/build-hppa/stdlib/bug-strtod.out] Error 1
make[1]: *** [stdlib/tests] Error 2
make[2]: [/build-hppa/posix/annexc.out] Error 1 (ignored)
make: *** [check] Error 2

All related to our missing long-double implementation.

http://pa
> isc-linux.org/~carlos/glibc-hppa-patches-2004-05-01.tar.gz

I'm working partly on a 64-bit userspace, no word on that yet though,
I'm reworking the directory structures, and it's going to be like a
million patches that I have to breakup and write C
> angelogs. First step
would be to create the configure chagnes, and move the directories, and
get back a 32-bit build that works.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org

> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux



----------------------------------------------------------------------------------------
Tiscali ADSL, 27,50 €/mois...pendant 6 mois. 
La meilleure offre du marché !
http://reg.tiscali.be/default.asp?lg=fr
