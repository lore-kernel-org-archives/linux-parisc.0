From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ASSERT() -> BUG_ON() (2/4):
	drivers/parisc/sba_iommu.c
Date: Mon, 8 Nov 2004 23:45:02 -0700
Message-ID: <20041109064502.GA21599@colo.lackof.org>
References: <418A80F700001304@mail-5-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <418A80F700001304@mail-5-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Grant Grundler wrote:
> no problem with getting rid of ASSERT.
> At this point, I'm more inclined to just delete most of them
> if they can't be replaced with something that's a compile time option.

I've removed all uses of ASSERT this weekend but couldn't test the result.
I couldn't boot the j6k test machine because of an old bug.
SBA code was clobbering the serial console when it called
pci_io_reset_devices(). I figured out some code that I *think* should
do the trick:
	ftp://ftp.parisc-linux.org/patches/diff-2.6.10-rc1-pa10-USB_reset

The ASSERT removal patch (untested) is on:
	ftp://ftp.parisc-linux.org/patches/diff-2.6.10-rc1-pa11-02

Apologies for mixing it all up in one patch.
-pa11-02 patch has some other changes in it that I need to review again.
None of this will be committed until our CVS gets resurrected
and I'll split it up if someone sees that as necessary.


Joel Soete wrote:
> mmm, reading also Matthew's answer, I don't see what kind of sol should
> we adopt to avoid "foo = 0" mistakes?

In general, the compiler will warn and I've re-arranged the code to
be more readable in those cases where no macro is used.

> I have no clue if some macros like:
> #define EQ(a, b) (a) == (b)
> ...
> would help (only one place to check but many macro's as NE, GT, GE, LT,
> LE)?

Well, in the case of macros one just has to be careful or
continue doing what I was doing before.

thanks,
grant

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
