Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3D00C4840
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 11 Feb 2004 08:33:02 -0700 (MST)
Date: Wed, 11 Feb 2004 16:32:52 +0100
Message-ID: <402A42A100000200@ocpmta1.freegates.net>
In-Reply-To: <4029EF9C00000135@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	James Morrison <ja2morri@csclub.uwaterloo.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


>-- Original Message --
>Date: Wed, 11 Feb 2004 10:22:24 +0100
>From: "Joel Soete" <soete.joel@tiscali.be>
>Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
>To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
>Cc: "James Morrison" <ja2morri@csclub.uwaterloo.ca>,
> parisc-linux@lists.parisc-linux.org,
> "John David Anglin" <dave@hiauly1.hia.nrc.ca>
>
>
>Hi Carlos,
>
>
>The wrong files are being included. What is your configure line?
>As I just change gcc compiler, I don't change glibc configure options which
are:

"unset LD_LIBRARY_PATH; unset LD_RUN_PATH; \
export CC=/Develop/parisc-linux/xc/bin/hppa-linux-gcc; \
export CLFAGS="-O2 -g"; export PATH="/Develop/parisc-linux/xc/bin:$PATH";
\
/Develop/parisc-linux/src/glibc/configure --target=hppa-linux \
--host=hppa-linux --build=hppa-linux \
--prefix=/opt/palinux-3.5.0/hppa-linux --without-cvs \
--disable-profile --enable-hacker-mode --enable-add-ons=linuxthreads \
--with-headers=/Develop/parisc-linux/src/linux/include
"
>
[snip] (still have to have a look with gcc-3.3 for comparison)
>
with same glibc cvs src + your patch and gcc-3.3, no pb
but always same pb with gcc-snapshot (aka 3.5).

I find an interesting differnce between glibc config.h:
--- gcc-3.5.0//glibc/config.h	2004-02-11 15:07:53.667245536 +0100
+++ gcc-3.3.3//glibc/config.h	2004-02-11 15:26:00.256058928 +0100
@@ -104,7 +104,7 @@
 
 /* Define if __asm () on built-in function's prototype causes redirection
of
    the builtin.  */
-#define	HAVE_BUILTIN_REDIRECTION 1
+/* #undef	HAVE_BUILTIN_REDIRECTION */
 
 /* Define if the __thread keyword is supported.  */
 /* #undef HAVE___THREAD */

Where should look for to attempt to fix my pb?

Thanks in advance,

    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
