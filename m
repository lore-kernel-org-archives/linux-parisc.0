From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Re: [fuse-devel] Example filesystem fail to
	init on parisc
Date: Sun, 19 Mar 2006 09:46:31 -0600
Message-ID: <1142783191.3240.14.camel__30923.6501031139$1416624589$gmane$org@mulgrave.il.steeleye.com>
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
Mime-Version: 1.0
Content-Type: text/plain
Cc: fuse-devel@lists.sourceforge.net,
 jick.nan@gmail.com,
 parisc-linux@parisc-linux.org,
 Chris Frost <chris@frostnet.net>,
 Miklos Szeredi <miklos@szeredi.hu>
To: Hugh Dickins <hugh@veritas.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.61.0603191526250.4440@goblin.wat.veritas.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2006-03-19 at 15:38 +0000, Hugh Dickins wrote:
> Certainly, that is part of what copy_to_user and get_user_pages(,,,,1,,,)
> (and ordinary userspace writing) guarantee.  So if there's some new route
> by which userspace pages may be modified on behalf of the user, never mind
> the architecture-specific cache coherency issues, COWs must be broken to
> preserve the semantics of fork.

Yes, that's where I think the problem lies.  For an anonymous unshared
page, the user view of the cache may still be dirty.  get_user_pages()
only seems to use flush_dcache_page() to restore coherency, which won't
work on anon pages.  Thus, get_user_pages() for an anon page is
returning a page to the kernel that still has an incoherent user cache,
which is what causes the issues in the copytest module.

> drivers/scsi/sg.c looks like it makes all the necessary calls to
> __copy_to_user or get_user_pages... but it's not hard to fool me.

Yes ... and the copytest module has an almost exact duplicate of that
code ... it's the actual get_user_pages() where I think we have
coherency issues ... I've verified that it is returning an incoherent
page if the underlying user page is PAGE_MAPPING_ANON.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
