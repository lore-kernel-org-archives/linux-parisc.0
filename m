Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id KAA20348
	for <hppa-linux@sod.res.cmu.edu>; Fri, 19 Mar 1999 10:39:47 -0500
Received: (from smap@localhost)
          by dfw-ix4.ix.netcom.com (8.8.4/8.8.4)
	  id JAA05505 for <hppa-linux@thepuffingroup.com>; Fri, 19 Mar 1999 09:39:04 -0600 (CST)
Date: Fri, 19 Mar 1999 07:40:09 -0800 (PST)
From: Kumar <kumar@ix.netcom.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Gateway instructions
In-Reply-To: <36F1754D.17EA4048@netscape.com>
Message-ID: <Pine.LNX.3.96.990319072704.180B-100000@quark.ix.netcom.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


> > The B bit is not a problem as long as the delay slot of the branch to the
> > gateway is either nullified or filled in with a non-branch instruction.
> > For example,
> > 
> >     LDIL L'GATEWAY,%r1
> >     BLE  R'GATEWAY(%sr7,%r1)
> >     LDO  sycallnum,%r22

	Branch to space in %sr7 and offset contained in %r1,
	also load the syscall number in %r22 in the delay slot of BLE.
	I guess the assumption here is that %sr7 points to system space.
	Value of GATEWAY can be replaced by 0xc0000000 or whatever.	
	
	A equivalent 80386 sequence to make syscall:

	movl	$1, %eax	; load syscall num in %eax. in this case
						"exit"
	int	$0x80		; syscall trap in to kernel

	The number 80 is OS dependent and no magic number. Its just that
	Linux 80386 goes through trap gate 128 (0x80) for syscalls.


						pkd
> 
> Someday (maybe today, if I get all my work done =) ), I'll learn to read
> that.
> 
> Mike
> 
> -- 
