Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3EC0A4841
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Nov 2003 00:23:27 -0700 (MST)
Date: Tue, 25 Nov 2003 08:23:23 +0100
Message-ID: <3FB25B960000788E@ocpmta1.freegates.net>
In-Reply-To: <3FB265250000633D@ocpmta2.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] strace locks up 2.4.22-pa14
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi Grant,

Just a follow up:

>-- Original Message --
>From: "Joel Soete" <soete.joel@tiscali.be>
>To: "Grant Grundler" <grundler@parisc-linux.org>
>Cc: parisc-linux@lists.parisc-linux.org
>Date: Mon, 24 Nov 2003 08:21:28 +0100
>Subject: Re: [parisc-linux] strace locks up 2.4.22-pa14
>
>
>

>>ok. TBH, I have no clue then. It might be possible to attach strace to
>>a running lp deamon, redirect strace output to /dev/console and then
>>compore what happens different on the b2k when a print job is started.
>
>Good idea, I will try to see howto
>
Oops, I try first to strace lpd ("strace -f -p xxx 2>&1 | tee Strace-lpd.log")on
the b180 (running a 2.4.19 + lvm (aka dm) support) but this "locked up" too.

Unfortunately, I don't have anymore a 'woody' install to try to trace back
when the strace pb appears :(.

btw since my last update (last friday), I couldn't any more print with this
b180 too.

J.


-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
