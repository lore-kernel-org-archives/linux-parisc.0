From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] [Updates] glibc 2.3.3 experimental update.
Date: Fri, 8 Oct 2004 13:56:19 -0400
Message-ID: <20041008175619.GF24430@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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


pa,

http://www.parisc-linux.org/~carlos/glibc-work/glibc-2.3.3-debs-2004-10-08/

- Forward ported the non-arch debian patches.
- Updated the cvs tarball.

The main difference I believe is in the 'non-arch' debian patches. I
carried as many forward as was possible. This work will probably make it
back to a debian experimental glibc :)

This release is for those of you that like to test out new glibc's...

The previous glibc had problems with gdb's testsuite and symbol
resolution. Running a test on that now.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
