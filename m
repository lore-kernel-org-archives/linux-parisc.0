Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id B92924A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Feb 2001 10:56:42 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 87EFFB005; Mon, 26 Feb 2001 17:57:01 +0000 (GMT)
Date: Mon, 26 Feb 2001 17:57:01 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: pipes
Message-ID: <20010226175701.U4660@linuxcare.com>
References: <20010223113052.G4660@linuxcare.com> <Pine.LNX.4.21.0102232231470.9345-100000@front.linuxcare.com.au> <20010223212325.K4660@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010223212325.K4660@linuxcare.com>; from rhirst@linuxcare.com on Fri, Feb 23, 2001 at 09:23:25PM +0000
List-ID: <linux-parisc.vger.kernel.org>

This is looking like a glibc/kernel issue regardling the width
of the type returned by lseek():


I have a simple way of reproducing the bug now:

merlin:/build# echo 'if ( test  -r /dev/null ); then echo TRUE; fi;
echo Oops' | /bin/sh
TRUE
merlin:/build#


The echo parameter is split over two lines there, and should result
in two lines of output 'TRUE' and then 'Oops'.

/bin/sh picks up input with one read of 57 characters, and then
processes the string, char by char, via input.c:buffered_getchar(),
until it has the complete if..then..fi\n (about 46 characters). Then it
tries to stuff input following the 'fi\n' back on to the input stream by
doing an lseek(fd, -n, SEEK_CUR), before forking a child to do the
'test'.  On return from the child, it expects to pick up the input it
stuffed back on to the input stream.

The problem is that the input stream is a pipe, and lseek doesn't work.
bash should have decided that its input stream was not seekable and
dropped back to multiple reads of one byte.  It uses this test:

#  define fd_is_seekable(fd) (lseek ((fd), 0L, SEEK_CUR) >= 0)

and then

  if (fd_is_seekable (fd) == 0)
    size = 1;
  else
    size = (size_t)((sb.st_size > MAX_INPUT_BUFFER_SIZE) ? ...


Now for us lseek is of type __off64_t (from /usr/include/unistd.h),
although our kernel has sys_lseek() returning off_t, which is 32
bits.  Anyway, if I try to print the 64 bit return value from lseek()
I get 0x00000000ffffffe3.  The lower 32 bits is -ESPIPE, which is the
expected errno.  I don't know if glibc, kernel, or both are at fault
here.

Richard
 
