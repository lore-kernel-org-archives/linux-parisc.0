From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: Re: C8000 cpu upgrade problem
Date: Sat, 23 Oct 2010 20:33:08 +0200 (CEST)
Message-ID: <alpine.DEB.1.10.1010232025080.26539@artax.karlin.mff.cuni.cz>
References: <20101023181110.9CE914E7B@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101023181110.9CE914E7B@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Sat, 23 Oct 2010, John David Anglin wrote:

> > > In the section on replacing the system board, it says to use the ss_update
> > > utility in the BCH Service menu to reset the serial number.  Is the MFG
> > > menu accessible?  There may be some hidden commands to setup config.
> > 
> > There is a service menu, but no mfg menu and no ss_update command.
> > 
> > Interesting ... "mfg" gives "ERROR: Unsupported command" while any other 
> > bad commands gives "ERROR: Unknown command".
> > 
> > So there is something magic abouth that "mfg" menu, but it's inaccessible.
> 
> The mfg menu was shown in an online document about setting up the c8000.
> 
> I would guess that ss_update command and mfg menu disappear after
> the unit has been configured.  Probably, the configuration data needs
> to be erased/reset to restore the menu.  Possibly, reflashing the
> bch firmware would do it, or maybe there is a ODE command to reset
> the config.
> 
> You might try downloading the firmware update.  At least for the
> rp3440, one burns an ODE CD.  Then, one boots the CD and uses various
> ODE commands to flash the firmware.  There was definitely a lot
> more stuff on the CD than just the utilities to flash the firmware.
> Of course, one mistake and you brick the system.  It would probably
> take HP specific JTAG tools to recover.
> 
> Dave

I found some HPUX binary, as a firmware upgrade for C8000, that I didn't 
run (it says it upgrades to the same version that I have).

I'm quite scared to run rp3440 CD on an unsupported system. But I'll try 
anyway.

Mikulas
