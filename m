From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: [PATCH] palo/palo.c:482:5: /usr/include/bits/fcntl2.h:50:24:
 error: call to '__open_missing_mode' declared with attribute error: open
 with O_CREAT in second argument needs 3 arguments
Date: Sun, 21 Jul 2013 16:13:01 +0200
Message-ID: <20130721161301.165f5d6f@marga.jer-c2.orkz.net>
References: <20130718165539.15e7e327@marga.jer-c2.orkz.net>
	<20130718174346.022491f8@marga.jer-c2.orkz.net>
	<51EAEAA6.5080404@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51EAEAA6.5080404@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 20 Jul 2013 21:53:10 +0200
Helge Deller <deller@gmx.de> wrote:

> Thanks for both patches!
> I've just pushed both upstream to the palo git tree.

Great!

> Both changes aren't that huge, so I'm right now not planning to
> bump the version number - unless you need it for gentoo...?

Both patches are already used in Gentoo, so that's fine.


     jer
