Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from blimpo.internal.net (ppp01.ts1-1.NewportNews.visi.net [209.8.196.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C5B8482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Oct 2001 09:50:51 -0600 (MDT)
Date: Thu, 25 Oct 2001 11:50:32 -0400
From: Ben Collins <bcollins@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org, randolph@tausq.org
Subject: Re: [parisc-linux] Re: Fix for hppa-linux ld.so with newer binutils
Message-ID: <20011025115032.G10952@visi.net>
References: <20011020170907.G1037@bubble.sa.bigpond.net.au> <20011020095406.L10952@visi.net> <20011021000443.H1037@bubble.sa.bigpond.net.au> <20011020110123.M10952@visi.net> <20011024195102.W10952@visi.net> <20011025160721.A17892@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011025160721.A17892@parcelfarce.linux.theplanet.co.uk>
Sender: Ben Collins <bmc@visi.net>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Oct 25, 2001 at 04:07:21PM +0100, Matthew Wilcox wrote:
> On Wed, Oct 24, 2001 at 07:51:02PM -0400, Ben Collins wrote:
> > BTW, most of the iconv/locales tests fail in glibc on parisc.
> 
> That's a regression.  According to my whiteboard, the tests that were
> failing with 2.2.3-9 were:
> 
>  dlfcn/default
>  posix/globtest
>  gmon/tst-sprofil
>  elf/resolvfail
>      constload1
>      vismain
>      neededtest{,2,3,4}
>      lateglobal

Even with the newest gcc 3.0.2 in sid, I get those failures. Make sure
when you guys are compiling that in hppa-linux/obj/config.make, that
cross_compile isn't set to yes. For some reason, I am getting this, and
when that's set, most of the testsuite isn't run.

I do have a compiled set of packages, installed, that are working.
They'll be uploaded with 2.2.4-4.

Ben

-- 
 .----------=======-=-======-=========-----------=====------------=-=-----.
/                   Ben Collins    --    Debian GNU/Linux                  \
`  bcollins@debian.org  --  bcollins@openldap.org  --  bcollins@linux.com  '
 `---=========------=======-------------=-=-----=-===-======-------=--=---'
