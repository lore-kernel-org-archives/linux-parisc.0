From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] back to glibc-2.3.3 & gcc-3.4.1 pb
Date: Thu, 02 Sep 2004 19:34:32 +0000
Message-ID: <413775C8.3060108@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
To: Carlos O'Donell <carlos@baldric.uwo.ca>,
 parisc-linux@lists.parisc-linux.org
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

Hello Carlos,

I co yesterday glibc cvs (ie 2004 09 01) and apply your patch 2004-08-24.
I install debian gcc-3.4.1-7 and the build of this the libc with this compiler failed :(

seems in _dl_make_fptr() I need much more work, ...

I so retry to build with gcc-3.3 (3.3.4-7 deb) and the build just finished with success, so I launch the check now (yes more then 
7h on a c110 ;).

That said, it's the first time that I compare configure log and notice some differences, excepted :
@@ -26,8 +26,8 @@
  checking for ld... ld
  checking version of ld... 2.15, ok
  checking for pwd... /bin/pwd
-checking for hppa-linux-gcc... (cached) /usr/bin/gcc-3.4
-checking version of /usr/bin/gcc-3.4... 3.4.1, ok
+checking for hppa-linux-gcc... (cached) hppa-linux-gcc
+checking version of hppa-linux-gcc... 3.3.4, ok
  checking for gnumake... no
  checking for gmake... no
  checking for make... make

To help to read - as related to 3.4 and + with 3.3 (and yes unstable so binutils 2.15)

@@ -78,7 +78,7 @@
  checking for -z combreloc... no
  checking for -z execstack... yes
  checking for -fpie... no
-checking for -fno-unit-at-a-time... yes
+checking for -fno-unit-at-a-time... no
  checking whether cc puts quotes around section names... no
  checking for assembler .weak directive... yes
  checking for assembler line separator... !
@@ -89,7 +89,7 @@
  checking for DWARF2 unwind info support... no_registry_needed
  checking for __builtin_expect... yes
  checking for __builtin_memset... no
-checking for redirection of built-in functions... yes
+checking for redirection of built-in functions... no
  checking for local label subtraction... yes
  checking for __thread... no
  checking for libgd... no

Is it usefull to try to force gcc-3.4 to work without -fno-unit-at-a-time and (even though I don't know yet how) without 
'redirection of built-in functions' (even thought according to patch description: 
<http://gcc.gnu.org/ml/gcc-patches/2003-04/msg02045.html> this last one is supposed to help glibc build?)

TIA for advise,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
