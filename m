Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id DA6FA4A19
	for <parisc-linux@parisc-linux.org>; Wed, 14 Mar 2001 17:01:21 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA26222;
	Thu, 15 Mar 2001 10:22:24 +1100
Date: Thu, 15 Mar 2001 10:22:24 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] perl-5.6.0 build problems
In-Reply-To: <20010314145957.C13965@achilles.net>
Message-ID: <Pine.LNX.4.21.0103151018450.27636-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 14 Mar 2001, Paul J.Y. Lahaie wrote:

> If I use the debian build (with the patch), perl.static and perl.debug
> complete building, but a dynamic version crashes immediately on startup
> from loading libperl.so.5.6.0 with the following fault:

Is this with the latest fix to gcc?

date: 2001/03/14 04:19:13;  author: amodra;  state: Exp;  lines: +5 -0
Don't assume a LO_SUM is fixed except during alias analysis.

Alan
-- 
Linuxcare
