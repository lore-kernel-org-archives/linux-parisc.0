From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Re: [fuse-devel] Example filesystem fail to
	init on parisc
Date: Sun, 19 Mar 2006 08:04:09 -0600
Message-ID: <1142777049.3240.6.camel__43182.8889683404$1416624590$gmane$org@mulgrave.il.steeleye.com>
References: <20060308071445.GA28275@pooh.bubble.frostnet.net>
	<E1FGwXn-0005Dh-00@dorka.pomaz.szeredi.hu>
	<20060309055002.GJ26474@pooh.bubble.frostnet.net>
	<E1FHKQR-0007JU-00@dorka.pomaz.szeredi.hu>
	<20060309223622.GP26474@pooh.bubble.frostnet.net>
	<E1FHfby-00052b-00@dorka.pomaz.szeredi.hu>
	<20060310230000.GX26474@pooh.bubble.frostnet.net>
	<E1FIlC6-0005ts-00@dorka.pomaz.szeredi.hu>
	<E1FJsHo-0006Yf-00@dorka.pomaz.szeredi.hu>
	<20060319043939.GP26474@pooh.bubble.frostnet.net>
	<1142750588.3773.26.camel@mulgrave.il.steeleye.com>
	<Pine.LNX.4.61.0603191033480.9273@goblin.wat.veritas.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: fuse-devel@lists.sourceforge.net,
 jick.nan@gmail.com,
 parisc-linux@parisc-linux.org,
 Chris Frost <chris@frostnet.net>,
 Miklos Szeredi <miklos@szeredi.hu>
To: Hugh Dickins <hugh@veritas.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.61.0603191033480.9273@goblin.wat.veritas.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2006-03-19 at 10:52 +0000, Hugh Dickins wrote:
> > So, Hugh, you were the one who introduced this anonymous page behaviour;
> > how are we supposed to obtain coherency for these pages?
> 
> I don't think I changed any behaviour here, just implemention details
> (what you might expect to find stored in "page->mapping" in different
> circumstances).  Comparing current parisc source against 2.6.5 source
> (several releases before PAGE_MAPPING_ANON) bears that out, doesn't it?
> page->mapping on anonymous pages at that time would have been NULL (or
> &swapper_space if the page happened to have some swap assigned to it).

OK ... I just remember you introducing the page_mapping() macro ...

> Isn't the point simply that anonymous pages are never writably shared,
> and so don't require the coherency measures that shared writable pages
> do?  Anonymous pages may be shared readonly between children and parent
> of fork (and any modification requires Copy-On-Write at either end).
> There are MAP_SHARED|MAP_ANONYMOUS pages, but those are implemented
> like shared memory, as pages of an underlying tmpfs object (to which
> page->mapping will point as for a normal file).

Yes, this is precisely the point.  While it is true that anonymous pages
shouldn't be writeably shared and therefore no coherence measures should
be necessary between user space processes, anonymous pages are still not
congruently mapped in our kernel, so we have to take coherency measures
when trying to view them from the kernel.

> Whereas now Chris is working on a /proc file which gives access to
> anonymous pages by a backdoor?  That's new territory, and may indeed
> need something special such as you appended.  It might be something
> very useful for local use, but I doubt it would be accepted into a
> mainline kernel.

Well, yes, I think fuse is guilty to some degree.  However, the same
situation would prevail if anonymous memory were sent down to our other
kernel<->user mapping routines, like SG_IO for instance.  Perhaps we
should be doing early cow breaking for anonymous pages we know we're
going to write to?

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
