Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA13608
	for <parisc-linux@puffin.external.hp.com>; Thu, 22 Jun 2000 21:09:39 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 23 Jun 2000 03:10:47 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA04339;
	Fri, 23 Jun 2000 12:14:40 +1000
Date: Fri, 23 Jun 2000 12:14:40 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Pavel Roskin <proski@gnu.org>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Busybox 0.45 released 
In-Reply-To: <Pine.LNX.4.21.0006222110110.13718-100000@sunapee.transcept.com>
Message-ID: <Pine.LNX.4.21.0006231211550.24137-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 22 Jun 2000, Pavel Roskin wrote:

> I've been there already. What really needs to be there is libc with all
> headers. It is very hard to compile libc. Its makefiles do really crazy
> things. It even tried to commit something to CVS.

configure --without-cvs to stop the commit attempts.

-- 
Linuxcare.  Support for the Revolution.
