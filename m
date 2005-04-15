From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] More from the TLS glibc front.
Date: Fri, 15 Apr 2005 12:30:06 -0400
Message-ID: <20050415163006.GA26980@baldric.uwo.ca>
References: <20050409050558.GL1833@baldric.uwo.ca>
	<20050410104403.GK6987@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050410104403.GK6987@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Apr 10, 2005 at 03:44:03AM -0700, Randolph Chung wrote:
> I'm using:
> binutils CVS HEAD (20050409)
> gcc-4.0-20050402 (ftp'ed)
> glibc CVS HEAD (20050409)
> 
> First of all, the patches seem to be out of date. I've updated the
> binutils and gcc ones.
> 
> http://www.parisc-linux.org/~tausq/hppa-tls-gcc.diff
> http://www.parisc-linux.org/~tausq/hppa-tls-binutils.diff
> 
> I find some other issues with the glibc build. Carlos, a few of your
> patches are malformed. They have CVS conflict markers in them.. :)
> 
> Right now my build fails when building tst-tlsmod14a.c with a gcc ICE. I
> think my gcc patches are broken (no surprise there...)

Woah, wait a second. You have a working build? You got to atleast the
check phase if you are building the tests. Are you sure your build made
it all the way through?

How did you fix this:
/mnt/flaire/src/tls-toolchain/install/bin/../lib/gcc/hppa-linux/3.4.3/../../../../hppa-linux/bin/ld:
__libc_errno: TLS definition in
/home/carlos/fsrc/tls-toolchain/build/libc/2005-04-08-hppa/libc_pic.a(errno.os)
section .tbss mismatches non-TLS reference in
/home/carlos/fsrc/tls-toolchain/build/libc/2005-04-08-hppa/libc_pic.a(getcwd.os)


c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
