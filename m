Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A53704A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 22:47:57 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14VobE-0003UP-00; Wed, 21 Feb 2001 22:47:32 -0700
Date: Wed, 21 Feb 2001 22:47:32 -0700
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Modra <alan@linuxcare.com.au>
Cc: Helge Deller <deller@gmx.de>, Matthew Wilcox <matthew@wil.cx>,
	PL <parisc-linux@lists.parisc-linux.org>
Message-ID: <20010221224732.Q31164@parcelfarce.linux.theplanet.co.uk>
References: <01022201400100.16704@P100.helgenet.de> <Pine.LNX.4.21.0102221622370.14557-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0102221622370.14557-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Thu, Feb 22, 2001 at 04:32:51PM +1100
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Re: schedule_tail
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Feb 22, 2001 at 04:32:51PM +1100, Alan Modra wrote:
> On Thu, 22 Feb 2001, Helge Deller wrote:
> 
> > As far as I've tested, the following patch (HACK!) to 
> > ret_from_kernel_thread() against CVS head gets me at least to the 
> > init-process (where it then crashes).
> 
> I ripped out this call to schedule_tail _and_ the other one in
> child_return, and things are working again for me.  schedule_tail doesn't
> do much on uniprocessor.  Most likely %r26 was wrong.  I'd like to know 
> why the stack adjust before calling schedule_tail too.

It does a lot of important stuff on SMP though.  It does the stack adjust
before calling because the disassembled 32-bit SMP code looks like this:

101186f4 <schedule_tail>:
101186f4:       08 03 02 41     copy r3,r1
101186f8:       08 1e 02 43     copy sp,r3
101186fc:       6b c2 3f d9     stw rp,-14(sr0,sp)

and we don't want to trash what was below the sp.

-- 
Revolutions do not require corporate support.
