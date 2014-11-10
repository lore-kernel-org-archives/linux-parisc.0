From: Alex <lausgans@gmail.com>
Subject: Re: STI text console for ATI FireGL cards?
Date: Mon, 10 Nov 2014 11:15:15 +0000 (UTC)
Message-ID: <loom.20141110T121327-176@post.gmane.org>
References: <5272CAE8.6050108@gmx.de> <20131101000156.GA22568@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Thomas Bogendoerfer <tsbogend <at> alpha.franken.de> writes:

> 
> On Thu, Oct 31, 2013 at 10:26:00PM +0100, Helge Deller wrote:
> > Does the ATI FireGL cards (in e.g. a C8000) have a STI ROM?
> 
> I wonder how many times I need to write that. They don't have STI ROMs.
> The C8000 PDC must have an x86 emulator, which is used for POSTing
> VGA cards. 
> 
> I've successfully installed normal Nvidia and AMD cards (both PCI and
> AGP cards). For me radeonfb is working as console, but without any
> acceleration (ring test failure problem). 

Had you tried to use Nvidia or other non-AMD card as framebuffer? How about 
Xorg?
Thanks

> 
> Thomas.
> 



