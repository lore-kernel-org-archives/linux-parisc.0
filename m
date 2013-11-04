From: Helge Deller <deller@gmx.de>
Subject: Re: STI text console for ATI FireGL cards?
Date: Mon, 04 Nov 2013 22:17:26 +0100
Message-ID: <52780EE6.9010902@gmx.de>
References: <5272CAE8.6050108@gmx.de> <20131101000156.GA22568@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131101000156.GA22568@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Thomas,

On 11/01/2013 01:01 AM, Thomas Bogendoerfer wrote:
> On Thu, Oct 31, 2013 at 10:26:00PM +0100, Helge Deller wrote:
>> Does the ATI FireGL cards (in e.g. a C8000) have a STI ROM?
> 
> I wonder how many times I need to write that. They don't have STI ROMs.
> The C8000 PDC must have an x86 emulator, which is used for POSTing
> VGA cards.

Yeah, I remember you mentioned that earlier....
 
> I've successfully installed normal Nvidia and AMD cards (both PCI and
> AGP cards). For me radeonfb is working as console, but without any
> acceleration (ring test failure problem).

At least unaccelerated radeonfb is still much better than STI console.

Thanks!
Helge
