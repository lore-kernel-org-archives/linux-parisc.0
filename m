Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from postfix.fh-schmalkalden.de (pop3.fh-schmalkalden.de [194.94.30.58])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0689248B7
	for <parisc-linux@parisc-linux.org>; Tue, 30 Sep 2003 08:01:33 -0600 (MDT)
Date: Tue, 30 Sep 2003 15:59:32 +0200
From: Rene Brothuhn <rene.br@web.de>
To: Matthew Wilcox <willy@debian.org>
Cc: Rene Brothuhn <rene.br@web.de>,
	Matthew Wilcox <willy@debian.org>,
	Roman Zippel <zippel@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	parisc-linux@parisc-linux.org, linux-apus-devel@lists.sourceforge.net
Message-ID: <20030930135932.GA10395@ipgraf11.informatik.fh-schmalkalden.de>
Reply-To: rene.br@web.de
References: <Pine.GSO.4.21.0309291116250.7432-100000@vervain.sonytel.be> <Pine.LNX.4.44.0309291434260.17812-100000@serv> <20030929133317.GP24824@parcelfarce.linux.theplanet.co.uk> <20030929212501.GA2631@ipgraf11.informatik.fh-schmalkalden.de> <20030930022132.GU24824@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=ISO-8859-1
In-Reply-To: <20030930022132.GU24824@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Tue, Sep 30, 2003 at 04:21:32 +0200
Subject: [parisc-linux] Re: NCR53c720
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On 2003.09.30 04:21 Matthew Wilcox wrote:
> The sym53c8xx driver doesn't support all the chips that ncr53c8xx
> supported (mostly earlier chips like 810).  Now there's the sym53c8xx_2
> driver that supports all the 8xx chips.  In 2.6, we've now eliminated all
> PCI stuff from ncr53c8xx (and it should probably be renamed to ncr53c7xx,
> but I actually have a slightly different plan for renaming it that needs
> other work to happen first).

Fine, the pci-stuff is removed from the driver. This makes it easier to 
adapt the driver to non-pci machines.

I have looked in the ncr53c8xx driver from 2.6 and there is mentioned that 
"interrupt on the fly" is not working correctly for 720. Also 
sym53c8xx_defs.h is included and so the registerset from a 810 is used, 
but the 720/770 registers are slightly different.
Is the NCR_Q720 or zalon driver working?

> 
> OK.  I think the right path forward here is:
> 
>  - I port the ncr53c8xx to use the non-coherent DMA interfaces.
>  - Someone converts the zorro device to embed the struct device.
>  - Someone implements the non-coherent DMA interfaces for PowerPC.

So, maybe I can do that at least for APUS, because some of the needed 
interfaces I already created as a "dirty-hack" inside the 53c770 driver. 
But the mean problem is, that there is no working 2.6 kernel for APUS... 
The other problem is time, but maybe I find some hours on weekend...

>  - Someone adds a zorro720 driver (see NCR_Q720 and zalon for
> inspiration)
>    that's simply a glue layer from zorro to ncr720.

If the rest is working, something like this should not be a big problem...


Ciao, Renè
