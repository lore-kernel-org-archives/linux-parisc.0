Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 47DEA482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Oct 2001 18:56:55 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id lpogiaaa for parisc-linux@lists.parisc-linux.org; Wed, 24 Oct 2001 17:52:15 -0700
Date: Wed, 24 Oct 2001 17:56:43 -0700
From: Randolph Chung <tausq@debian.org>
To: Ben Collins <bcollins@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Fix for hppa-linux ld.so with newer binutils
Message-ID: <20011024175642.X537@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20011020170907.G1037@bubble.sa.bigpond.net.au> <20011020095406.L10952@visi.net> <20011021000443.H1037@bubble.sa.bigpond.net.au> <20011020110123.M10952@visi.net> <20011024195102.W10952@visi.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011024195102.W10952@visi.net>
Sender: Randolph Chung <randolph@tausq.org>
List-ID: <linux-parisc.vger.kernel.org>

Ben,

> Not to mention I am getting random segv's in the rest of the toolchain.
> I went back to a UP kernel suspecting it to be the cause. Now I'm
> getting a segv during the package builds due to a segv in the strip
> program (that may be a binutils bug).
> 
> So, back to square one. I don't have time tonight to start looking at
> this, so I'll start on it tomorrow.
> 
> BTW, most of the iconv/locales tests fail in glibc on parisc.

do you have a build log? if so can you put it on, say, auric?

also please show dpkg -s output for binutils and gcc-3.0

we seem to be getting some random segvs on A500's. James sees them a lot
on the hppa buildd (sarti). I have a feeling the toolchain might not be
at fault in this case.

if you'd like please post the source and I can try to build it here. i'm
building 2.2.4-3 with the newest tool bits at the moment. basic things
seem to be ok, but it'll take an hour or more for it to finish.

randolph
-- 
Debian Developer <tausq@debian.org>
http://www.TauSq.org/
