Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id F3B11482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Mar 2003 11:13:40 -0700 (MST)
Date: Wed, 26 Mar 2003 19:12:51 +0100
Message-ID: <3E818B62000002A1@ocpmta8.freegates.net>
In-Reply-To: <20030326150729.GC2370@systemhalted>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] glibc 2.3.2 patches updated, still no working sysdep-cancel
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


>
>> I had to kill a 'tst-cancel-stat' because it was eating 99% of cpu usage.
>> As it was evidently looping, strace -p 31611 shows me hundred of thousand
>> messages: kill(31610, SIGRT_1)    =-1 (no such process)
>
>Yes, I've noticed this, and I'm not sure why it's doing that. It's the
>only test that fails this way. The rest just SIGSEGV, which again means
>I need to keep debugging the syscall/errno code.
>
>I'll post an update after running some tests on my current patches.
>Thanks for trying that out Joel. What hardware are you testing this on?
>
Sorry I forgot to mentionned; I take the opportunity of a n4k with 2g of
mem to make compile quickest (no swaping at all with so big mem amount) and
so running a 2.4.20-pa32 64bits (up) with an unstable debian.

Joel

---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
