Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC8204845
	for <parisc-linux@parisc-linux.org>; Tue, 30 Sep 2003 08:32:51 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A4LYZ-0004hs-31; Tue, 30 Sep 2003 15:32:51 +0100
Date: Tue, 30 Sep 2003 15:32:50 +0100
From: Matthew Wilcox <willy@debian.org>
To: Rene Brothuhn <rene.br@web.de>
Cc: Matthew Wilcox <willy@debian.org>,
	Roman Zippel <zippel@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	parisc-linux@parisc-linux.org, linux-apus-devel@lists.sourceforge.net
Message-ID: <20030930143250.GX24824@parcelfarce.linux.theplanet.co.uk>
References: <Pine.GSO.4.21.0309291116250.7432-100000@vervain.sonytel.be> <Pine.LNX.4.44.0309291434260.17812-100000@serv> <20030929133317.GP24824@parcelfarce.linux.theplanet.co.uk> <20030929212501.GA2631@ipgraf11.informatik.fh-schmalkalden.de> <20030930022132.GU24824@parcelfarce.linux.theplanet.co.uk> <20030930135932.GA10395@ipgraf11.informatik.fh-schmalkalden.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030930135932.GA10395@ipgraf11.informatik.fh-schmalkalden.de>
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

On Tue, Sep 30, 2003 at 03:59:32PM +0200, Rene Brothuhn wrote:
> I have looked in the ncr53c8xx driver from 2.6 and there is mentioned that 
> "interrupt on the fly" is not working correctly for 720. Also 
> sym53c8xx_defs.h is included and so the registerset from a 810 is used, 
> but the 720/770 registers are slightly different.
> Is the NCR_Q720 or zalon driver working?

Yes, they're both working fine.

I went over the 770 register definitions the other night and only found
one difference between the names of the definitions in the sym53c8xx_defs
file and the 770 PDF and that was:

-/*3a*/  u_char    nc_sbr;
+/*3a*/  u_char    nc_sbr; /* dwt on 720 */

This is the DMA watchdog timer, but it's not actually used by the driver.
It's a `scratch byte register' on the 895.  Some of the `reserved'
fields in the 770 register definition have names, but they were only
ever touched if the chip was a sufficiently recent revision.

BTW, I couldn't see a document for the 720 chip on the LSI site -- only
the 710 and 770.  I presume I won't go far wrong treating them the same.

> > - Someone implements the non-coherent DMA interfaces for PowerPC.
> 
> So, maybe I can do that at least for APUS, because some of the needed 
> interfaces I already created as a "dirty-hack" inside the 53c770 driver. 
> But the mean problem is, that there is no working 2.6 kernel for APUS... 
> The other problem is time, but maybe I find some hours on weekend...

Yeah, no hurry.  I don't think we have to get this done before 2.6.0 is
out -- after all, it's only a driver.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
