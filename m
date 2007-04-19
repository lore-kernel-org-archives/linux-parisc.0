From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Debian 4.0 and PCI issues?
Date: Thu, 19 Apr 2007 00:04:18 -0600
Message-ID: <20070419060418.GB16953__41779.0479179986$1416624335$gmane$org@colo.lackof.org>
References: <1176602689.4621884127120@www.twosillies.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Evanson <debianuser@twosillies.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1176602689.4621884127120@www.twosillies.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Apr 14, 2007 at 10:04:49PM -0400, Matthew Evanson wrote:
> 
> First, hats off to those that have made Linux usable on PA-RISC.  

thanks (on behalf of willy, randolph, jda, lamont, bdale, jsm, carlos,
taggart, bame, et al - see "Hall of Fame" on our webpage)

> I was wondering if others have had success running Debian 4.0 (or 3.1 testing)
> on a C class workstation (specifically C180) with PCI hardware.

Not that many people are running the older generation workstations.
BTW, which kernel version is Debian 3.1 testing? Is this the 2.6.18-?

> Background:
> * Own a C180 with the buggy GSCtoPCI hardware (per note A4190A-01)
> * Installed a Compaq quad port PCI ethernet card in the box
> * System failed to boot due to firmware lockout
> * Modified firmware to bypass error and allow booting

Can you describe how you did that?
Maybe even add it someplace to wiki.parisc-linux.org?
Or just mail it to me off list and I'll add it.

> * When Linux probes the PCI bus, errors are reported and device is unusable.
> 
> Errors thrown are:

Can you capture the console output with a serial console and post it?
Can you also post "lspci -v"  and "lspci -vt" output using the kernel
that did boot?

>     PCI: Unable to handle 64-bit address space for bridge 0000:00:03.0
>     PCI: Failed to allocate mem resource #0:1000@f2c00000 for 0000:01:04.0
>     PCI: Failed to allocate mem resource #0:1000@f2c00000 for 0000:01:05.0
>     PCI: Failed to allocate mem resource #0:1000@f2c00000 for 0000:01:06.0
>     PCI: Failed to allocate mem resource #0:1000@f2c00000 for 0000:01:07.0
> 
> The e100 module fails to load with the message:
>     Cannot find proper PCI device base address, aborting.
> 
> I've traced this to the function pci_read_brige_bases in drives/pci/probe.c.
> I built a new kernel that instead of erroring out, reports and ignores
> mem_base_hi and mem_limit_hi.  With this new kernel, I am successfully able to
> use my PCI hardware.
> 
> mem_base_hi and mem_limit_hi both report as 0xffffffff.  This seems to be
> incorrect behaviour per the comments in the code.

AFAIK, dino/cujo do not route GMMIO (>4G addresses).
I would expect zero in both _hi registers on C180 or similar workstations.
I suspect this is intentional because firmware detected the "bad" dino
versions. I don't recall if "cujo" (64-bit slots) are also affected.

> Ultimately, my question is whether or not those values are expected or if this
> is the result of change in behaviour due to my firmware modification?

I suspect the latter....but I don't know what you modified.
It might be possible to hack the dino driver to think this is a
"card-mode" dino and then dino can initialize all PCI device resources.
Might require additional hacking on MMIO resource map but should be do-able.

> FYI, I do understand the potential for corruption of data running in this
> configuration but the way in which this machine will be utilized is low risk.

ok. For NICs, it's probably OK as long as you disable checksum offloading.
Packets with data that triggers the corruption will just keep getting resent.
I guess the connection will timeout at that point. So you won't have to
worry about silently missing the problem.

cheers,
grant

> 
> Thanks,
> --matt
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
