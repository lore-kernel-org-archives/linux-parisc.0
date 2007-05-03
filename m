From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] memory management issues
Date: Thu, 03 May 2007 14:47:51 -0500
Message-ID: <1178221672.3714.55.camel__7733.34910995818$1416624350$gmane$org@mulgrave.il.steeleye.com>
References: <65dd6fd50704301144k77003d1he9f85f4bb6cf2ace@mail.gmail.com>
	<1178149192.3712.28.camel@mulgrave.il.steeleye.com>
	<65dd6fd50705021652s3b3b721dl6a8323259cd4efa9@mail.gmail.com>
	<1178153532.3712.39.camel@mulgrave.il.steeleye.com>
	<65dd6fd50705030111i993390bx829ee5eb8a188462@mail.gmail.com>
	<1178203985.3714.11.camel@mulgrave.il.steeleye.com>
	<65dd6fd50705031055p1fa02d55j6fd729239ea35d38@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>,
 parisc-linux@lists.parisc-linux.org
To: Ollie Wild <aaw@google.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <65dd6fd50705031055p1fa02d55j6fd729239ea35d38@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, 2007-05-03 at 10:55 -0700, Ollie Wild wrote:
> This doesn't work because we're copying between two different
> mm_struct's.  Since we can't have both active at the same time, we
> need to setup some sort of temporary mapping.
> 
> I could maybe check the vma boundaries and create new pages in the
> kernel, but I still need to assign them to the process space to make
> them swappable.  Since some binfmt's remove args, I'll also
> potentially need to reload old pages, which means copy_strings() will
> still need to call get_user_pages() to retrieve potentially swapped
> out pages.

OK, then you'll just have to go with flush_cache_page() ... it should be
reasonably efficient on parisc since I modified it to do non-current
flushing (which is really what you're doing).  However, you should be
aware that the original parisc implementation threw up its hands and
flushed the entire cache if it found a non-current page ... so if any
other architecture still does that, it will be remarkably inefficient
for you ...

I could give you an API on parisc to copy from one user process to
another via the user cache (which would avoid the coherence issues) but
I'm not sure it would necessarily be portable to other architectures.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
