Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA10530
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Sep 2000 18:27:44 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 13 Sep 2000 00:28:04 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA25772;
	Wed, 13 Sep 2000 11:23:45 +1100
Date: Wed, 13 Sep 2000 11:23:45 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: Cary Coutant <cary@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] userspace function pointers in the kernel
In-Reply-To: <878zsxmhjx.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0009131032060.23150-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 12 Sep 2000, David Huggins-Daines wrote:

> Cary Coutant <cary@cup.hp.com> writes:
> > For Linux, I strongly recommend that the dynamic loader guarantee that 
> > there is a 1-1 mapping between function and function pointer. If you do 
> > this, you won't need this silly special case when comparing function 
> > pointers.
> 
> I agree that this is a valid goal.  Unfortunately I believe we are
> falling short of it at the moment and we'll have to make some fairly
> large changes to the toolchain.

David, I think this is the reason we do actually need your dynamic fptr
code, or at least something like it that can sort through plt entries.
Currently, plabels go through the plt whenever dynamic sections are
involved.  However, there is a problem in that we are duplicating plt
entries between the application and shared libs, and I can't think of a
way the linker can avoid this given that we have to deal with weak
symbols.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
