From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: STI text console for ATI FireGL cards?
Date: Fri, 1 Nov 2013 01:01:56 +0100
Message-ID: <20131101000156.GA22568@alpha.franken.de>
References: <5272CAE8.6050108@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5272CAE8.6050108@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Oct 31, 2013 at 10:26:00PM +0100, Helge Deller wrote:
> Does the ATI FireGL cards (in e.g. a C8000) have a STI ROM?

I wonder how many times I need to write that. They don't have STI ROMs.
The C8000 PDC must have an x86 emulator, which is used for POSTing
VGA cards. 

I've successfully installed normal Nvidia and AMD cards (both PCI and
AGP cards). For me radeonfb is working as console, but without any
acceleration (ring test failure problem). 

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
