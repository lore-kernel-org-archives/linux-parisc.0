Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 29 Jun 2003 15:33:01 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] byte swapping redux
Message-ID: <20030629213301.GA24957@dsl2.external.hp.com>
References: <20030629181415.GA21094@dsl2.external.hp.com> <20030629184150.GX31618@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030629184150.GX31618@parcelfarce.linux.theplanet.co.uk>
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

On Sun, Jun 29, 2003 at 07:41:50PM +0100, Matthew Wilcox wrote:
> Protection against userspace inclusion.  Which shouldn't be happening
> of course, but some userspace programs are crap.

What are they protecting against?
I'll remove it.

> > I'm pretty sure we don't want __SWAB_64_THRU_32__ defined.
> > PA-RISC version of ___arch__swab64() is appropriately defined for
> > both 32 and 64-bit compiles.
> 
> Take it out then; if it works, commit it (to 2.5 anyway).

well, I'm still looking at 2.4.x...you know about the problems I had
finding my boot disk on the rx2600 (ia64) when trying to boot 2.5.72.
I'm not keen on reproducing experience on parisc this weekend.

I was actually trying to get up to speed to test/review Joel's patch.

BTW, Prelimary diff on ftp://ftp.p-l.o/patches/diff-2.4.21-pa1
attempts to fix the byteorder.h mess and first cut at trying
to get intermezzo to build. But intermezzo won't assemble because
it has field alignment (ldd 52(x) instruction) problems.


thanks,
grant
