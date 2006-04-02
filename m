From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [fuse-devel] Re: [parisc-linux] [PATCH] Fixs to work on ARM
	and PARIC platforms.
Date: Sun, 02 Apr 2006 09:09:20 -0500
Message-ID: <1143986960.3865.5.camel__11713.1739658818$1416624041$gmane$org@mulgrave.il.steeleye.com>
References: <e739902b0604010122tefc6ab5radf8121eea8a3015@mail.gmail.com>
	<1143906395.3368.10.camel@mulgrave.il.steeleye.com>
	<E1FPjJe-0001cw-00@dorka.pomaz.szeredi.hu>
	<1143931084.3368.18.camel@mulgrave.il.steeleye.com>
	<E1FPyD6-0002ag-00@dorka.pomaz.szeredi.hu>
Mime-Version: 1.0
Content-Type: text/plain
Cc: fuse-devel@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org
To: Miklos Szeredi <miklos@szeredi.hu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <E1FPyD6-0002ag-00@dorka.pomaz.szeredi.hu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2006-04-02 at 10:45 +0200, Miklos Szeredi wrote:
> I'm confused.  What was the exact reason for having a separate
> function for anon pages?  Wouldn't unifying the functionality of
> flush_dcache_page() and flush_anon_page() make more sense?

No because flush_dcache_page() is designed for filesystems, which should
never see anonymous pages.

> Otherwise sparc and ppc would have to check PageAnon() from both
> flush_dcache_page() and flush_anon_page() and call a common function,
> which seems to just complicate things without any gain.

I don't think what you propose is desirable or possible:
flush_dcache_pages() is designed not to have to flush them (it can't
actually because it can't find them properly) but it may flush them by
accident if they get swept up into the implementation.  Sparc and PPC
are CAM flushing implementations, so I suspect the cache just needs to
be asked to flush a single physical address and it will find all the
virtual aliases and flush them (including the anonymous pages).

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
