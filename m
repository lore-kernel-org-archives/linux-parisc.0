Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA32329
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 May 2000 22:02:57 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 17 May 2000 04:03:01 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA31587;
	Wed, 17 May 2000 14:01:07 +1000
Date: Wed, 17 May 2000 14:01:07 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Paul Bame <bame@endor.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] glibc and the rest of the world
In-Reply-To: <Pine.LNX.4.21.0005170945210.24914-102000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0005171358590.24914-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 17 May 2000, Alan Modra wrote:

> I've attached a set of patches for the kernel and palo that use a `;!'
> comment start to provide backward compatibility with existing tools.

Which is incomplete, I've just found :-(  The kernel uses ';' in some
macros to generate asm, with bad results if you happen to be using
binutils where ';' is a comment char.  Fixing it....

-- 
Linuxcare.  Support for the Revolution.
