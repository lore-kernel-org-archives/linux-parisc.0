From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Proposal for implementing IRQ affinity
Date: Tue, 31 Aug 2004 23:19:09 +0100
Message-ID: <20040831221909.GC642@parcelfarce.linux.theplanet.co.uk>
References: <1093923097.3870.18.camel@mulgrave>
	<20040831192112.GH20353@colo.lackof.org>
	<20040831192811.GB642@parcelfarce.linux.theplanet.co.uk>
	<200408311626.16860.mszick@wolfbutter.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "Michael S. Zick" <mszick@wolfbutter.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200408311626.16860.mszick@wolfbutter.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Aug 31, 2004 at 04:26:16PM -0500, Michael S. Zick wrote:
> On Tue August 31 2004 14:28, Matthew Wilcox wrote:
> > In any case, ISA devices don't have subdevices.
> 
> But, for instance, DigiBoard has 4, 8, (16?) subdevices
> which are distingushed in the driver in cooperation with
> the on-board processor.

But they're 4/8/16 of the same thing, not a set of completely different
devices with independent drivers that all expect to call request_irq()
and get reasonable results.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
