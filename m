From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Proposal for implementing IRQ affinity
Date: Tue, 31 Aug 2004 13:48:37 -0600
Message-ID: <20040831194837.GA24477@colo.lackof.org>
References: <1093923097.3870.18.camel@mulgrave>
	<20040831171421.GC20353@colo.lackof.org>
	<20040831174357.GQ16196@parcelfarce.linux.theplanet.co.uk>
	<20040831180635.GF20353@colo.lackof.org>
	<20040831185750.GS16196@parcelfarce.linux.theplanet.co.uk>
	<20040831192112.GH20353@colo.lackof.org>
	<20040831192811.GB642@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040831192811.GB642@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Aug 31, 2004 at 08:28:11PM +0100, Matthew Wilcox wrote:
> So PA-RISC supports ISA and ia64 doesn't :-P

yes, thanks for the correction. You are right.
I was staring at arch/ia64/kernel/iosapic.c...only it has ISA support.

> > Seriously, what problem does LASI bring that can't be handled with
> > a global array?
> 
> The subdevices that can't have their own processor interrupt.

That has nothing to do with using a global IRQ array.
It just means LASI subdevices can't be redirected individually.
They will still be assigned a global IRQ number.
PCI devices using IRQ lines below DINO will have the same problem.
Ditto for E/ISA support under WAX.

thanks for the correction,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
