Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D860A482B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Jul 2003 02:29:15 -0600 (MDT)
Date: Wed, 9 Jul 2003 10:29:08 +0200
Message-ID: <3F057186000008F4@ocpmta8.freegates.net>
In-Reply-To: <yq1llv8dbin.fsf@wilson.mkp.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Corrections for RAID1 howto and Resyncing after failure
To: "Martin K. Petersen" <mkp@mkp.net>, "Dub" <dub@latnet.lv>
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

> It would be quite dangerous if the RAID code decided to add things
> to an array just because a disk is inserted (fine for a storage
> appliance, bad idea for a server).

CONFIG_HOTPLUG has nothing to do with it.

Yes read in <http://www.ibiblio.org/pub/Linux/docs/howto/other-formats/html_single/SCSI-2.4-HOWTO.html#mlproc>

that in Linux 2.4: "The SCSI subsystem does not support hot-plugging of SCSI
devices ..."


Well I have no experience with hpux and those new 'hotplugable' devices but
at least on Sun it doesn't mean that you can remove device(s) like this without
taking care to power it off by software!!!

hth,
    Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
