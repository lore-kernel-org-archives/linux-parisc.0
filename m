Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id SAA05973
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 18:07:05 -0700
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA09613;
	Fri, 1 Dec 2000 12:07:29 +1100
Date: Fri, 1 Dec 2000 12:07:29 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Paul Bame <bame@noam.fc.hp.com>
cc: parisc-linux@puffin.external.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] time_t, size_t, off_t, ...
In-Reply-To: <E141Zid-00049i-00@noam.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0012011205310.2814-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 30 Nov 2000, Paul Bame wrote:

> (6)	Debugger is going to care about structs in elf.h, which are not
> 	identical narrow and wide at the present time.

I'm more concerned about the fact that quite a few registers of interest
are missing from elf_gregset_t

-- 
Linuxcare.  Support for the Revolution.
