Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9F5BB4838
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Apr 2004 03:31:33 -0600 (MDT)
Date: Wed, 28 Apr 2004 11:31:29 +0200
Message-ID: <408D43600000166C@ocpmta2.freegates.net>
In-Reply-To: <408D43600000128B@ocpmta2.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-1?Q?Re=3A=20=5Bparisc=2Dlinux=5D=20RE=3A=20=5BPATCH=5D=20glibc=2D2=2E3=2E3=20error=20with=20debian=20unstable=09compiler=2E=2E=2E?=
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
> > 
> > Okay, it's a 64-bit kernel problem them. What kernel are you running
> > right now?
> 
> a merged 2.6.6-rc1-pa2 and upstream 2.6.6-rc2 :) 32bits build with lastest
> gcc-3.3, binutils (debian unstable) and libc6 (cvs 20040426 + your patches
> :)
>
> I also have a b2k on which I can try to build 64bits kernel with gcc-3.0?

Certainly: I just rebuild my own merge of 2.6.6-rc1-pa6 and 2.6.6-rc3 with
gcc-hppa64 (from ftp.p-l.org) and reboot my b2k with it and effectively the
result of tst-timer4 is a bit different:
# ./tst-timer4
clock_gettime returned timespec = { 1083142973, 718981000 }
clock_getres returned timespec = { 0, 10000000 }
*** sig1_sigval.sival_ptr (nil) != 0xbff00690
*** sig2_sigval.sival_ptr 0 != 163
# echo $?
0

hth,
    Joel


----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
