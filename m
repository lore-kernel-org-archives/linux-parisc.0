Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1C82B49FA
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 20 Apr 2004 06:22:34 -0600 (MDT)
Date: Tue, 20 Apr 2004 14:22:30 +0200
Message-ID: <40711E5600009520@ocpmta1.freegates.net>
In-Reply-To: <40711E5600000D4E@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-1?Q?RE=3A=20=5Bparisc=2Dlinux=5D=20RE=3A=20=5BPATCH=5D=20glibc=2D2=2E3=2E3=20error=20with=20debian=20unstable=09compiler=2E=2E=2E?=
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Carlos,

Last week I encounter some pb to co last cvs, sorry.

This week and can apply your patch against the glibc cvs dated 20040419 (just
some hunk failled because in the uptream: great).

I just complete the 'make -k check' (on chroot disk) which finished with
just one more error then well known ones:
make[2]: *** [/Develop/parisc-linux/build/glibc/stdio-common/tst-rndseek.out]
Error 1
make[1]: *** [stdio-common/tests] Error 2

... And the compile (always in the chroot disk) of the last k-2.6.6-rc1-pa0
works still fine and even boot well on a b180.

hth,
    Joel



----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
