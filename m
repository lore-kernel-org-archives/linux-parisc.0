Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA30570
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 06:31:24 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 2 Jan 2001 13:34:42 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id AAA01623;
	Wed, 3 Jan 2001 00:34:38 +1100
Date: Wed, 3 Jan 2001 00:34:38 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Richard Hirst <rhirst@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 64 bit kernel crash with wrong r27 value
In-Reply-To: <20001222113950.A2554@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0101030033490.24351-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 22 Dec 2000, Richard Hirst wrote:

> had no cause to reload dp as that is always the callers responsibility.

Yes.  For hppa64, dp should be assumed trashed by any function call.
That means some further patches in entry.S are needed, which ought to be  
made #ifdef __LP64__

Alan
-- 
Linuxcare.  Support for the Revolution.
