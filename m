Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from postfix.fh-schmalkalden.de (pop3.fh-schmalkalden.de [194.94.30.58])
	by dsl2.external.hp.com (Postfix) with ESMTP id 84AED48C7
	for <parisc-linux@parisc-linux.org>; Tue,  7 Oct 2003 14:24:20 -0600 (MDT)
Date: Tue, 7 Oct 2003 22:22:09 +0200
From: Rene Brothuhn <rene.br@web.de>
To: Matthew Wilcox <willy@debian.org>
Cc: Rene Brothuhn <rene.br@web.de>,
	Matthew Wilcox <willy@debian.org>,
	Roman Zippel <zippel@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	parisc-linux@parisc-linux.org, linux-apus-devel@lists.sourceforge.net
Message-ID: <20031007202209.GA2375@ipgraf11.informatik.fh-schmalkalden.de>
Reply-To: rene.br@web.de
References: <Pine.GSO.4.21.0309291116250.7432-100000@vervain.sonytel.be> <Pine.LNX.4.44.0309291434260.17812-100000@serv> <20030929133317.GP24824@parcelfarce.linux.theplanet.co.uk> <20030929212501.GA2631@ipgraf11.informatik.fh-schmalkalden.de> <20030930022132.GU24824@parcelfarce.linux.theplanet.co.uk> <20030930135932.GA10395@ipgraf11.informatik.fh-schmalkalden.de> <20030930143250.GX24824@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset=ISO-8859-1
In-Reply-To: <20030930143250.GX24824@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Tue, Sep 30, 2003 at 16:32:50 +0200
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

Hello!

On 2003.09.30 16:32 Matthew Wilcox wrote:
> On Tue, Sep 30, 2003 at 03:59:32PM +0200, Rene Brothuhn wrote:
> > but the 720/770 registers are slightly different.
> > Is the NCR_Q720 or zalon driver working?
> 
> Yes, they're both working fine.
> 
> I went over the 770 register definitions the other night and only found
> one difference between the names of the definitions in the sym53c8xx_defs
> file and the 770 PDF and that was:
> 
> -/*3a*/  u_char    nc_sbr;
> +/*3a*/  u_char    nc_sbr; /* dwt on 720 */
> 
> This is the DMA watchdog timer, but it's not actually used by the driver.
> It's a `scratch byte register' on the 895.  Some of the `reserved'
> fields in the 770 register definition have names, but they were only
> ever touched if the chip was a sufficiently recent revision.
> 
> BTW, I couldn't see a document for the 720 chip on the LSI site -- only
> the 710 and 770.  I presume I won't go far wrong treating them the same.

Sorry for reacting so late. I also have no doc for the 720, but I think 
the differences between 770 and 720 are not so big.
I'm sure there are a lot more differences between the 8xx and 720/770. Not 
only the registers or register names but also the bits inside some 
registers are slightly different.
I have some PDF's on which the differences between the chips are 
described. It seems that these docs are not available anymore on the LSI 
site. I'll send it directly to you, because the size is to much for the 
list.
I hope this will help you.

I have looked into the driver a little bit last weekend and I guess it 
should be possible to provide a 770 definition into the driver. But first 
I have to got a workable 2.6 kernel...


Ciao, Renè
