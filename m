From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes)
Date: Tue, 21 Mar 2006 22:52:16 -0500
Message-ID: <20060322035216.GQ29323@quicksilver.road.mcmartin.ca>
References: <20060307211213.3A261494013@palinux.hppa> <200603121426.16996.deller@gmx.de> <20060317172748.GA1851@colo.lackof.org> <200603220009.43343.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
 parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <kyle@quicksilver.road.mcmartin.ca>
In-Reply-To: <200603220009.43343.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Mar 22, 2006 at 12:09:43AM +0100, Helge Deller wrote:
> it turned out, that it was a stupid bug in the PFN calculation of the DTLB handler routine.
> It's fixed now in CVS.
> The 64bit Kernel boots now, but I still have to clean up STIfb driver to do the right thing.
>

Wow, way to go! 
