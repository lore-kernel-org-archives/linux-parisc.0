Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA00755
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Oct 2000 14:20:14 -0600
Message-Id: <200010262021.QAA09667@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc problem
To: kailasr@webcash.com (Kailashnath V Rampure)
Date: Thu, 26 Oct 2000 16:21:32 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, parisc-linux@thepuffingroup.com
In-Reply-To: <5.0.0.25.0.20001026125217.00a43eb0@mail.webcash.com> from "Kailashnath V Rampure" at Oct 26, 2000 12:56:47 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I did upgrade to latest glibc from the cvs and tried I still get the same 
> error. Actually I restarted from scratch starting from binutils. I have 
> seen some warning while I built gcc. The smallpart of gcc warnings are as 
> follows:
> 
> Gcc warnings:
> 
> prototypes -pedantic -Wno-long-long  -DHAVE_CONFIG_H    -I. 
> -I/opt/hp/gcc/gcc -I/opt/hp/gcc/gcc/config -I/opt/hp/gcc/gcc/../include 
> /opt/hp/gcc/gcc/explow.c
> /usr/include/bits/string2.h: In function `__stpcpy_small':
> In file included from /usr/include/string.h:346,
>                   from /opt/hp/gcc/gcc/system.h:176,
>                   from /opt/hp/gcc/gcc/explow.c:24:
> /usr/include/bits/string2.h:611: warning: pointer targets in return differ 
> in signedness

I think the enclosed patch to bits/string2.h may fix your gcc warnings.
Doubt this is your real problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

2000-09-22  J. David Anglin  <dave@hiauly1.hia.nrc.ca>

	* string.h (__stpcpy_small): Correct return type.
	(strnlen): Correct return type in conditional expression.

--- string2.h.orig	Tue Sep  5 08:22:56 2000
+++ string2.h	Fri Sep 22 15:22:27 2000
@@ -608,7 +608,7 @@
       __u = __extension__ ((void *) __u + 3);
       break;
     }
-  return &__u->__uc;
+  return (char *) __u;
 }
 #  else
 #  define __stpcpy_args(src) \
@@ -1025,7 +1025,7 @@
 strnlen (__const char *__string, size_t __maxlen)
 {
   __const char *__end = (__const char *) memchr (__string, '\0', __maxlen);
-  return __end ? __end - __string : __maxlen;
+  return __end ? (size_t) (__end - __string) : __maxlen;
 }
 # endif
 #endif
