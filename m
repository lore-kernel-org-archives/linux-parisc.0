From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [parisc-linux] Re: [fuse-devel] Example filesystem fail to
	init on parisc
Date: Fri, 17 Mar 2006 10:13:19 +0100
Message-ID: <E1FKB1L-0002jY-00__15264.4970025451$1416624587$gmane$org@dorka.pomaz.szeredi.hu>
References: <20060308071445.GA28275@pooh.bubble.frostnet.net>
	<E1FGwXn-0005Dh-00@dorka.pomaz.szeredi.hu>
	<20060309055002.GJ26474@pooh.bubble.frostnet.net>
	<E1FHKQR-0007JU-00@dorka.pomaz.szeredi.hu>
	<20060309223622.GP26474@pooh.bubble.frostnet.net>
	<E1FHfby-00052b-00@dorka.pomaz.szeredi.hu>
	<20060310230000.GX26474@pooh.bubble.frostnet.net>
	<E1FIlC6-0005ts-00@dorka.pomaz.szeredi.hu>
	<20060316161336.GA16771@colo.lackof.org>
	<1142528286.3244.19.camel@mulgrave.il.steeleye.com>
Cc: fuse-devel@lists.sourceforge.net,
 parisc-linux@parisc-linux.org,
 chris@frostnet.net
To: James.Bottomley@SteelEye.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <1142528286.3244.19.camel@mulgrave.il.steeleye.com> (message from
	James Bottomley on Thu, 16 Mar 2006 10:58:06 -0600)
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > > FUSE uses a combination of get_user_pages(), kmap_atomic() and
> > > memcpy().  After kunmap_atomic(), flush_dcache_page() is called to
> > > avoid virtual aliasing.  The data in the read buffer is totally
> > > untouched.
> 
> This is wrong.  A VIPT cache requires a mapping to flush on.  If you
> kunmap, you've lost the mapping.  What you should do is
> 
> kmap()
> operate on data
> flush_kernel_dcache_page()
> kunmap()

OK, this didn't help.  Looking closer it didn't have a chance of
helping, since kunmap()/kunmap_atomic() are no-ops unless
CONFIG_HIGHMEM is set, but on parisc there's no highmem support.

Any other ideas?

Thanks,
Miklos

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
