Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA08946
	for <parisc-linux@puffin.external.hp.com>; Wed, 28 Jun 2000 22:43:39 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 29 Jun 2000 04:44:50 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA15631;
	Thu, 29 Jun 2000 14:44:30 +1000
Date: Thu, 29 Jun 2000 14:44:30 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: chester@linux.org.tw
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] userland test failure
In-Reply-To: <Pine.LNX.4.10.10006291108220.17571-100000@localhost.localdomain>
Message-ID: <Pine.LNX.4.21.0006291440280.27908-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 29 Jun 2000 chester@linux.org.tw wrote:

> But if i add -fPIC options,get
> 
> /tmp/cc4QxRpc.o : In function 'main'
> /mnt/download/PA/hello.c:3: undefined reference to `$global$`

-fPIC and -shared are not supported at the moment, even with the newer
binutils-2.10 module available from puffin CVS.  With binutils-2.10,
you'll get a different error if you compile with -fPIC, something like:
"cannot handle relocation R_PARISC_DLTIND21L for .LC0 at 0x28 in .text"

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
