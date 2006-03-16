From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Re: [fuse-devel] Example filesystem fail to
	init on parisc
Date: Thu, 16 Mar 2006 10:58:06 -0600
Message-ID: <1142528286.3244.19.camel__788.053617771034$1416624587$gmane$org@mulgrave.il.steeleye.com>
References: <20060308071445.GA28275@pooh.bubble.frostnet.net>
	<E1FGwXn-0005Dh-00@dorka.pomaz.szeredi.hu>
	<20060309055002.GJ26474@pooh.bubble.frostnet.net>
	<E1FHKQR-0007JU-00@dorka.pomaz.szeredi.hu>
	<20060309223622.GP26474@pooh.bubble.frostnet.net>
	<E1FHfby-00052b-00@dorka.pomaz.szeredi.hu>
	<20060310230000.GX26474@pooh.bubble.frostnet.net>
	<E1FIlC6-0005ts-00@dorka.pomaz.szeredi.hu>
	<20060316161336.GA16771@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: fuse-devel@lists.sourceforge.net,
 parisc-linux@parisc-linux.org,
 chris@frostnet.net,
 Miklos Szeredi <miklos@szeredi.hu>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060316161336.GA16771@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, 2006-03-16 at 09:13 -0700, Grant Grundler wrote:
> On Mon, Mar 13, 2006 at 12:26:34PM +0100, Miklos Szeredi wrote:
> > OK.  I'm out of ideas, CC-ing parisc-linux, maybe they can help shed
> > some light on this.
> 
> Miklos,
> I took a quick look last week but didn't see anything obvious.
> I was suspicious of the memcopy() calls to copy stuff to
> user space. But willy me told those are fine if using the
> result of kmap() (and then kunmap'ing when done).

Sorry, meant to reply earlier.

> > The reason appears to be that when the userspace filesystem reads from
> > the FUSE device, the kernel doesn't copy any data to the userspace
> > read buffer, though the correct size is returned by read().
> > 
> > FUSE uses a combination of get_user_pages(), kmap_atomic() and
> > memcpy().  After kunmap_atomic(), flush_dcache_page() is called to
> > avoid virtual aliasing.  The data in the read buffer is totally
> > untouched.

This is wrong.  A VIPT cache requires a mapping to flush on.  If you
kunmap, you've lost the mapping.  What you should do is

kmap()
operate on data
flush_kernel_dcache_page()
kunmap()

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
