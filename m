Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6CA4B4868
	for <parisc-linux@lists.parisc-linux.org>;
	Thu,  8 Jan 2004 01:06:19 -0700 (MST)
Date: Thu, 8 Jan 2004 09:06:16 +0100
Message-ID: <3FFB28C900001026@ocpmta1.freegates.net>
In-Reply-To: <20040105172146.GE23782@systemhalted>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] [Status] hppa's userspace in 2004 (looking back)
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
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

Hi Carlos,


>========
>GNU/libc
>========
>
>I'm here to speak on behalf of the userspace work we have done. Glibc is
>in *much* better shape than before, a year ago there were so many errors
>I didn't know where to begin. Our current list of failures is down to:
>
>make[2]: *** [/glibc-work/build-hppa/math/test-float.out] Error 136
>make[2]: *** [/glibc-work/build-hppa/math/test-double.out] Error 1
>make[2]: *** [/glibc-work/build-hppa/math/test-ifloat.out] Error 136
>make[1]: *** [math/tests] Error 2
>
>These three tests are related to the fact that we don't have long double
>supported properly. Waiting on HP to release the code.

Looking for something similar, some time ago, I figure out that Paul released
some interesting hp lib stuff in gcc snapshot (the futur 3.4) into gcc/config/pa
 as milli64.S (optimized div, mul, ....), ... (my last cvs update was dated
of dec 2003 and it seems that this feature was dated of Aug 2003 so I trust
that last debian package gcc-snapshot should also contain this material)

I just don't yet reach to rebuild it (gcc-snapshot) following toolchain process
(but I don't much retry because of gnu pserver cvs pb; in the mean time I
read that new anonymous access would be with ssh, even though last weekend
it was not yet operational?) because I much work on 3.3.3.

hth,
    Joel

-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
