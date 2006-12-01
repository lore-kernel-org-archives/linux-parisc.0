From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: [2.6 patch] parisc: "extern inline" -> "static
	inline" (fwd)
Date: Fri, 1 Dec 2006 10:36:47 -0700
Message-ID: <20061201173647.GB10549__42217.5679974773$1416624627$gmane$org@colo.lackof.org>
References: <20061201114811.GQ11084@stusta.de>
	<20061201164354.GA10549@colo.lackof.org>
	<20061201165427.GD11084@stusta.de>
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
In-Reply-To: <20061201165427.GD11084@stusta.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Dec 01, 2006 at 05:54:27PM +0100, Adrian Bunk wrote:
> If you read John David Anglin's email, you'll note that if you take the 
> address you need this function provided somewhere.

Let me turn that around.
Which of the "extern inline" functions are we taking the address?
The parisc kernel wouldn't (shouldn't) link if that were true.

> Which of the functions my patch changes also have a global function 
> provided within the kernel?
> 
> If none, "extern inline" didn't make any sense.

I expect none.

...
> Currently, "inline" is defined to be always_inline, and 
> __always_inline is for cases that produce non-compiling or non-working 
> (opposed to only suboptimal) code.

Ok.  Sounds like "extern inline" is the same as __always_inline.

Has gcc community confirmed "gcc -Wmissing-prototypes" behavior
is really correct with respect to "extern inline"?

If so, I'm ok with changing "extern inline" to __always_inline.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
