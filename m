Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx1.wiggy.net (cabal.xs4all.nl [213.84.101.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id AA512482A
	for <parisc-linux@parisc-linux.org>; Fri,  3 Aug 2001 06:31:42 -0600 (MDT)
Date: Fri, 3 Aug 2001 14:27:52 +0200
From: Wichert Akkerman <wichert@wiggy.net>
To: Matthew Wilcox <willy@ldl.fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Message-ID: <20010803142752.C8292@wiggy.net>
References: <20010418172628.C4217@zumpano.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010418172628.C4217@zumpano.fc.hp.com>
Subject: [parisc-linux] Re: strace updates
List-ID: <linux-parisc.vger.kernel.org>

Previously Matthew Wilcox wrote:
> most of the entries for sys_fcntl64 just do printargs, but it's identical
> to sys_fcntl.

Good point, fixed now.

> i can't see how to build this from the sourceforge CVS -- i run autoconf
> but config.h.in is not found.  probably because it's part of .cvsignore.

You have to run autoheader first, see the cvsbuild script.

Wichert.

-- 
  _________________________________________________________________
 /       Nothing is fool-proof to a sufficiently talented fool     \
| wichert@wiggy.net                   http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
