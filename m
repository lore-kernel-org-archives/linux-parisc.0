Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A0813484B
	for <parisc-linux@parisc-linux.org>; Mon, 29 Sep 2003 20:21:34 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A4A8r-0000en-4q; Tue, 30 Sep 2003 03:21:33 +0100
Date: Tue, 30 Sep 2003 03:21:32 +0100
From: Matthew Wilcox <willy@debian.org>
To: Rene Brothuhn <rene.br@web.de>
Cc: Matthew Wilcox <willy@debian.org>,
	Roman Zippel <zippel@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	parisc-linux@parisc-linux.org, linux-apus-devel@lists.sourceforge.net
Message-ID: <20030930022132.GU24824@parcelfarce.linux.theplanet.co.uk>
References: <Pine.GSO.4.21.0309291116250.7432-100000@vervain.sonytel.be> <Pine.LNX.4.44.0309291434260.17812-100000@serv> <20030929133317.GP24824@parcelfarce.linux.theplanet.co.uk> <20030929212501.GA2631@ipgraf11.informatik.fh-schmalkalden.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030929212501.GA2631@ipgraf11.informatik.fh-schmalkalden.de>
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

On Mon, Sep 29, 2003 at 11:25:01PM +0200, Rene Brothuhn wrote:
> I'm the one who getting the 53c770 driver working on APUS. The driver is 

Good to hear from you.  Let me just clear up a couple of
misunderstandings...

> based on the code from the ncr53c8xx driver which I found on a 2.4.16 
> kernel (maybe it was an other kernel version, I'm not really sure 
> anymore). In newer kernels the ncr53c8xx drivers are replaced by sym53c8xx 
> which uses a different and more complicated architecture.

The sym53c8xx driver doesn't support all the chips that ncr53c8xx
supported (mostly earlier chips like 810).  Now there's the sym53c8xx_2
driver that supports all the 8xx chips.  In 2.6, we've now eliminated all
PCI stuff from ncr53c8xx (and it should probably be renamed to ncr53c7xx,
but I actually have a slightly different plan for renaming it that needs
other work to happen first).

> In my opinion, the best is to create a seperate 53c720/770 driver based on 
> the 53c770 from APUS or ncr53c8xx. I guess the 53c770 from APUS should 
> work (with some changes) on a 720 (or similar), because the 770 was 
> designed to replace the 720. But I don't know anything about 735 and 755.

The HP 735/755 workstations have an NCR720 chip as part of their `core
IO'.  It appears as a parisc_device.  They have a PCX-T CPU which has
no way to allocate coherent memory.

> But the APUS driver is a really big "patchwork", has some problems and 
> needs a clean-up. And I haven't worked on the driver since a year due to 
> lack of time, sorry.
> 
> I still have lack of time, but if there are any questions, I will help. It 
> will be nice to have a native 720/770 driver... And maybe, if someone 
> tries to port this driver to a PA, I have to go for it...

OK.  I think the right path forward here is:

 - I port the ncr53c8xx to use the non-coherent DMA interfaces.
 - Someone converts the zorro device to embed the struct device.
 - Someone implements the non-coherent DMA interfaces for PowerPC.
 - Someone adds a zorro720 driver (see NCR_Q720 and zalon for inspiration)
   that's simply a glue layer from zorro to ncr720.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
