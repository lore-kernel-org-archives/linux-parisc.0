Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1DC714868
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Jul 2003 07:25:55 -0600 (MDT)
Date: Wed, 9 Jul 2003 15:25:49 +0200
Message-ID: <3F05718600000A59@ocpmta8.freegates.net>
In-Reply-To: <1057755859.3f0c12d38f8b9@clients.latnet.lv>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Corrections for RAID1 howto and Resyncing after failure
To: "Dub" <dub@latnet.lv>, parisc-linux@lists.parisc-linux.org
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


> I just made another test. I pull out 2 mirrored disk (root and var). The

> system was running well. However, it seems that md software did not notice
> absense of disk until someone tries to write there (I was forced to create
> a file in /boot partition so that md understands the failure).
> 
> Then I rebooted the system without two disks. PDC told 'warn 80F5' ( Looks
> Error executing Entry Init). I do not know why PDC did not try secondary
> device automatically,
> in spite of BOOT ALT worked OK. Looks like PDC was
> very unhappy about primary disk and didn't try to try secondary path.

do you well set autosearch on ?
Have a look at boot prompt: co bootinfo?

hth,
    Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
