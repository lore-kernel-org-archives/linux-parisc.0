Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D1993482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Oct 2001 14:10:11 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15pEoq-0006Pe-00; Thu, 04 Oct 2001 21:10:08 +0100
Date: Thu, 4 Oct 2001 21:10:08 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Neulinger, Nathan" <nneul@umr.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP-UX binary compatibility
Message-ID: <20011004211008.F14606@parcelfarce.linux.theplanet.co.uk>
References: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D861@umr-mail03.cc.umr.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D861@umr-mail03.cc.umr.edu>; from nneul@umr.edu on Thu, Oct 04, 2001 at 12:58:18PM -0500
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Oct 04, 2001 at 12:58:18PM -0500, Neulinger, Nathan wrote:
> int hpux_sysfs(int opcode, unsigned long arg1, unsigned long arg2)
> {
> /*Unimplemented HP-UX syscall emulation. Syscall #334 (sysfs)
>   Args: 1 80057bf4 0 400179f0 0 0 0 */
> 
>         if ( opcode == 1 ) { /* GETFSIND */
>                 printk(KERN_DEBUG "hpux_sysfs called with '%s'", (char
> *)arg1);
>         }
> 
>         printk(KERN_DEBUG "hpux_sysfs called with opcode = %d\n", opcode);
> }

You can't do that.  `arg1' points to a user address, not a kernel
address.  You need to use things like strlen_user and copy_from_user --
see include/asm-parisc/uaccess.h.

-- 
Revolutions do not require corporate support.
