From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: C8000 cpu upgrade problem
Date: Sat, 23 Oct 2010 14:11:09 -0400 (EDT)
Message-ID: <20101023181110.9CE914E7B@hiauly1.hia.nrc.ca>
References: <alpine.DEB.1.10.1010231947430.26539@artax.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: mikulas@artax.karlin.mff.cuni.cz (Mikulas Patocka)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.1010231947430.26539@artax.karlin.mff.cuni.cz> from "Mikulas Patocka" at Oct 23, 2010 07:53:49 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > In the section on replacing the system board, it says to use the ss_update
> > utility in the BCH Service menu to reset the serial number.  Is the MFG
> > menu accessible?  There may be some hidden commands to setup config.
> 
> There is a service menu, but no mfg menu and no ss_update command.
> 
> Interesting ... "mfg" gives "ERROR: Unsupported command" while any other 
> bad commands gives "ERROR: Unknown command".
> 
> So there is something magic abouth that "mfg" menu, but it's inaccessible.

The mfg menu was shown in an online document about setting up the c8000.

I would guess that ss_update command and mfg menu disappear after
the unit has been configured.  Probably, the configuration data needs
to be erased/reset to restore the menu.  Possibly, reflashing the
bch firmware would do it, or maybe there is a ODE command to reset
the config.

You might try downloading the firmware update.  At least for the
rp3440, one burns an ODE CD.  Then, one boots the CD and uses various
ODE commands to flash the firmware.  There was definitely a lot
more stuff on the CD than just the utilities to flash the firmware.
Of course, one mistake and you brick the system.  It would probably
take HP specific JTAG tools to recover.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
