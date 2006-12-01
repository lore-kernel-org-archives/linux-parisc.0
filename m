From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: [2.6 patch] parisc: "extern inline" -> "static
	inline" (fwd)
Date: Fri, 1 Dec 2006 09:43:54 -0700
Message-ID: <20061201164354.GA10549__1334.83942267976$1416624627$gmane$org@colo.lackof.org>
References: <20061201114811.GQ11084@stusta.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Andrew Morton <akpm@osdl.org>,
 matthew@wil.cx,
 linux-kernel@vger.kernel.org,
 kyle@parisc-linux.org,
 parisc-linux@parisc-linux.org
To: Adrian Bunk <bunk@stusta.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061201114811.GQ11084@stusta.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Dec 01, 2006 at 12:48:11PM +0100, Adrian Bunk wrote:
> "extern inline" generates a warning with -Wmissing-prototypes and I'm 
> currently working on getting the kernel cleaned up for adding this to 
> the CFLAGS since it will help us to avoid a nasty class of runtime 
> errors.


John David Anglin is the hppa/parisc gcc maintainer and has
commented on inline variants last year:
    http://lists.parisc-linux.org/pipermail/parisc-linux/2005-October/027587.html

This makes me think -Wmissing-prototypes is reporting the wrong warning.
ie there is a prototype but no function and no label.
Can you check with gcc folks to see if this is a gcc bug?

The parisc point intentionally switched to "extern inline" at one
point and unless what jda wrote is now incorrect, I'm not inclined
to change it.

> If there are places that really need a forced inline, __always_inline 
> would be the correct solution.

Yes, all the functions marked "extern inline" are expected to get
essentially the same treatment as "always_inline".

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
