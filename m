Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1CF4D482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Aug 2003 10:43:30 -0600 (MDT)
Date: Wed, 13 Aug 2003 18:43:27 +0200
Message-ID: <3F28D766000037C6@ocpmta4.freegates.net>
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

>I forgot that lamont noticed an interlocked zdep in the PA11 common case

hmm what is an interlock? (just to complet my knowledge)

>and we reorderd the insn sequence. Perhaps this helped the numbers a
>bit. 
If I well understand reverse the zdep move in the code?
(I would play just a bit more with different bench)

>I have to run the same lmbench tests on a 64-bit box first to
>compare.

Nice I hope that will confirm lmbench results :)

Joel


-------------------------------------------------------------------------
Tiscali ADSL, seulement 35 eur/mois et le modem est inclus...abonnez-vous!
http://reg.tiscali.be/default.asp?lg=fr 
