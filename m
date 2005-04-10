From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] More from the TLS glibc front.
Date: Sun, 10 Apr 2005 03:44:03 -0700
Message-ID: <20050410104403.GK6987@tausq.org>
References: <20050409050558.GL1833@baldric.uwo.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050409050558.GL1833@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Still tacking:

Hmm.... I guess I must be using slightly different sources, and I see
different problems....

I'm using:
binutils CVS HEAD (20050409)
gcc-4.0-20050402 (ftp'ed)
glibc CVS HEAD (20050409)

First of all, the patches seem to be out of date. I've updated the
binutils and gcc ones.

http://www.parisc-linux.org/~tausq/hppa-tls-gcc.diff
http://www.parisc-linux.org/~tausq/hppa-tls-binutils.diff

I find some other issues with the glibc build. Carlos, a few of your
patches are malformed. They have CVS conflict markers in them.. :)

Right now my build fails when building tst-tlsmod14a.c with a gcc ICE. I
think my gcc patches are broken (no surprise there...)

I'll try to take a closer look at the gcc failure. The failure looks
like this (simplified to a small test program):

$ /home/tausq/tls/bin/gcc -O2 -fPIC -c tlstst.c
tlstst.c: In function 'in_dso1':
tlstst.c:21: error: unable to find a register to spill in class 'R1_REGS'
tlstst.c:21: error: this is the insn:
(insn 26 20 23 0 (set (reg:SI 28 %r28 [106])
        (plus:SI (reg:SI 19 %r19)
            (high:SI (symbol_ref/v/f:SI ("*.LC0") [flags 0x2] <string_cst 0x400b8780>)))) 46 {*pa.md:2717} (nil)
    (nil))
tlstst.c:21: confused by earlier errors, bailing out

Only happens with -fPIC. Likely I'm doing the rtl wrong in
legitimize_tls_address ()

tlstst.c is at http://www.parisc-linux.org/~tausq/tlstst.c

btw, Carlos, are you building glibc with linuxthreads or nptl when you
enable TLS? If I use nptl I get a lot of build errors very early in the
build process.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
