Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B7AF2482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Oct 2001 09:07:26 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15wm6L-000566-00; Thu, 25 Oct 2001 16:07:21 +0100
Date: Thu, 25 Oct 2001 16:07:21 +0100
From: Matthew Wilcox <willy@debian.org>
To: Ben Collins <bcollins@debian.org>
Cc: parisc-linux@lists.parisc-linux.org, randolph@tausq.org
Subject: Re: [parisc-linux] Re: Fix for hppa-linux ld.so with newer binutils
Message-ID: <20011025160721.A17892@parcelfarce.linux.theplanet.co.uk>
References: <20011020170907.G1037@bubble.sa.bigpond.net.au> <20011020095406.L10952@visi.net> <20011021000443.H1037@bubble.sa.bigpond.net.au> <20011020110123.M10952@visi.net> <20011024195102.W10952@visi.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011024195102.W10952@visi.net>; from bcollins@debian.org on Wed, Oct 24, 2001 at 07:51:02PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 24, 2001 at 07:51:02PM -0400, Ben Collins wrote:
> BTW, most of the iconv/locales tests fail in glibc on parisc.

That's a regression.  According to my whiteboard, the tests that were
failing with 2.2.3-9 were:

 dlfcn/default
 posix/globtest
 gmon/tst-sprofil
 elf/resolvfail
     constload1
     vismain
     neededtest{,2,3,4}
     lateglobal

-- 
Revolutions do not require corporate support.
