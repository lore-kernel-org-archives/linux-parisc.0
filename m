From: Hugh Dickins <hugh@veritas.com>
Subject: Re: [parisc-linux] Re: [fuse-devel] Example filesystem fail to init
	on parisc
Date: Sun, 19 Mar 2006 10:52:49 +0000 (GMT)
Message-ID: <Pine.LNX.4.61.0603191033480.9273__34382.1455877789$1416624589$gmane$org@goblin.wat.veritas.com>
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
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: fuse-devel@lists.sourceforge.net,
 jick.nan@gmail.com,
 parisc-linux@parisc-linux.org,
 Chris Frost <chris@frostnet.net>,
 Miklos Szeredi <miklos@szeredi.hu>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1142750588.3773.26.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 19 Mar 2006, James Bottomley wrote:
> 
> However, the problem appears to be that the user pointer is coming from
> malloc'd memory, which is of type PAGE_MAPPING_ANON.  This flag ensures
> that page_mapping(page) returns NULL and thus that flush_dcache_page()
> on parisc never actually does any user space flushes.
> 
> The reason you see nothing when you cat /proc/fs/test is that these
> PAGE_MAPPING_ANON pages for malloc() have a nice trick where the
> clear_user_highpage() function blasts a string of zeros over them via
> the cache in user space, so they're cache incoherent; you can modify the
> underlying page as much as you like, but the data the user sees is the
> zeros until the page is flushed.  This is the essence of the problem:
> flush_dcache_page() isn't bringing these user pages back into coherency.
> 
> Just as proof of this, if you uncomment the asm in my_copy_to_user2,
> you'll see everything work correctly, because this asm statement forces
> coherency on the user page.
> 
> So, Hugh, you were the one who introduced this anonymous page behaviour;
> how are we supposed to obtain coherency for these pages?

I don't think I changed any behaviour here, just implemention details
(what you might expect to find stored in "page->mapping" in different
circumstances).  Comparing current parisc source against 2.6.5 source
(several releases before PAGE_MAPPING_ANON) bears that out, doesn't it?
page->mapping on anonymous pages at that time would have been NULL (or
&swapper_space if the page happened to have some swap assigned to it).

Isn't the point simply that anonymous pages are never writably shared,
and so don't require the coherency measures that shared writable pages
do?  Anonymous pages may be shared readonly between children and parent
of fork (and any modification requires Copy-On-Write at either end).
There are MAP_SHARED|MAP_ANONYMOUS pages, but those are implemented
like shared memory, as pages of an underlying tmpfs object (to which
page->mapping will point as for a normal file).

Whereas now Chris is working on a /proc file which gives access to
anonymous pages by a backdoor?  That's new territory, and may indeed
need something special such as you appended.  It might be something
very useful for local use, but I doubt it would be accepted into a
mainline kernel.

Hugh
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
