Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 82A554A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 11:25:13 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14W0Px-0007L7-00; Thu, 22 Feb 2001 11:24:41 -0700
Date: Thu, 22 Feb 2001 11:24:41 -0700
From: Matthew Wilcox <matthew@wil.cx>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Alan Modra <alan@linuxcare.com.au>,
	Matthew Wilcox <matthew@wil.cx>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: schedule_tail
Message-ID: <20010222112441.T31164@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.21.0102222150310.14557-100000@front.linuxcare.com.au> <Pine.LNX.4.21.0102230114130.14557-100000@front.linuxcare.com.au> <20010222144331.G1129@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010222144331.G1129@linuxcare.com>; from rhirst@linuxcare.com on Thu, Feb 22, 2001 at 02:43:31PM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Feb 22, 2001 at 02:43:31PM +0000, Richard Hirst wrote:
> On Fri, Feb 23, 2001 at 01:28:36AM +1100, Alan Modra wrote:
> > This is really crazy (or I am).  I replaced the calls to schedule_tail
> 
> This helps for me.  b,l disassembles as call, not b,l ...,rp:
> 
> ===================================================================
> RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/entry.S,v
> retrieving revision 1.72
> diff -u -r1.72 entry.S
> --- entry.S     2001/02/20 02:19:52     1.72
> +++ entry.S     2001/02/22 14:33:43
> @@ -509,7 +509,7 @@
>  
>         /* Call schedule_tail first though */
>  
> -       b,l     schedule_tail, %r2
> +       bl      schedule_tail, %r2

This is crazy.  entry.S is .level 2.0.  bl is not a pa2.0 opcode, b,l is!
What is going on?!

Wait.  Is it...

`The word displacement is assembled from the w, w1, w2, and (when the
,L completer is specified with GR 2 as the link register) w3 fields in
the instruction.''

which, iirc is not available on pa1.1 processors.  So here's the crucial
difference.  Not 32-bit vs 64-bit.  Not SMP vs UP.  But pa1.1 vs 2.0.

-- 
Revolutions do not require corporate support.
