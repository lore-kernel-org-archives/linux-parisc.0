From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] palo-1.4 broken on 32bit ?
Date: Thu, 13 May 2004 13:26:22 -0400 (EDT)
Message-ID: <200405131726.i4DHQM5M015373@hiauly1.hia.nrc.ca>
References: <20040504201122.GA32258@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: deller@gmx.de,
 parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20040504201122.GA32258@colo.lackof.org> from "Grant Grundler" at May 4, 2004 02:11:22 pm
List-ID: <linux-parisc.vger.kernel.org>

> On Tue, May 04, 2004 at 09:36:28PM +0200, Helge Deller wrote:
> > Hi all,
> > 
> > after apt-get upgrading to palo_1.4_hppa.deb it seems, that palo-1.4 isn't able any longer to boot up a 32bit Linux kernel on a 32bit Machine.
> > I've run several tests on a B180L, and only after downgrading to palo-1.3 I was able to boot again.
> > 
> > Am I the only one seeing this problem ? 
> 
> No - I've been seeing it on the c3600 as well.
> I haven't tried 64-bit kernels.
> And downgrading iplboot to 1.3 also solves it for me too.

Same here on 3750.  Boot fails with

ext2_init: bad magic 0x0

Downgraded, reran palo and the problem is gone.  Command line is >128.
I shortened it a bit but I think this a problem for people using graphics
consoles.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
