Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA16821
	for <parisc-linux@puffin.external.hp.com>; Tue, 24 Oct 2000 08:10:00 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 24 Oct 2000 14:11:29 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id BAA16177;
	Wed, 25 Oct 2000 01:09:32 +1100
Date: Wed, 25 Oct 2000 01:09:32 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John Marvin <jsm@udlkern.fc.hp.com>
cc: David Huggins-Daines <dhd@linuxcare.com>, parisc-linux@thepuffingroup.com
Subject: Re: Bug in shared libraries
In-Reply-To: <Pine.LNX.4.21.0010241707160.11525-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0010250103340.11525-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

I've just committed a set of changes to binutils on pehc that should fix
the .PARISC.unwind section.  To build a good ld.so, you'll need to
recompile gcc (or at least libgcc) as well as glibc.  No more DT_TEXTREL
tags!

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
