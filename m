From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Proposal for implementing IRQ affinity
Date: Tue, 31 Aug 2004 13:21:12 -0600
Message-ID: <20040831192112.GH20353@colo.lackof.org>
References: <1093923097.3870.18.camel@mulgrave>
	<20040831171421.GC20353@colo.lackof.org>
	<20040831174357.GQ16196@parcelfarce.linux.theplanet.co.uk>
	<20040831180635.GF20353@colo.lackof.org>
	<20040831185750.GS16196@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040831185750.GS16196@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Aug 31, 2004 at 07:57:50PM +0100, Matthew Wilcox wrote:
> > Looks like that's what ia64 is doing and I don't see a problem with it.
> 
> ia64 doesn't have Lasi.

No, but ia64 supports ISA. :^)
(They have their own evils to deal with)

Seriously, what problem does LASI bring that can't be handled with
a global array?

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
