Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4841C482A
	for <parisc-linux@parisc-linux.org>; Tue,  8 May 2001 10:53:58 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14xAjr-0004Kn-00; Tue, 08 May 2001 17:53:31 +0100
Date: Tue, 8 May 2001 17:53:31 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Paul Bame <bame@riverrock.org>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.2.3 make check status
Message-ID: <20010508175331.K4917@parcelfarce.linux.theplanet.co.uk>
References: <20010505033457.Q32445@parcelfarce.linux.theplanet.co.uk> <matthew@wil.cx> <m14x7qP-001VltC@bame.riverrock.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <m14x7qP-001VltC@bame.riverrock.org>; from bame@riverrock.org on Tue, May 08, 2001 at 07:48:05AM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, May 08, 2001 at 07:48:05AM -0600, Paul Bame wrote:
> make check for 2.2.1 with the large file changes should only have failed
> some of the fp tests.

Damn.  Then people need to fix these new failures.  I'm working on the
linuxthreads/* and rt/* tests.

> If all the tests fail that's a problem. In 2.2.1 the fp  tests passed except
> the ones where glibc computed something like trig functions, and those tests
> were off in their least-significant bits.

not _all_ the math/* tests fail, I was exaggerating (it just felt
like it!)  there's 4-5 which fail... want to check them out, be sure we
aren't worse than glibc 2.2.1?

-- 
Revolutions do not require corporate support.
