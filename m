From: "Ollie Wild" <aaw@google.com>
Subject: Re: [parisc-linux] memory management issues
Date: Thu, 3 May 2007 10:55:19 -0700
Message-ID: <65dd6fd50705031055p1fa02d55j6fd729239ea35d38__9339.01536413959$1416624350$gmane$org@mail.gmail.com>
References: <65dd6fd50704301144k77003d1he9f85f4bb6cf2ace@mail.gmail.com>
	<1178149192.3712.28.camel@mulgrave.il.steeleye.com>
	<65dd6fd50705021652s3b3b721dl6a8323259cd4efa9@mail.gmail.com>
	<1178153532.3712.39.camel@mulgrave.il.steeleye.com>
	<65dd6fd50705030111i993390bx829ee5eb8a188462@mail.gmail.com>
	<1178203985.3714.11.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>,
 parisc-linux@lists.parisc-linux.org
To: "James Bottomley" <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1178203985.3714.11.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Really, given the page is already present and cached in user space, why
> not just copy through the user mappings instead of trying to map the
> pages into the kernel an then fix up coherence issues, copy then push
> the coherency back to the user ... the API you want is copy_in_user().

This doesn't work because we're copying between two different
mm_struct's.  Since we can't have both active at the same time, we
need to setup some sort of temporary mapping.

I could maybe check the vma boundaries and create new pages in the
kernel, but I still need to assign them to the process space to make
them swappable.  Since some binfmt's remove args, I'll also
potentially need to reload old pages, which means copy_strings() will
still need to call get_user_pages() to retrieve potentially swapped
out pages.

Ollie
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
