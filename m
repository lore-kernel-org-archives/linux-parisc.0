Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (unknown [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id B6F93482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 May 2003 11:21:14 -0600 (MDT)
Date: Tue, 20 May 2003 19:20:57 +0200
Message-ID: <3EC76210000009D0@ocpmta8.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] 2.4 and semtimedop - need kernel compat?
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	"Matthew Wilcox" <willy@debian.org>
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

>The idea was that it might be able to provide the required compat
>functionality in 2.4. If we feel it's not possible then we can eliminate
>all the entries in sys_parisc.c/sys32_parisc.c and leave the syscall as
>ENTRY_SAME(nisyscall) in entry.S.
>
>The glibc side of the code is done.
>
Hi Carlos,

In the very last Andrea's patch 2.4.21rc2aa1.bz2, I read that Andrea already
back port this stuff :)

At a first glance, the job is also applied for hppa. Would you like that
I have
a look to see if it is applicable with your patch in p-l cvs tree?

Joel




---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
