Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5D3E6484B
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  9 Feb 2004 10:11:38 -0700 (MST)
Date: Mon, 9 Feb 2004 18:11:32 +0100
Message-ID: <400CB8A10001082F@ocpmta3.freegates.net>
In-Reply-To: <20040208014659.GC23095@baldric.uwo.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	"John David Anglin" <dave@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Carlos and Dave,

I am trying my toolchain script against gcc-snapshot and glibc(2.3.3) with
respective Carlos' patches but I met some pb.

The first was against gconv_simple.c for which I find easily the follwing
patch (see <http://sources.redhat.com/cgi-bin/cvsweb.cgi/libc/iconv/gconv_simple.c.diff?r1=1.59&r2=1.60&cvsroot=glibc>)
========><========
--- iconv/gconv_simple.c.orig	2004-02-09 15:11:52.000000000 +0100
+++ iconv/gconv_simple.c	2004-02-09 16:07:16.000000000 +0100
@@ -453,9 +453,11 @@
 #if __BYTE_ORDER == __BIG_ENDIAN
   /* Sigh, we have to do some real work.  */
   size_t cnt;
+  uint32_t *outptr32 = (uint32_t *) outptr;
 
   for (cnt = 0; cnt < n_convert; ++cnt, inptr += 4)
-    *((uint32_t *) outptr)++ = bswap_32 (*(const uint32_t *) inptr);
+    *outptr32++ = bswap_32 (*(const uint32_t *) inptr);
+  outptr = (unsigned char *) outptr32;
 
   *inptrp = inptr;
   *outptrp = outptr;
========><========

Is it correct?

The next on is more hard to me and find in _buff() from sunrpc/clnt_perr.c:
[snip]
#ifdef _RPC_THREAD_SAFE_
/*
 * Making buf a preprocessor macro requires renaming the local
 * buf variable in a few functions.  Overriding a global variable
 * with a local variable of the same name is a bad idea, anyway.
 */
#define buf ((char *)RPC_THREAD_VARIABLE(clnt_perr_buf_s))
#else
static char *buf;
#endif

static char *
_buf (void)
{
  if (buf == NULL)
    buf = (char *) malloc (256);
  return buf;
}
[snip]

which precompile as follow:
[snip]
static char *auth_errmsg (enum auth_stat stat) ;
# 63 "clnt_perr.c"
static char *
_buf (void)
{
  if (((char *)(__rpc_thread_variables()->clnt_perr_buf_s)) == ((void *)0))
    ((char *)(__rpc_thread_variables()->clnt_perr_buf_s)) = (char *) malloc
(256);
  return ((char *)(__rpc_thread_variables()->clnt_perr_buf_s));
}
[snip]

and failed with error:
clnt_perr.c: In function `_buf':
clnt_perr.c:67: error: invalid lvalue in assignment
make[2]: *** [/Develop/parisc-linux/build/glibc/sunrpc/clnt_perr.o] Error
1

Any idea?

Thanks in advance,
    Joel

PS: I just attempt this test because I read a lot of akpm patch related to
gcc-35  ;)

-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
