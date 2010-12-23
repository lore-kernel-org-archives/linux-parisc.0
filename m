From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Resurrecting my C3000.
Date: Thu, 23 Dec 2010 13:43:59 -0500 (EST)
Message-ID: <20101223184400.384304E75@hiauly1.hia.nrc.ca>
References: <AANLkTimOpLijMDTttD-MD9uKfGFz6KrnCmae71-S=Deq@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTimOpLijMDTttD-MD9uKfGFz6KrnCmae71-S=Deq@mail.gmail.com> from "Carlos O'Donell" at Dec 23, 2010 01:31:46 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The C3K is a single board system, the RS-232 connectors on the back
> are mounted and routed directly to the motherboard (like a common PC).
> 
> If I remove the disks, CDROM, floppy, and memory from the system, it
> still powers up and displays the same error.
> 
> I was surprised it booted without any ram in the slots, but it's a
> robust design :-)

Can you switch to graphics console?  Otherwise, it looks like you need
a new system board...

It looks like a problem with the Super I/O controller which handles
USB, RS-232, Parallel, Floppy and CDRom.  It might be the RS-232
interface chip (something like MAX3232).  It's not uncommon for
these devices to get blown by ESD.  Also, the charge pumps sometimes
fail, or don't start reliably.

Possibly, a PC serial card would work if the machine will boot.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
