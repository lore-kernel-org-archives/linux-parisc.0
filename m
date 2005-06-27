From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] parisc_setup_cache_timing() typo?
Date: Mon, 27 Jun 2005 14:01:07 +0200
Message-ID: <42BAE7C300000D8E@mail-5-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

hello all,

Is it actualy a typo:
# diff -Nau arch/parisc/kernel/cache.c.Orig arch/parisc/kernel/cache.c  
  
--- arch/parisc/kernel/cache.c.Orig     2005-01-24 07:45:00.000000000 +01=
00
+++ arch/parisc/kernel/cache.c  2005-06-27 13:48:28.857534045 +0200
@@ -347,7 +347,7 @@
        flush_data_cache();
        alltime =3D mfctl(16) - alltime;
 
-       size =3D (unsigned long)(&_end - _text);
+       size =3D (unsigned long)(&_end - &_text);
        rangetime =3D mfctl(16);
        flush_kernel_dcache_range((unsigned long)&_text, size);
        rangetime =3D mfctl(16) - rangetime;
=3D=3D=3D=3D<>=3D=3D=3D=3D

or better have I to invest in new sun glaces ;-)

Thanks,
     Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
