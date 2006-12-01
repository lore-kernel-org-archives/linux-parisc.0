From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: [2.6 patch] parisc: "extern inline" -> "static
Date: Fri, 1 Dec 2006 12:38:16 -0500 (EST)
Message-ID: <200612011738.kB1HcGwo006938__25185.3341040716$1416624623$gmane$org@hiauly1.hia.nrc.ca>
References: <20061201164354.GA10549@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: akpm@osdl.org,
 matthew@wil.cx,
 linux-kernel@vger.kernel.org,
 kyle@parisc-linux.org,
 bunk@stusta.de,
 parisc-linux@parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061201164354.GA10549@colo.lackof.org> from "Grant Grundler" at
	Dec 1, 2006 09:43:54 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> The parisc point intentionally switched to "extern inline" at one
> point and unless what jda wrote is now incorrect, I'm not inclined
> to change it.

The handling of "extern inline" is changing in GCC 4.3 to the C99 specified
behavior.  The attribute gnu_inline on an inline declaration results in the
old GNU C89 inline behavior even in the ISO C99 mode.

The C99 behavior allows the function being inlined to be externally
called.  As a result, conflicts will occur if the function is defined in
a header included by multiple objects.  So, code that assumed the previous
GNU treatment unfortunately needs to change.

The main difference between "static inline" and "extern inline" in the
old GNU treatment was that with "extern inline" the function was never
compiled on its own, even if its address was explicitly referenced.
With "static inline", the function would be compiled on its own in some
circumstances.  So, this is mostly a code size issue.

More details are present in extend.texi in the GCC head.  This has also
been discussed on the gcc list a few times.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
