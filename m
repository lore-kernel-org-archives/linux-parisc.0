Return-Path: <carlos@baldric.uwo.ca>
Received: from fep03-mail.bloor.is.net.cable.rogers.com
	(fep03-mail.bloor.is.net.cable.rogers.com [66.185.86.73])
	by dsl2.external.hp.com (Postfix) with ESMTP id 79D7E4843
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  2 Apr 2004 11:03:57 -0700 (MST)
Date: Fri, 2 Apr 2004 13:03:56 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>
Message-ID: <20040402180356.GG1081@baldric.uwo.ca>
References: <20040301193815.GG21769@baldric.uwo.ca>
	<402A4CA50000D57D@ocpmta2.freegates.net>
	<20040302152744.GH25779@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040302152744.GH25779@parcelfarce.linux.theplanet.co.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] [PATCH] glibc-2.3.3 error with debian unstable
	compiler...
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Mar 02, 2004 at 03:27:44PM +0000, Matthew Wilcox wrote:
> On Tue, Mar 02, 2004 at 03:59:34PM +0100, Joel Soete wrote:
> > +  /* Raise the safed exception.  Incidently for us the implementation
> 
> "saved exception" or "safe exception"?

That's a typo that *every* other arch has because they copied the code
from i386, I think rth was the only one anal enough to fix the spelling
mistake ;)

I snatched the C99 spec and fixed our implementation based on my reading
of the current code, other arch code, and the spec. The correct
feupdateenv is provided below.

I'm sending this upstream to debian, so we can build again.

c.

Index: feupdateenv.c
===================================================================
RCS file: /cvs/glibc/libc/sysdeps/hppa/fpu/feupdateenv.c,v
retrieving revision 1.3
diff -u -p -r1.3 feupdateenv.c
--- feupdateenv.c	18 Dec 2003 03:57:50 -0000	1.3
+++ feupdateenv.c	2 Apr 2004 06:56:56 -0000
@@ -27,11 +27,10 @@ feupdateenv (const fenv_t *envp)
 
   /* Get the current exception status. */
   __asm__ ("fstd %%fr0,0(%1)" : "=m" (*sw) : "r" (sw));
-  sw[0] &= FE_ALL_EXCEPT;
-  envp->__status_word = envp->__status_word | sw[0];
-  
   /* Install new environment.  */
   fesetenv (envp);
+  /* Raise the saved exceptions */
+  feraiseexcept(sw[0] & FE_ALL_EXCEPT);
 
   /* Success.  */
   return 0;
