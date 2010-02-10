From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Bringing into life HP B2000
Date: Wed, 10 Feb 2010 18:07:20 -0500 (EST)
Message-ID: <20100210230720.B23144FA3@hiauly1.hia.nrc.ca>
References: <20100208161048.GA7893@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: witold.rohm@igig.up.wroc.pl, linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100208161048.GA7893@lackof.org> from "Grant Grundler" at Feb 8, 2010 09:10:48 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Mon, Feb 08, 2010 at 03:03:21PM +0100, Witold Rohm wrote:
> > Dear Grant, 
> > I'm presently trying to run debian 5.0 on B2000 Visualize FX
> > Hp station - everything goes fine until the X server is starting
> > - according to hp pa risc forum - it's not possible to get X window
> > running on the FX card, and it's true. 
> > So i was trying to mount  PCI card I' ve tried the S3, Matrox II,
> > cards and none of them works - even if I change the path console
> > to PCI3. I checked the service Chasis codes and it states that:
> > "error executing ENTRY INIT" 
> > Could you give me any advice or help?
> 
> Hi Witold,
> Please CC linux-parisc mailing list for help. Folks there know more than I do.
> 
> What I do know is normal PCI cards do NOT have the firmware support (aka IODC)
> to function as console for PA-RISC. What does work is using a serial console
> to setup the machine so X11 can talk to a Matrox card. I'm not sure which
> one but I'm pretty sure someone had this working before.

My c3750 with Vis EG crashes with 2.6.32.7 starting X.  Same config doesn't
crash with 2.6.31.12, but keyboard doesn't work correctly.  It looks like
key releases are not detected.  Keyboard works fine in console mode.
Debian 5.0 was ok for X on this machine.

Sorry for this being slightly off topic, but I think we have some X rot

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
