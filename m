Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 01F8E4914
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Dec 2003 00:00:35 -0700 (MST)
Date: Mon, 1 Dec 2003 08:00:33 +0100
Message-ID: <3FB265EC0000AD9F@ocpmta3.freegates.net>
In-Reply-To: <20031130211014.GA5208@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] spinlock 2.4 re-organise a la 2.6 [was: [RFC] rewrite kernel spinlock code to work better with gcc]
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

>I added spinlock_t.h to resolve the circular inter-dependency between
>asm/system.h, asm/bitops.h, and asm/spinlock.h.  spinlock_t.h depends
>on nothing and defines spinlock primitives used by the others.

I see (forgive)

Joel


-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
