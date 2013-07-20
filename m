From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] palo/palo.c:482:5: /usr/include/bits/fcntl2.h:50:24:
 error: call to '__open_missing_mode' declared with attribute error: open
 with O_CREAT in second argument needs 3 arguments
Date: Sat, 20 Jul 2013 21:53:10 +0200
Message-ID: <51EAEAA6.5080404@gmx.de>
References: <20130718165539.15e7e327@marga.jer-c2.orkz.net> <20130718174346.022491f8@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130718174346.022491f8@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Jeroen,

On 07/18/2013 05:43 PM, Jeroen Roovers wrote:
> In file included from /usr/include/fcntl.h:296:0,
>                  from palo.c:16:
> In function 'open',
>     inlined from 'do_formatted' at palo.c:482:5:
> /usr/include/bits/fcntl2.h:50:24: error: call to '__open_missing_mode'
> declared with attribute error: open with O_CREAT in second argument
> needs 3 arguments
> 
> Signed-off-by: Jeroen Roovers <jer@gentoo.org>

Thanks for both patches!
I've just pushed both upstream to the palo git tree.

Both changes aren't that huge, so I'm right now not planning to
bump the version number - unless you need it for gentoo...?
Just let me know (or if you have further patches, e.g. gentoo specific files?)

Helge
