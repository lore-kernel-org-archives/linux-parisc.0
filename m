Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id D685A4840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Nov 2003 00:49:23 -0700 (MST)
Date: Mon, 24 Nov 2003 08:49:20 +0100
Message-ID: <3FB2652500006387@ocpmta2.freegates.net>
In-Reply-To: <20031124024251.GB23224@colo.lackof.org>
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

>"locked up" meaning:
>o I could ping a NIC
>o console mouse/keyboard stopped responding
>o I couldn't ssh into the box.
>
Exactly what I see when i reach to reproduce

>System TOC'd nicely and then HPMC'd the box.
>GR00-3 0x0  0x1032f010 0x102a1a70  0x1038953c
>GR20-23 0x53  0xff..ff 0x0a  0x3c230a1c
>GR24-27  0x102bddbd 0xff...feb 0x3c230948 0x102d2010
>
>IIA Space  0x0
>IIA Offset 0x102a0994 strnlen+18
>GR02 0x102a1a70 vsnprintf+6dc
Exactly the same for the 'strace lpr' (excepted address)?
grrr I retry this morning, no more means to reproduce :(

But you have right for the toc (removing cdrom doesn't help).
I just trigger and notice 4 messages wraping on lcd:
FLT CBF0: SYS DB
HPMC Initiated

FLT 500B: SYS DB
Bus time out

FLT CBF1: SYS DB
no OS HPMC IVA

FLT CBFC: SYS DB
OS HPMC br err

And only power off / on allow to restart. (id don't remember if toc sync
disk or not, but I noticed also that fs have to fsck)

OTC it help to boot 2.4.22-pa12 + aty patch :) (i will see what can I do
with that stuff)

>blecchh...need a full stack unwinder.

Courage ;),
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
