Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8166F4840
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  2 Mar 2004 07:59:38 -0700 (MST)
Date: Tue, 2 Mar 2004 15:59:34 +0100
Message-ID: <402A4CA50000D57D@ocpmta2.freegates.net>
In-Reply-To: <20040301193815.GG21769@baldric.uwo.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] glibc-2.3.3: a warning with gcc-3.3 become an
	error with gcc-3.5
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

>
>Show me a patch.
>
something like this perhaps?

--- ./feupdateenv.c.orig	2004-03-02 15:21:25.959085856 +0100
+++ ./feupdateenv.c	2004-03-02 07:53:27.938166120 +0100
@@ -28,11 +28,16 @@
   /* Get the current exception status. */
   __asm__ ("fstd %%fr0,0(%1)" : "=m" (*sw) : "r" (sw));
   sw[0] &= FE_ALL_EXCEPT;
-  envp->__status_word = envp->__status_word | sw[0];
+/*  envp->__status_word = envp->__status_word | sw[0]; */
   
   /* Install new environment.  */
   fesetenv (envp);
 
+  /* Raise the safed exception.  Incidently for us the implementation
+     defined format of the values in objects of type fexcept_t is the
+     same as the ones specified using the FE_* constants.  */
+  feraiseexcept (sw[0]);
+
   /* Success.  */
   return 0;
 }

Thanks in advance for attention,
    Joel


----------------------------------------------------------------------------------------
Tiscali ADSL: 19,50 €/mois, pendant 3 mois! L'Internet rapide, c'est pour
tout le monde.
http://reg.tiscali.be/default.asp?lg=fr
