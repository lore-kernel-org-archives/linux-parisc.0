Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 35BE64840
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Nov 2003 05:39:54 -0700 (MST)
Date: Fri, 21 Nov 2003 13:39:49 +0100
Message-ID: <3FB265250000556F@ocpmta2.freegates.net>
In-Reply-To: <20031121005003.GB13007@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] strace locks up 2.4.22-pa14
To: "Grant Grundler" <grundler@parisc-linux.org>,
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

Hi Grant,

I am tring to track a lpr pb on my b2k and so try:
# strace -f /usr/bin/lpr foo.doc

that works;

I read your post and try so now:
# strace -f -o /var/tmp/Strace.doc /usr/bin/lpr foo.doc

and system also hang (same behaviour as) and so I toc it (which seems to
failled ; apparently because of ide-cdrom???)

I took the opportunity to unplug ide-cable's cdrom (to test various).

Then to try to obtain a relevant toc, I re-launch:
# strace -f -o /var/tmp/Strace.doc /usr/bin/lpr foo.doc

This time it works??
Is it the same for you after the reboot?
(sorry, I tried severall time strace but no more means to reproduce)

J.

PS: btw the end of my strace is:
[...]
24801 write(3, "\1lp\n", 4)             = 4
24801 read(3, "\0", 1)                  = 1
24801 close(3)                          = 0
24801 SYS_222(0, 0, 0x1, 0x2f, 0)       = -1 ENOSYS (Function not implemented)
24801 exit(0)                           = ?

And at the same time, at the serial console I got:
+ set -v
+ exec

Have you any advise about what I miss?
>-- Original Message --
>From: Grant Grundler <grundler@parisc-linux.org>
>To: parisc-linux@lists.parisc-linux.org
>Date: Thu, 20 Nov 2003 17:50:03 -0700
>Subject: [parisc-linux] strace locks up 2.4.22-pa14
>
>
>
In trying to debug a problem with dcopserver not starting,
I tried: 
	strace -f -o /tmp/dcop.out dcopserver

This locked up the system. I could still ping the tg3 LAN (interrupts
are enabled?). But Mouse and keyboard stopped responding.
I TOC'd
>the system - but forgot to dump PIM on the way up.
Since it's a graphical console, I don't plan on copying down
all the info.  If anyone wants to see that, please let me know
which registers are of interest (IOAQ, gr02, gr26-23 are obvious).

gran
>
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux



-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
