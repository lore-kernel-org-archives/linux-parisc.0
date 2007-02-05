From: Aurelien Jarno <aurelien@aurel32.net>
Subject: [parisc-linux] glibc 2.5 & TLS linuxthreads (+ NPTL status)
Date: Mon, 05 Feb 2007 22:25:35 +0100
Message-ID: <45C7A0CF.4020404__39680.7162710049$1416624277$gmane$org@aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: GNU Libc Maintainers <debian-glibc@lists.debian.org>
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

Hi all,

I spent the last week-end trying to get the Debian glibc 2.5 package
built with linuxthreads and TLS support on HPPA. And it was successfull!
The packages should be available in the experimental repository when the
HPPA autobuilder have built it (my build was a bit hackish).

FYI, I used binutils 2.17 CVS 20070103 and 4.2.0 CVS 20070105.

To make the glibc buildable I had to use the following patch from Carlos
O'Donell:
http://svn.debian.org/wsvn/pkg-glibc/glibc-package/branches/glibc-2.5/debian/patches/hppa/submitted-lt.diff?op=file&rev=0&sc=0

This patch is already very old, but has still not be committed to the
CVS. Is it something wanted, or has it only been forgotten?

Also what is the current status of NPTL on HPPA. Last time I tried it
was building but they were some failures in the testsuite. I am
currently building a test version here. Is it something stable enough
that it can be used "in production"? I have seen Gentoo has made the
switch...

Bye,
Aurelien

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
