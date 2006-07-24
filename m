From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] The problem on the PA8800 is all in the data-cache.
Date: Mon, 24 Jul 2006 10:32:28 -0600
Message-ID: <20060724163228.GA22560@colo.lackof.org>
References: <119aab440607221050w3b6a949j49862c2766d5c7ef@mail.gmail.com>
	<1153708426.1235.11.camel@mulgrave.il.steeleye.com>
	<7d01f9f00607231954m7b9992e8r6148bb26b7b461da@mail.gmail.com>
	<20060724033223.GE29603@parisc-linux.org>
	<7d01f9f00607232115n18865924s4f07f64d84e45dce@mail.gmail.com>
	<1153750204.1235.18.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Matthew Wilcox <matthew@wil.cx>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>,
 Thibaut VARENE <T-Bone@parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1153750204.1235.18.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jul 24, 2006 at 09:10:04AM -0500, James Bottomley wrote:
> What Matthew means is that the L2 cache is PIPT ... you can't get
> aliasing effects in a PIPT cache, so for the purposes of the problem it
> must be ignorable, since we can only get aliasing effects in the L1
> cache which is VIPT.

While I agree in general that a PIPT cache won't have aliasing effects.
ISTR the virtual coherence index (VCI) is part of the "physical address".
If it's not, I'm confused how CPUs on different sockets remain coherent.
I expect the VCI is visible across the Mckinley Bus and thus is part
of the physical address. IOMMU is also pushing out an address that
has VCI bits in it - so DMA remains coherent with CPU virtual addresses.

If I've got this right, then we can have aliasing in PIPT cache.
Willy, can you check the pa8800 ERS and look for "coherence index"
or similar, related words?

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
