Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sisko.scot.redhat.com (82-41-8-82.cable.ubr02.edin.blueyonder.co.uk [82.41.8.82])
	by dsl2.external.hp.com (Postfix) with ESMTP id 258C6483E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Sep 2003 04:47:48 -0600 (MDT)
Subject: Re: [Fwd: [parisc-linux] Problems with raw interface.]
From: "Stephen C. Tweedie" <sct@redhat.com>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Matthew Wilcox <willy@debian.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>,
	Ranjith Sudarsanan <ranjith_sudarsanan@hp.com>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>,
	Stephen Tweedie <sct@redhat.com>
In-Reply-To: <20030922050016.GB30351@dsl2.external.hp.com>
References: <1063919293.16536.2.camel@dhcp23.swansea.linux.org.uk>
	 <1063989244.2834.48.camel@sisko.scot.redhat.com>
	 <20030921053555.GA5312@dsl2.external.hp.com>
	 <20030921142504.GD13172@parcelfarce.linux.theplanet.co.uk>
	 <20030922050016.GB30351@dsl2.external.hp.com>
Content-Type: text/plain
Message-Id: <1064227649.3071.6.camel@sisko.scot.redhat.com>
Mime-Version: 1.0
Date: 22 Sep 2003 11:47:30 +0100
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

Hi,

On Mon, 2003-09-22 at 06:00, Grant Grundler wrote:

> BTW, I suspect the following code in 2.4.22 mm/memory.c:map_user_kiobuf()
> deals with this problem:
> 	...
>         while (pgcount--) {
> 	                /* FIXME: flush superflous for rw==READ,
> 			*  probably wrong function for rw==WRITE
> 			*/
> 			flush_dcache_page(iobuf->maplist[pgcount]);
> 	}
> 	...
> 
> [ I got here because rw_raw_dev() calls map_user_kiobuf().]

Well, it might do.  It depends on the architecture, and I know zip about
the parisc cache architecture.  

For writes, we may need to flush cache writes to ram before the IO to
ensure ram is up-to-date.  For reads. we may need to flush pending
writeback before the IO (to ensure that prior cache operations don't end
up being committed on top of the new IO), plus we need to flush the
entire region out of cache after the IO in order to make the new
contents visible.

Where that needs to be done will depend on whether your cache flush
instructions work from physical or virtual addresses.  brw_koivec() is
the place to deal with physical cache flushes and invalidations, as
that's where we do the low-level IO on the struct page.  But you'll need
to do it at a higher level within the raw.c driver itself if you need
access to the virtual addresses.

--Stephen
