From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [fuse-devel] Re: [parisc-linux] [PATCH] Fixs to work on ARM and
	PARIC platforms.
Date: Sat, 01 Apr 2006 18:51:10 +0200
Message-ID: <E1FPjJe-0001cw-00__25118.7718626626$1416624038$gmane$org@dorka.pomaz.szeredi.hu>
References: <e739902b0604010122tefc6ab5radf8121eea8a3015@mail.gmail.com>
	<1143906395.3368.10.camel@mulgrave.il.steeleye.com>
Cc: fuse-devel@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <1143906395.3368.10.camel@mulgrave.il.steeleye.com> (message from
	James Bottomley on Sat, 01 Apr 2006 09:46:35 -0600)
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Sat, 2006-04-01 at 01:22 -0800, Ryan Bradetich wrote:
> > --- fuse-2.6.0-pre2/kernel/dev.c.orig   2006-04-01 00:40:28.000000000
> > -0800
> > +++ fuse-2.6.0-pre2/kernel/dev.c        2006-04-01 00:40:43.000000000
> > -0800
> 
> Is this path just wrong and you meant fs/fuse/dev.c?

Yeah.  It's the out-of-tree version, which closely resembles the
in-tree one.

> In which case, the placement of the flush and the fact that
> flush_dcache_page() doesn't bring coherency indicates one of the input
> pages is incoherent at the user level.  So it looks like you have an
> anonymous page you haven't called get_user_pages() on .... and by the
> way, you have checked that you're actually using the kernel with the
> parisc implementations of flush_kernel_dcache_page() and
> flush_anon_page()?

BTW, these seem to be needed for ARM too.  Do you have any idea who I
should bug about this?  The MAINTAINERS file is far from clear on this
point.

Thanks,
Miklos
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
