Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from blimpo.internal.net (ppp01.ts1-1.NewportNews.visi.net [209.8.196.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id B6141482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Oct 2001 19:12:49 -0600 (MDT)
Date: Wed, 24 Oct 2001 21:12:06 -0400
From: Ben Collins <bcollins@debian.org>
To: Randolph Chung <tausq@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Fix for hppa-linux ld.so with newer binutils
Message-ID: <20011024211206.Y10952@visi.net>
References: <20011020170907.G1037@bubble.sa.bigpond.net.au> <20011020095406.L10952@visi.net> <20011021000443.H1037@bubble.sa.bigpond.net.au> <20011020110123.M10952@visi.net> <20011024195102.W10952@visi.net> <20011024175642.X537@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011024175642.X537@tausq.org>
Sender: Ben Collins <bmc@visi.net>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 24, 2001 at 05:56:43PM -0700, Randolph Chung wrote:
> Ben,
> 
> > Not to mention I am getting random segv's in the rest of the toolchain.
> > I went back to a UP kernel suspecting it to be the cause. Now I'm
> > getting a segv during the package builds due to a segv in the strip
> > program (that may be a binutils bug).
> > 
> > So, back to square one. I don't have time tonight to start looking at
> > this, so I'll start on it tomorrow.
> > 
> > BTW, most of the iconv/locales tests fail in glibc on parisc.
> 
> do you have a build log? if so can you put it on, say, auric?

The build finished without error, so it's of little use. The test suite
output is just a lot og Error 139's, so it too isn't much help.

> also please show dpkg -s output for binutils and gcc-3.0

binutils 2.11.92.0.10-1
gcc-3.0 3.0.2-0pre010922

I'm going to upgrade and try again.

> we seem to be getting some random segvs on A500's. James sees them a lot
> on the hppa buildd (sarti). I have a feeling the toolchain might not be
> at fault in this case.

Agreed. In fact, the machine locked up twice while doing a "debian/rules
clean", which is obviously not a toolchain problem :)

> if you'd like please post the source and I can try to build it here. i'm
> building 2.2.4-3 with the newest tool bits at the moment. basic things
> seem to be ok, but it'll take an hour or more for it to finish.

Will be uploading it later tonight. I have 5 other archs done, so I am
going to upload all of that.

-- 
 .----------=======-=-======-=========-----------=====------------=-=-----.
/                   Ben Collins    --    Debian GNU/Linux                  \
`  bcollins@debian.org  --  bcollins@openldap.org  --  bcollins@linux.com  '
 `---=========------=======-------------=-=-----=-===-======-------=--=---'
