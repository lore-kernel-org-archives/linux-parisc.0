Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A5DF4895
	for <parisc-linux@lists.parisc-linux.org>;
	Sun,  7 Mar 2004 06:04:20 -0700 (MST)
Message-ID: <404B1E17.6020004@tiscali.be>
Date: Sun, 07 Mar 2004 13:05:27 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] glibc cvs: additional patche
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Carlos,

Since yesterday cvs update, i also need a patch similar to:
<http://sources.redhat.com/cgi-bin/cvsweb.cgi/libc/sysdeps/s390/s390-32/dl-machine.h.diff?r1=1.19&r2=1.20&cvsroot=glibc>

=========><=========
--- sysdeps/hppa/dl-machine.h.orig      2004-03-07 12:26:36.000000000 +0100
+++ sysdeps/hppa/dl-machine.h   2004-03-07 12:34:06.000000000 +0100
@@ -252,7 +252,7 @@
                  }
                else
                 {
-                 if (_dl_name_match_p (GL(dl_profile), l))
+                 if (_dl_name_match_p (GLRO(dl_profile), l))
                     {
                       /* This is the object we are looking for.  Say that
                          we really want profiling and the timers are
@@ -581,9 +581,9 @@
  static inline void __attribute__ ((unused))
  dl_platform_init (void)
  {
-       if (GL(dl_platform) != NULL && *GL(dl_platform) == '\0')
+       if (GLRO(dl_platform) != NULL && *GLRO(dl_platform) == '\0')
         /* Avoid an empty string which would disturb us.  */
-               GL(dl_platform) = NULL;
+               GLRO(dl_platform) = NULL;
  }

  #endif /* !dl_machine_h */
@@ -684,7 +684,7 @@
         break;
        if (__builtin_expect (sym->st_size > refsym->st_size, 0)
           || (__builtin_expect (sym->st_size < refsym->st_size, 0)
-             && __builtin_expect (GL(dl_verbose), 0)))
+             && __builtin_expect (GLRO(dl_verbose), 0)))
         {
           const char *strtab;

=========><=========

hth,
	Joel
