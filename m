From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: Re: C8000 cpu upgrade problem
Date: Sat, 23 Oct 2010 19:53:49 +0200 (CEST)
Message-ID: <alpine.DEB.1.10.1010231947430.26539@artax.karlin.mff.cuni.cz>
References: <20101023154718.9C2344D30@hiauly1.hia.nrc.ca> <alpine.DEB.1.10.1010231757360.18664@artax.karlin.mff.cuni.cz> <20101023174106.GA23041@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101023174106.GA23041@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Sat, 23 Oct 2010, John David Anglin wrote:

> On Sat, 23 Oct 2010, Mikulas Patocka wrote:
> 
> > It showed "WARNING: Too many CPUs for this system." and the new cpu wasn't 
> > shown in "IN PR" command. Also, "BO" command refused to boot becuase of 
> > the warning.
> 
> I would check system LEDs to see if a fault is indicated.  Also, look
> for relevant errors in the service error logs.

LEDs 2 and 3 are red --- just like a normal boot, when the machine is 
waiting in the PDC menu for the boot command.

> Are both processor modules same speed and cache?

Yes.

> The following suggests Carlos is correct:
> 
> http://forums13.itrc.hp.com/service/forums/questionanswer.do?admit=109447627+1287851022683+28353475&threadId=1251754

Yes, I found it too.

> In reviewing the technical reference, I don't see any warning that
> upgrading/replacing a processor module may require a HP technician
> to reset the system configuration.
> 
> In the section on replacing the system board, it says to use the ss_update
> utility in the BCH Service menu to reset the serial number.  Is the MFG
> menu accessible?  There may be some hidden commands to setup config.

There is a service menu, but no mfg menu and no ss_update command.

Interesting ... "mfg" gives "ERROR: Unsupported command" while any other 
bad commands gives "ERROR: Unknown command".

So there is something magic abouth that "mfg" menu, but it's inaccessible.

> It appears that processors have to be installed in the correct slot
> since the BCH has the following warning:
> WARNING: Processors are not installed in the correct order.
>
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Mikulas
