Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: jsoe0708@tiscali.be, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Typo? 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Fri, 29 Nov 2002 15:04:11 GMT." <20021129150411.P1586@parcelfarce.linux.theplanet.co.uk>
References: <3DB577610000593D@ocpmta8.be.tiscali.com>  <20021129150411.P1586@parcelfarce.linux.theplanet.co.uk> 
Date: Mon, 02 Dec 2002 22:35:13 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021203053513.593464829@dsl2.external.hp.com>
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

Matthew Wilcox wrote:
> On Fri, Nov 29, 2002 at 10:57:50AM +0100, jsoe0708@tiscali.be wrote:
> > Here attached some diff which seems to be typo.
> 
> patch looks correct to me.  grant?

I was off on holiday...I guess I didn't advertise that well enough.

I just committed Joel's patch and just now realized it's *WRONG*.
I don't know why I thought sg_virt_address() was correct before.
Brain fart.

grundler <520>fgrep sg_virt include/asm-parisc/scatterlist.h 
#define sg_virt_addr(sg) (((sg)->address) ? ((sg)->address) : \

I'll fix my mess. *sigh*.
BTW, I'll fix pci-dma.c too. I've got the B180 to test it on tomorrow.

thanks!
grant
