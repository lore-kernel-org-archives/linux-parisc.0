Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA06680
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 12:20:32 -0600
Date: Mon, 21 Jun 1999 12:20:14 -0600 (MDT)
From: Mike Hibler <mike@fast.cs.utah.edu>
Message-Id: <199906211820.MAA06267@fast.cs.utah.edu>
To: sieler@allegro.com
Subject: Re: [parisc-linux] HPUX binary compatibility
Cc: Matthew.Wilcox@genedata.com, law@cygnus.com,
        parisc-linux@thepuffingroup.com
List-ID: <linux-parisc.vger.kernel.org>

> From: Stan Sieler <sieler@allegro.com>
> Subject: Re: [parisc-linux] HPUX binary compatibility
> To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
> Date: Mon, 21 Jun 1999 10:23:17 -0700 (PDT)
> 
> Hi,
> 
> > > Just write translators on the hpux emulation side.
> > 
> > Yes, this is certainly what we'll do.  But if we can be clever and get a
> > bunch of compatibility for free, then we should.
> 
> The problem with translators is that they don't work in all cases.
> 
> The most important case is where you want to link some .o files
> together: some are compiled for Linux, some for HP-UX. 
> 
> *That's* why having different system call numbers is important.
> 
> -- 
> Stan Sieler                                          sieler@allegro.com
>                                          http://www.allegro.com/sieler/

Yow, that is an ambitious goal!  I can see the desirability of doing it
this way, but I am afraid it may not work.  No example comes to mind but
I worry about subtle assumptions in code written for HP-UX; i.e., merely
defining your structures and constants the same as HP-UX may not be enough.

Like Jeff said, we got by (and still do) by either building such applications
on an HP-UX box or using an emulated HP-UX environment to create real HP-UX
binaries.

Hmm...just read Stan's last message.  There seems to be some confusion about
what we do for compatibility.  When we exec a binary, it is identified as
either being HP-UX or "native" (BSD).  That determines which syscall mapping
is used.  There is no need to have distinct name spaces this way.

Does no other Linux port provide native OS compatibility?
