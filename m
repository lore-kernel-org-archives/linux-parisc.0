Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA24095
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 11:16:40 -0700
Date: Thu, 30 Nov 2000 16:18:46 -0200 (BRST)
From: "Jorge L. deLyra" <delyra@latt.if.usp.br>
To: Grant Grundler <grundler@cup.hp.com>
cc: Steve Moret <smoret@uci.edu>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP 9000/735-125 
In-Reply-To: <200011301807.KAA29437@milano.cup.hp.com>
Message-ID: <Pine.LNX.3.96.1001130161306.19194B-100000@latt.if.usp.br>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > I will go under the assumption that it could be the disks and their
> > possible age and try and find suitable replacements.
> 
> Possible - sometimes just jumpers are missing or need to be removed.
> Make sure disks spinup on their own first.
> 
> I'm not sure Linux SCSI disk driver knows how to deal with
> "Not ready" and/or send START_UNIT commands. HPUX definitely does.

The kernel on the v0.5 ISO image did spin up the disk on the SCSI bus when
I tried booting it the first time, right after turning on the machine. It
hangs later, but has no problems at this point... On subsequent tries the
disks were already spinning, of course, so it did nothing...

----------------------------------------------------------------
        Jorge L. deLyra,  Associate Professor of Physics
            The University of Sao Paulo,  IFUSP-DFMA
       For more information: finger delyra@latt.if.usp.br
----------------------------------------------------------------
