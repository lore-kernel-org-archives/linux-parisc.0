Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 29 Sep 2003 14:55:48 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Roman Zippel <zippel@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linux/m68k <linux-m68k@lists.linux-m68k.org>,
	parisc-linux@parisc-linux.org, linux-apus-devel@lists.sourceforge.net
Subject: Re: [parisc-linux] Re: NCR53c720
Message-ID: <20030929205548.GA13226@dsl2.external.hp.com>
References: <Pine.GSO.4.21.0309291116250.7432-100000@vervain.sonytel.be> <Pine.LNX.4.44.0309291434260.17812-100000@serv> <20030929133317.GP24824@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.44.0309291818060.17548-100000@serv> <20030929162749.GR24824@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030929162749.GR24824@parcelfarce.linux.theplanet.co.uk>
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

On Mon, Sep 29, 2003 at 05:27:49PM +0100, Matthew Wilcox wrote:
> > Um, which one is the current right dma device API?
> 
> The one in Documentation/DMA-API.txt.

Matthew, which version of the source tree?
2.4.22 and 2.6.x versions of this file are not identical.

grundler@gsyprf3:/usr/src$ diff linux-2.?/Documentation/DMA-mapping.txt | wc -l
   117
grundler@gsyprf3:/usr/src$ wc -l linux-2.?/Documentation/DMA-mapping.txt
    798 linux-2.4/Documentation/DMA-mapping.txt
    828 linux-2.5/Documentation/DMA-mapping.txt
   1626 total

thanks,
grant
