Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id 59DB448B0
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Oct 2001 11:59:13 -0600 (MDT)
Message-ID: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D861@umr-mail03.cc.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] HP-UX binary compatibility
Date: Thu, 4 Oct 2001 12:58:18 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

I'm just getting my feet wet in this, but this didn't work:

int hpux_sysfs(int opcode, unsigned long arg1, unsigned long arg2)
{
/*Unimplemented HP-UX syscall emulation. Syscall #334 (sysfs)
  Args: 1 80057bf4 0 400179f0 0 0 0 */

        if ( opcode == 1 ) { /* GETFSIND */
                printk(KERN_DEBUG "hpux_sysfs called with '%s'", (char
*)arg1);
        }

        printk(KERN_DEBUG "hpux_sysfs called with opcode = %d\n", opcode);
}

If I comment out that if block, it runs just fine. Is there a call I should
use to make sure an address is safe prior to using it? (i.e. so I don't
cause an oops?) I get an immediate dump on the console as soon as I run the
app I'm testing.

BTW, w/ a couple of small stub wrappers, I've been able to get flexlm to run
and serve licenses, and have lmdiag say it's working (and can check out
licenses), but for some reason client applications are not working, so I'm
just trying to add any missing syscals it uses where possible to see if I
can figure out the problem. 

-- Nathan

> -----Original Message-----
> From: John Marvin [mailto:jsm@udlkern.fc.hp.com]
> Sent: Thursday, October 04, 2001 6:57 AM
> To: parisc-linux@lists.parisc-linux.org
> Subject: [parisc-linux] HP-UX binary compatibility
> 
> 
> 
> I just committed a patch that restores some of the elementary HP-UX
> binary compatibility functionality. Shared libraries also work. But
> there is a ton of more work to do. Lots of wrappers need to be written
> (see the arch/parisc/hpux directory for files that contain the support
> for this functionality). One major missing piece is signal support.
> Mapping ioctl arguments is another significant effort ...
> 
> John
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
