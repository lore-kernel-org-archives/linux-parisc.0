Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E74F54848
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Aug 2003 00:04:05 -0600 (MDT)
Date: Thu, 14 Aug 2003 08:02:04 +0200
Message-ID: <3F2A5B0400002E28@ocpmta1.freegates.net>
In-Reply-To: <20030813160532.GG17512@systemhalted>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] itlb miss handler optimizations!
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
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

>
>I forgot that lamont noticed an interlocked zdep in the PA11 common case
>and we reorderd the insn sequence. Perhaps this helped the numbers a
>bit. I have to run the same lmbench tests on a 64-bit box first to
>compare.

btw is it for that reason (interlock) that in your patch we can read:
[...]
        cmpb,=        %r0,t0,itlb_miss_...
        nop
[...]
I am alway asking why the 'nop'.

Thanks in advance,
    Joel



-------------------------------------------------------------------------
Tiscali ADSL, seulement 35 eur/mois et le modem est inclus...abonnez-vous!
http://reg.tiscali.be/default.asp?lg=fr 
