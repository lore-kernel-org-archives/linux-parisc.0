From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ASSERT() -> BUG_ON() (2/4):
	drivers/parisc/sba_iommu.c
Date: Sun, 7 Nov 2004 19:04:33 -0700
Message-ID: <20041108020433.GC16345@colo.lackof.org>
References: <418E1ED4.8070104@tiscali.be>
	<20041107213942.GA16345@colo.lackof.org>
	<20041108000502.GN24690@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041108000502.GN24690@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Nov 08, 2004 at 12:05:02AM +0000, Matthew Wilcox wrote:
> GCC warns about this.

Ok - I didn't know that. 
Thanks for pointing this out.

I expect it wouldn't generate warnings in this case because arguments
to macros typically have extra parens around them. But in general,
I can stop doing this for kernel code since -Wall is on.

> So I think this is an invalid objection.

Agreed. I'll change the offending code.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
