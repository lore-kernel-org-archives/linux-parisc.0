Return-Path: <ja2morri@csclub.uwaterloo.ca>
Received: from perpugilliam.csclub.uwaterloo.ca
	(perpugilliam.csclub.uwaterloo.ca [129.97.134.31])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F6D7484B
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  9 Feb 2004 11:54:44 -0700 (MST)
Sender: ja2morri@perpugilliam.csclub.uwaterloo.ca
To: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
References: <400CB8A10001082F@ocpmta3.freegates.net>
From: James Morrison <ja2morri@csclub.uwaterloo.ca>
Date: 09 Feb 2004 13:40:23 -0500
In-Reply-To: <400CB8A10001082F@ocpmta3.freegates.net>
Message-ID: <kfh3c9k14h4.fsf@perpugilliam.csclub.uwaterloo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


"Joel Soete" <soete.joel@tiscali.be> writes:

> Hi Carlos and Dave,
> 
> I am trying my toolchain script against gcc-snapshot and glibc(2.3.3) with
> respective Carlos' patches but I met some pb.
> 
> The first was against gconv_simple.c for which I find easily the follwing
> patch (see <http://sources.redhat.com/cgi-bin/cvsweb.cgi/libc/iconv/gconv_simple.c.diff?r1=1.59&r2=1.60&cvsroot=glibc>)
> ========><========
> --- iconv/gconv_simple.c.orig	2004-02-09 15:11:52.000000000 +0100
> +++ iconv/gconv_simple.c	2004-02-09 16:07:16.000000000 +0100
> @@ -453,9 +453,11 @@
>  #if __BYTE_ORDER == __BIG_ENDIAN
>    /* Sigh, we have to do some real work.  */
>    size_t cnt;
> +  uint32_t *outptr32 = (uint32_t *) outptr;
>  
>    for (cnt = 0; cnt < n_convert; ++cnt, inptr += 4)
> -    *((uint32_t *) outptr)++ = bswap_32 (*(const uint32_t *) inptr);
> +    *outptr32++ = bswap_32 (*(const uint32_t *) inptr);
> +  outptr = (unsigned char *) outptr32;
>  
>    *inptrp = inptr;
>    *outptrp = outptr;
> ========><========
> 
> Is it correct?
> 
> The next on is more hard to me and find in _buff() from sunrpc/clnt_perr.c:
> [snip]
[snip]
> Any idea?

 This patch fixes the problem:
http://sources.redhat.com/ml/libc-hacker/2004-02/msg00005.html
 
> Thanks in advance,
>     Joel
> 
> PS: I just attempt this test because I read a lot of akpm patch related to
> gcc-35  ;)

Jim
