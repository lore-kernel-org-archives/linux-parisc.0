Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 9 Apr 2003 09:47:32 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Alexander Gabert <pappy@nikita.ath.cx>
Cc: grsecurity@grsecurity.net, willy@debian.org,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] parisc-linux.org kernel
Message-ID: <20030409154732.GB4503@dsl2.external.hp.com>
References: <20030408165306.GA15433@nikita.ath.cx> <20030408165825.GB23430@parcelfarce.linux.theplanet.co.uk> <20030408170612.GA15497@nikita.ath.cx> <20030408170839.GC23430@parcelfarce.linux.theplanet.co.uk> <20030409054929.GB21306@dsl2.external.hp.com> <52352.145.253.137.30.1049874876.squirrel@nikita.ath.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <52352.145.253.137.30.1049874876.squirrel@nikita.ath.cx>
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

On Wed, Apr 09, 2003 at 09:54:36AM +0200, Alexander Gabert wrote:
> background:
> b) parisc-linux.org is then mainstreamed in 2.5 and will discontinue
> "split development"c) parisc-linux kernel _boots_ and _works_ and is _continued_ to be
> developed in _MAINSTREAM_ not in parisc-linux.org CVS
> i want that to happen anyway.  not just for grsec patches.
> it is a sad joke that parisc-linux.org kernels are good and the kernel.org
> parisc source is just a silly excuse for not having the parisc-linux.org
> sources melt in.  sorry for that.

No - you don't understand the roles of the various trees.

The CVS on parisc-linux.org will *always* be authoritative tree
for parisc-linux. It should be considered a "developement" branch
for kernel.org. This is true for nearly every architecture
except i386 (and alpha?) which are maintained by issueing
a patch against kernel.org.


> right, in this stadium i can "oversee" the necessary patches:
> 
> i strip the nonparisc, multiplatform support away with a perl script,
> fiddle with about 3-4 hunks that have to be taken out because they already
> exist in parisc source (for example latest ptrace kernel exploit), another
> 6-10 "look at it and try to intelligently put it into the slightly
> different parisc source" and the rest is "make up" like double insertions,
> typos and the like :-)

Oh cool - so it's not as bad as I thought...can you run
diffstat on the various "hunks" you've got?

> >> we're mostly
> >> merged for 2.5 and i'd rather spend my time working on that.
> 
> okay, this basically means to wait for a 2.5.* grsec patch and in the
> meantime continue hacking in the grsec patches by hand, which is just what

You hopefully won't have nearly the same problems as with 2.4.
(grsec team working on stale arch/parisc code)

...
> with the help of the PaX team, yesterday i managed to get the 199f patch
> going on my 712, with all GRKERNSEC* options enabled but just a little
> PAGEEXEC "brute disabled routine" in binfmt_elf.c that inverses the
> behaviour of chpax -p, i will get into that later today when i come home.
> http://nikita.ath.cx/users/pappy/grsec/199f/parisc-linux-2.4.20-pa32-grsecurity-1.9.9f-parisc-only.patch

very cool.

> thanks for your support and that you are dealing with this issue so
> friendly and open minded.

thanks too,
grant
