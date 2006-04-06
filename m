From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [fuse-devel] Re: [parisc-linux] [PATCH] Fixs to work on ARM
	and PARIC platforms.
Date: Wed, 05 Apr 2006 20:07:26 -0400
Message-ID: <1144282046.3214.7.camel__40984.6630217091$1416624047$gmane$org@mulgrave.il.steeleye.com>
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
Mime-Version: 1.0
Content-Type: text/plain
Cc: fuse-devel@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org
To: Miklos Szeredi <miklos@szeredi.hu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <E1FQo4N-000159-00@dorka.pomaz.szeredi.hu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 2006-04-04 at 18:07 +0200, Miklos Szeredi wrote:
> > No, because if you look at the implementation, you'll see that
> > copy_to/from_user() copy straight into the user view (i.e. via the user
> > cache lines).
> 
> Yes.  But how will this ensure that the above problems (dirty/clean
> cache lines in aliases) won't cause any problems?

It doesn't.  The object is to write into the user cache as though the
actual user process had done it (i.e. disregarding all aliasing).

> What is the difference between
> 
>  - updating cached data through the user view
> 
>  - flushing the cache lines for the user view, then updating data
>    through the kernel view and finally flushing the cache lines for
>    the kernel view

In the former, the data usually ends up in dirty user cache lines.  In
the latter the cache lines are entirely clean after the procedure.

> I don't see in either case that the cache lines for any other aliases
> are touched.  Is there still some difference in behavior?

Yes, in the former, only a single alias (the user view) is affected.  In
the latter, all views are accounted for.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
