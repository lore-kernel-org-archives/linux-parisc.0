Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA29428
	for <parisc-linux@puffin.external.hp.com>; Fri, 31 Mar 2000 09:26:43 -0700
From: willy@thepuffingroup.com
Date: Fri, 31 Mar 2000 12:26:24 -0500
To: BOSCHINI@ICIL64.CILEA.IT
Cc: PARISC-LINUX@thepuffingroup.com
Subject: Re: [parisc-linux] Building bin-utils and gcc on HP735...
Message-ID: <20000331122624.C30107@thepuffingroup.com>
References: <01JNOWOXLRXQ000XJ1@ICIL64.CILEA.IT>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01JNOWOXLRXQ000XJ1@ICIL64.CILEA.IT>; from BOSCHINI@ICIL64.CILEA.IT on Fri, Mar 31, 2000 at 05:59:32PM +0000

On Fri, Mar 31, 2000 at 05:59:32PM +0000, BOSCHINI@ICIL64.CILEA.IT wrote:
> I installed bison and then flex (also needed) but still binutils make dies with
> a strange (at leat to me) yacc error:
> 
> lex  /TMP/binutils/ld/ldlex.l && mv lex.yy.c ldlex.c
> "/TMP/binutils/ld/ldlex.l" line 303: error 3: Parse tree too big, Try using %e
> num
> 1000/1000 nodes(%e), 0/2500 positions(%p), 1/500 (%n), 0 transitions, 0/1000
> packed char classes(%k), 0/4000 packed transitions(%a), 0/5000 output slots(%o)

You need to rerun the configure script once you've installed flex; you're
still picking up HPUX lex.
