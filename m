Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 735C1482B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Jul 2003 07:43:59 -0600 (MDT)
Date: Wed, 9 Jul 2003 15:43:49 +0200
Message-ID: <3F05718600000A79@ocpmta8.freegates.net>
In-Reply-To: <20030709122700.GR1939@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Corrections for RAID1 howto and Resyncing after failure
To: "Matthew Wilcox" <willy@debian.org>
Cc: "Martin K. Petersen" <mkp@mkp.net>, "Dub" <dub@latnet.lv>,
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

> Well, no, you're always going to have to quiesce the device.  Otherwise
it's
> like turning the machine off without halting -- random things are cached
and
> simply never make it back to disc.

Ah yes, (my bad, i thought but not write) I would have to specify that I
spok about hotplugable I/O device in general (FC, NIC,... with the famous
blue led) and not about disk which we qualify here as 'hotswapable' disk.

Thanks,
    Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
