Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA12939
	for <parisc-linux@puffin.external.hp.com>; Wed, 22 Mar 2000 19:56:22 -0700
From: willy@thepuffingroup.com
Date: Wed, 22 Mar 2000 21:57:49 -0500
To: Philipp Rumpf <prumpf@puffin.external.hp.com>
Cc: 5116@telia.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Any docs on the 715?
Message-ID: <20000322215749.C10226@thepuffingroup.com>
References: <200003222235.XAA11684@zaphod.halden.lillfab.se> <20000322170913.B11714@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000322170913.B11714@puffin.external.hp.com>; from Philipp Rumpf on Wed, Mar 22, 2000 at 05:09:13PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Mar 22, 2000 at 05:09:13PM -0700, Philipp Rumpf wrote:
> I don't know about the 715 scsi chip, the eisa slot, parallel;

the 715/old scsi chip is an ncr53c700.  everyone is too scared of it
right now.  the 715/new scsi chip is an ncr53c710 and Gyula Matics
committed code that should have that working.

> I don't think anyone has worked out how to use the LEDs yet.

If you look in the mach sources, flashing the LEDs is pretty
straightforward.
