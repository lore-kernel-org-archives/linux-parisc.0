Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 21 Sep 2003 23:00:16 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Cc: "Stephen C. Tweedie" <sct@redhat.com>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>,
	Ranjith Sudarsanan <ranjith_sudarsanan@hp.com>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [Fwd: [parisc-linux] Problems with raw interface.]
Message-ID: <20030922050016.GB30351@dsl2.external.hp.com>
References: <1063919293.16536.2.camel@dhcp23.swansea.linux.org.uk> <1063989244.2834.48.camel@sisko.scot.redhat.com> <20030921053555.GA5312@dsl2.external.hp.com> <20030921142504.GD13172@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030921142504.GD13172@parcelfarce.linux.theplanet.co.uk>
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

On Sun, Sep 21, 2003 at 03:25:04PM +0100, Matthew Wilcox wrote:
> > BTW, kernel and user space will alias to different cachelines
> > for the same 32-bit "offset" because of "Space Registers"
> > (form of segmented addressing).
> 
> Rubbish, they alias to the same cachelines because of the 4MB get-out
> clause.  What you may have meant is that the same page accessed through
> user and kernel mappings will alias to different cachelines because
> their addresses *aren't* congruent modulo 4MB.

yes - that's what I meant...I was thinking at least part of the reason
they aren't congruent is because they are in different "segments" (ie use
a different Space ID). Maybe I'm just confused by past experience where
Space ID hashing was enabled (HPUX); parisc-linux has never had space ID
hashing enabled (at least not intentionally).

BTW, I suspect the following code in 2.4.22 mm/memory.c:map_user_kiobuf()
deals with this problem:
	...
        while (pgcount--) {
	                /* FIXME: flush superflous for rw==READ,
			*  probably wrong function for rw==WRITE
			*/
			flush_dcache_page(iobuf->maplist[pgcount]);
	}
	...

[ I got here because rw_raw_dev() calls map_user_kiobuf().]

But for "READ" (inbound data), I think I need a call that will
invalidate cachelines for userspace addresses. Preferable *after*
the DMA has completed in order to avoid issues with data prefetching
by the CPU.  ie memory has the most recent copy and any CPU holding
cachelines for the kernel address range will be coherent.


> Those functions don't seem to exist in 2.6.  The only reference is:
> ./Documentation/block/biodoc.txt: of data, so brw_kiovec() invokes
> ll_rw_kio for each kiobuf in a kiovec.
> which seems to be an orphaned comment.
> 
> I'll reluctantly take a look at 2.4.

Well, the problem exists in 2.6 and is easy to reproduce.
Perhaps find the equivalent calls there and I'll backport the fix to 2.4?
I'm assuming what's broken is obvious once one finds the right code.

thanks,
grant
