Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C70C4925
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Apr 2004 01:04:11 -0600 (MDT)
Date: Tue, 27 Apr 2004 09:04:08 +0200
Message-ID: <408D43600000049A@ocpmta1.freegates.net>
In-Reply-To: <20040421115522.GH28094@baldric.uwo.ca>
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


Hello Carlos,

Here is my weekly test: cvs 20040426.
Nothing new to mention: always well known errors collected after make -k
check. I just build a 2.6.6-_rc2_-pa2 (for the fun) without pb (which boot
fine on my b180)

Cheers,
    Joel

PS: 
> Yes, the default timeout is too short, add a TIMEOUTFACTOR of 5 or more.

This time I put TIMEOUTFACTOR=4 in the chroot root profile and seems to be
enough to bypass timeout errors :)


----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
