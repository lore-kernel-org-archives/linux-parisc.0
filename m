Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA13615
	for <parisc-linux@puffin.external.hp.com>; Thu, 7 Dec 2000 15:38:12 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 7 Dec 2000 22:40:03 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id JAA08137;
	Fri, 8 Dec 2000 09:37:58 +1100
Date: Fri, 8 Dec 2000 09:37:58 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: eprintf error when xcompiling gcc
In-Reply-To: <20001207213645.DB70E37CA1@carmen.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0012080855200.6808-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

__eprintf is used by assert, and only when gcc's own assert.h is used.  So
it seems likely to me that your cross compiler is having difficulty
finding it's libc headers.  Probably a configure/install type problem.

-- 
Linuxcare.  Support for the Revolution.
