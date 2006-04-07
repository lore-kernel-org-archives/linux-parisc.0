From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [fuse-devel] Re: [parisc-linux] [PATCH] Fixs to work on ARM
	and PARIC platforms.
Date: Fri, 07 Apr 2006 21:11:55 +0200
Message-ID: <E1FRwN9-0001PS-00__36798.6099598513$1416624047$gmane$org@dorka.pomaz.szeredi.hu>
References: <e739902b0604010122tefc6ab5radf8121eea8a3015@mail.gmail.com>
	<1143906395.3368.10.camel@mulgrave.il.steeleye.com>
	<E1FPjJe-0001cw-00@dorka.pomaz.szeredi.hu>
	<1143931084.3368.18.camel@mulgrave.il.steeleye.com>
	<E1FPyD6-0002ag-00@dorka.pomaz.szeredi.hu>
	<1143986960.3865.5.camel@mulgrave.il.steeleye.com>
	<E1FQOzi-0007VZ-00@dorka.pomaz.szeredi.hu>
	<1144135400.3552.11.camel@mulgrave.il.steeleye.com>
	<E1FQhEh-0000Vz-00@dorka.pomaz.szeredi.hu>
	<1144165204.3597.13.camel@mulgrave.il.steeleye.com>
	<E1FQo4N-000159-00@dorka.pomaz.szeredi.hu>
	<1144282046.3214.7.camel@mulgrave.il.steeleye.com>
	<E1FRON9-0005rC-00@dorka.pomaz.szeredi.hu>
	<1144323026.4076.1.camel@mulgrave.il.steeleye.com>
	<E1FRT6N-0006Ax-00@dorka.pomaz.szeredi.hu>
	<1144412751.3606.7.camel@mulgrave.il.steeleye.com>
Cc: fuse-devel@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <1144412751.3606.7.camel@mulgrave.il.steeleye.com> (message from
	James Bottomley on Fri, 07 Apr 2006 08:25:50 -0400)
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > > > How about this?
> > > 
> > > It would double flush the page on a lot of architectures
> > 
> > Which?
> 
> Well ... all of them.  Anonymous pages coming into get_user_pages() is
> pretty much the exception.

I don't think that holds, since I would imagine most user pages _are_
anonymous.

Ptrace is one of the more notable users of get_user_pages() so I
checked what happens if I run 'strace /bin/true' on an instrumented
kernel.

Anon pages won by 214 to 26.

> You do this for every page.  But anyway, even if you fixed that,
> Dave Miller vetoed an implementation based on flush_cache_page() on
> the grounds that the implementation is nop'd on quite a few
> architectures because of the way it's used

Sounds like another case of a crappy interface.

But I don't care overmuch.  I'll submit a patch for ARM and let this
issue rest in peace.

Anyway, thanks for the fast course on CPU caches :)

Miklos
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
