Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA06327
	for <parisc-linux@puffin.external.hp.com>; Wed, 13 Dec 2000 19:55:56 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 14 Dec 2000 02:58:43 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id NAA10587;
	Thu, 14 Dec 2000 13:57:21 +1100
Date: Thu, 14 Dec 2000 13:57:21 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
cc: parisc-linux@thepuffingroup.com, jes@linuxcare.com
Subject: Re: [parisc-linux] phase 2 gcc build fails 
In-Reply-To: <Pine.LNX.4.21.0012141124330.2565-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0012141355570.2565-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 14 Dec 2000, Alan Modra wrote:

> What I've got to do, I guess, is to commit my tree back to the main truck.
> eg. in the case of config.if, we want a version 1.2 which will be identcal
> to version 1.1.1.2

Seemed to work OK.  A "cvs update -d" in your gcc directory should now
fix your tree for you.

-- 
Linuxcare.  Support for the Revolution.
