Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 026B148B8
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Aug 2003 00:21:46 -0600 (MDT)
Date: Thu, 21 Aug 2003 08:21:43 +0200
Message-ID: <3F2E2C7700003FE2@ocpmta2.freegates.net>
In-Reply-To: <20030820194103.GA18688@systemhalted>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
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

>Lamont made a good catch and we optimized the standard case in the itlb
>fault fast path, keeping the CPU's forward branch prediction working in
>our favour. 

That is the very fine state of the art :)

>As such our numbers for various syscalls (LMBENCH tests)
>have become more stable from call to call. The best number is our 'page
>fault' which has shown a ~10x speedup :) It used to be 130 microseconds
>+/- 100 microseconds, and is now consistently ~13 microseconds.

Congratulation, I will try it also on the N (64bits)

Thanks again,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL, seulement 35 eur/mois et le modem est inclus...abonnez-vous!
http://reg.tiscali.be/default.asp?lg=fr 
