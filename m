From: Hugh Dickins <hugh@veritas.com>
Subject: Re: [parisc-linux] Re: [fuse-devel] Example filesystem fail to init
	on parisc
Date: Sun, 19 Mar 2006 16:37:11 +0000 (GMT)
Message-ID: <Pine.LNX.4.61.0603191614210.4908__32930.330586578$1416624590$gmane$org@goblin.wat.veritas.com>
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
	<1142777049.3240.6.camel@mulgrave.il.steeleye.com>
	<Pine.LNX.4.61.0603191526250.4440@goblin.wat.veritas.com>
	<1142783191.3240.14.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: Andrew Morton <akpm@osdl.org>,
 Miklos Szeredi <miklos@szeredi.hu>,
 fuse-devel@lists.sourceforge.net,
 Chris Frost <chris@frostnet.net>,
 jick.nan@gmail.com,
 "David S. Miller" <davem@davemloft.net>,
 parisc-linux@parisc-linux.org
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1142783191.3240.14.camel@mulgrave.il.steeleye.com>
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
> On Sun, 2006-03-19 at 15:38 +0000, Hugh Dickins wrote:
> > Certainly, that is part of what copy_to_user and get_user_pages(,,,,1,,,)
> > (and ordinary userspace writing) guarantee.  So if there's some new route
> > by which userspace pages may be modified on behalf of the user, never mind
> > the architecture-specific cache coherency issues, COWs must be broken to
> > preserve the semantics of fork.
> 
> Yes, that's where I think the problem lies.  For an anonymous unshared
> page, the user view of the cache may still be dirty.  get_user_pages()
> only seems to use flush_dcache_page() to restore coherency, which won't
> work on anon pages.  Thus, get_user_pages() for an anon page is
> returning a page to the kernel that still has an incoherent user cache,
> which is what causes the issues in the copytest module.
> 
> > drivers/scsi/sg.c looks like it makes all the necessary calls to
> > __copy_to_user or get_user_pages... but it's not hard to fool me.
> 
> Yes ... and the copytest module has an almost exact duplicate of that
> code ... it's the actual get_user_pages() where I think we have
> coherency issues ... I've verified that it is returning an incoherent
> page if the underlying user page is PAGE_MAPPING_ANON.

It sounds like an issue you need to raise on linux-arch?  I've no idea
whether it's the parisc implementation of flush_dcache_page which is
at fault (skipping anonymous pages), or that get_user_pages ought to
be calling something stronger (something new?).  Remember, I'm one of
those x86 people with only a nursery-school grasp of coherency issues.

I do see that when flush_dcache_page was added into get_user_pages in
2.5.46, the parisc flush_dcache_page looked to be doing something else,
something which would have caught the anonymous pages.  And I just
looked up the ChangeLog-2.5.46 entry, below: akpm and davem CC'ed.

<akpm@digeo.com>
  [PATCH] flush_dcache_page in get_user_pages()
  
  Davem said:
  
  "Ho hum, it is tricky :-)))
  
   At bio_map_user() you need to see the user's most recent write to the
   page if you are going "user --> device".  So if "user --> device"
   bio_map_user() must flush_dcache_page().
  
   I find the write_to_vm condition confusion which is probably why I am
   sitting here spelling this out :-)
  
   At bio_unmap_user(), if we are going "device --> user" you have to
   flush_dcache_page().  And actually, this flush could just as
   legitimately occur at bio_map_user() time.
  
   Therefore, the easiest thing to do is always flush_dcache_page() at
   bio_map_user().
  
   All the other cases are going to be like this, so we might as well
   cut to the chase and flush_dcache_page() for all the pages inside of
   get_user_pages()."
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
