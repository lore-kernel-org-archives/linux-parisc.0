Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from janeway.cistron.net (janeway.cistron.net [195.64.65.23])
	by dsl2.external.hp.com (Postfix) with ESMTP id CE101482A
	for <parisc-linux@parisc-linux.org>; Wed, 18 Apr 2001 19:18:25 -0600 (MDT)
Date: Thu, 19 Apr 2001 03:18:23 +0200
From: Wichert Akkerman <wichert@cistron.nl>
To: Matthew Wilcox <willy@ldl.fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Message-ID: <20010419031823.B27942@cistron.nl>
References: <20010418172628.C4217@zumpano.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010418172628.C4217@zumpano.fc.hp.com>; from willy@ldl.fc.hp.com on Wed, Apr 18, 2001 at 05:26:28PM -0600
Subject: [parisc-linux] Re: strace updates
List-ID: <linux-parisc.vger.kernel.org>

Previously Matthew Wilcox wrote:
> This patch adds some new syscalls to the HPPA list, it's against the current
> sourceforge version. 

Ok, looks good. I'll apply it when I wake up tomorrow.

> sys_truncate64 & sys_ftruncate64 actually take 3 arguments not 2 (problem
> in all architectures)

Hmm, nasty. I'll fix that for the other archs as wel.

> i can't see how to build this from the sourceforge CVS -- i run autoconf
> but config.h.in is not found.  probably because it's part of .cvsignore.

RTFM :). You have to run cvsbuild first which will call autoheader
and autoconf for you.

Wichert.

-- 
   ________________________________________________________________
 / Generally uninteresting signature - ignore at your convenience  \
| wichert@cistron.nl                  http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
