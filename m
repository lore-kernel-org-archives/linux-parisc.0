From: "Ollie Wild" <aaw@google.com>
Subject: Re: [parisc-linux] memory management issues
Date: Thu, 3 May 2007 14:14:18 -0700
Message-ID: <65dd6fd50705031414o1aa42979o1ece166eb4bfba19__28678.8523350426$1416624350$gmane$org@mail.gmail.com>
References: <65dd6fd50704301144k77003d1he9f85f4bb6cf2ace@mail.gmail.com>
	<1178149192.3712.28.camel@mulgrave.il.steeleye.com>
	<65dd6fd50705021652s3b3b721dl6a8323259cd4efa9@mail.gmail.com>
	<1178153532.3712.39.camel@mulgrave.il.steeleye.com>
	<65dd6fd50705030111i993390bx829ee5eb8a188462@mail.gmail.com>
	<1178203985.3714.11.camel@mulgrave.il.steeleye.com>
	<65dd6fd50705031055p1fa02d55j6fd729239ea35d38@mail.gmail.com>
	<1178221672.3714.55.camel@mulgrave.il.steeleye.com>
	<1178226216.2767.1.camel@lappy>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux@lists.parisc-linux.org
To: "Peter Zijlstra" <a.p.zijlstra@chello.nl>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1178226216.2767.1.camel@lappy>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I think this is best; if we were to go with a parisc specific API here,
> all other arches that hit this will be in pain. Better fix their
> flush_cache_page() if and when it really is a problem.

Agreed.  Thanks for your help, James.

> Ollie, how about posting this to lkml, and get some feedback, now that
> its mostly complete.

Yep.  I want to port this back to my mainline branch and run a few
sanity check on x86 and uml.  Assuming all looks good, I'll send it
out to lkml tonight or tomorrow morning.

Ollie
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
