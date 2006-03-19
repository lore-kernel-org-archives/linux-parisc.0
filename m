From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Re: [fuse-devel] Example filesystem fail to
	init on parisc
Date: Sun, 19 Mar 2006 10:50:48 -0600
Message-ID: <1142787049.3240.20.camel__14311.6683852442$1416624590$gmane$org@mulgrave.il.steeleye.com>
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
	<Pine.LNX.4.61.0603191614210.4908@goblin.wat.veritas.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Andrew Morton <akpm@osdl.org>,
 Miklos Szeredi <miklos@szeredi.hu>,
 fuse-devel@lists.sourceforge.net,
 Chris Frost <chris@frostnet.net>,
 jick.nan@gmail.com,
 "David S. Miller" <davem@davemloft.net>,
 parisc-linux@parisc-linux.org
To: Hugh Dickins <hugh@veritas.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.61.0603191614210.4908@goblin.wat.veritas.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2006-03-19 at 16:37 +0000, Hugh Dickins wrote:
> It sounds like an issue you need to raise on linux-arch?  I've no idea

Yes ... I think so.  I think the issue is that get_user_pages() has to
guarantee that every page it gets has no dirty user cache above it.

> whether it's the parisc implementation of flush_dcache_page which is
> at fault (skipping anonymous pages), or that get_user_pages ought to
> be calling something stronger (something new?).  Remember, I'm one of
> those x86 people with only a nursery-school grasp of coherency issues.

It seems to me that flush_dcache_page() should sweep up anonymous pages
as well ... as long as we have this pre-emptive coherency model where we
only call flush_dcache_page() once on entry so that as long as we exit
to user level having modified the underlying page memory (and the user
hasn't done anything to bring the page into their cache) then everything
works.

> I do see that when flush_dcache_page was added into get_user_pages in
> 2.5.46, the parisc flush_dcache_page looked to be doing something else,
> something which would have caught the anonymous pages.  And I just
> looked up the ChangeLog-2.5.46 entry, below: akpm and davem CC'ed.

Yes, I suspect our implementation should just sweep up anon pages
again ... However, I'll also compose a mailing for linux-arch just to be
sure we're all on the same page (no pun intended).

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
