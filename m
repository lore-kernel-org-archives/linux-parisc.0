Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 67F454A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Feb 2001 14:31:08 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14XVEB-0005Si-00; Mon, 26 Feb 2001 21:30:43 +0000
Date: Mon, 26 Feb 2001 21:30:43 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Alan Modra <alan@linuxcare.com.au>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: pipes
Message-ID: <20010226213043.E22753@parcelfarce.linux.theplanet.co.uk>
References: <20010223113052.G4660@linuxcare.com> <Pine.LNX.4.21.0102232231470.9345-100000@front.linuxcare.com.au> <20010223212325.K4660@linuxcare.com> <20010226175701.U4660@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010226175701.U4660@linuxcare.com>; from rhirst@linuxcare.com on Mon, Feb 26, 2001 at 05:57:01PM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Feb 26, 2001 at 05:57:01PM +0000, Richard Hirst wrote:
> Now for us lseek is of type __off64_t (from /usr/include/unistd.h),
> although our kernel has sys_lseek() returning off_t, which is 32
> bits.  Anyway, if I try to print the 64 bit return value from lseek()
> I get 0x00000000ffffffe3.  The lower 32 bits is -ESPIPE, which is the
> expected errno.  I don't know if glibc, kernel, or both are at fault
> here.

Good catch!  The code in sys_lseek seems pretty explicit that it's only
going to return an off_t:

                loff_t res = llseek(file, offset, origin);
                retval = res;
                if (res != (loff_t)retval)
                        retval = -EOVERFLOW;    /* LFS: should only happen on 32
 bit platforms */

and our off_t is:
include/asm-parisc/posix_types.h:typedef long                   __kernel_off_t;

So /usr/include/unistd.h is wrong.  lseek is not 64-bit.

Another way of fixing this would be to make off_t 64-bit... i suspect
that might have performance implications though.

-- 
Revolutions do not require corporate support.
