Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA16629
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Jun 1999 20:21:18 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id WAA07840
	for <parisc-linux@thepuffingroup.com>; Tue, 29 Jun 1999 22:31:10 -0400
Sender: adevries@feather.thepuffingroup.com
Message-ID: <3779816D.CF8B8F02@thepuffingroup.com>
Date: Tue, 29 Jun 1999 22:31:09 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/33]
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>


Matthew Wilcox wrote:

> Linux version 2.2.1 (willy@bmw) (gcc version egcs-2.91.60 19981201 (egcs-1.1.1
> release)) #18
>  Wed Jun 30 05:46:53 METDST 1999
> 
> at which point it hangs and I have to reset.  Excellent work.

Well, not a bad start, but what worries me is that this boot sequence
should really go on a bit more.  I'm not quite sure where the problem
is, it might be with some PDC calls we do within setup_arch().

I'll upload a binary of the kernel that I know works on my A class.  I'd
appreciate it if people could email tests of this on different machines.


- Alex
-- 
Alex deVries
Vice President of Engineering
The Puffin Group
