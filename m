Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from blimpo.internal.net (ppp01.ts1-1.NewportNews.visi.net [209.8.196.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F6FC482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Oct 2001 17:51:07 -0600 (MDT)
Date: Wed, 24 Oct 2001 19:51:02 -0400
From: Ben Collins <bcollins@debian.org>
To: parisc-linux@lists.parisc-linux.org, randolph@tausq.org
Subject: Re: [parisc-linux] Re: Fix for hppa-linux ld.so with newer binutils
Message-ID: <20011024195102.W10952@visi.net>
References: <20011020170907.G1037@bubble.sa.bigpond.net.au> <20011020095406.L10952@visi.net> <20011021000443.H1037@bubble.sa.bigpond.net.au> <20011020110123.M10952@visi.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011020110123.M10952@visi.net>
Sender: Ben Collins <bmc@visi.net>
List-ID: <linux-parisc.vger.kernel.org>

Ok. Seems there are some other issues still. I'm using the .10-1
binutils, and the latest patches for glibc. At first I thought the
testsuite was running through perfectly, until I realized that it was
because most of the tests weren't being run. The configure script thinks
it is cross-compiling, because it can't even run a simple test program.

Not to mention I am getting random segv's in the rest of the toolchain.
I went back to a UP kernel suspecting it to be the cause. Now I'm
getting a segv during the package builds due to a segv in the strip
program (that may be a binutils bug).

So, back to square one. I don't have time tonight to start looking at
this, so I'll start on it tomorrow.

BTW, most of the iconv/locales tests fail in glibc on parisc.

Ben

-- 
 .----------=======-=-======-=========-----------=====------------=-=-----.
/                   Ben Collins    --    Debian GNU/Linux                  \
`  bcollins@debian.org  --  bcollins@openldap.org  --  bcollins@linux.com  '
 `---=========------=======-------------=-=-----=-===-======-------=--=---'
