Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA14234
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Apr 2000 18:16:30 -0600
Message-ID: <20000414181623.A14133@puffin.external.hp.com>
Date: Fri, 14 Apr 2000 18:16:23 -0600
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] msdos_partion+120 == code 28
References: <200004142233.PAA20334@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200004142233.PAA20334@milano.cup.hp.com>; from Grant Grundler on Fri, Apr 14, 2000 at 03:33:45PM -0700
List-ID: <linux-parisc.vger.kernel.org>

> So we are making forward progress...LAN and SCSI both sort-of talk
> on the C3k. I think something in the LAN stack is causing an HPMC
> but am so fed up with tulip driver I decided to look at SCSI instead.
> Mostly good news (we see disks and can query them) until msdos
> partition code gets involved.
> 
> code 28 == "Unaligned Data Reference Trap".
> (Gee, where have I seen this before? :^(  )
> 
> IAOQ  == 0xc016939c msdos_partition+120
> 

Can you resolve that into a line of the C code ?  It looks to me like
the msdos partition code has been fixed to use get_unaligned and le*_to_cpu
so I believe this should be a genuine bug.

	Philipp Rumpf
