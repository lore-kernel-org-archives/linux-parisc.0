Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA05845
	for <parisc-linux@puffin.external.hp.com>; Tue, 10 Oct 2000 12:31:21 -0600
Date: Tue, 10 Oct 2000 11:28:08 -0700
From: Randolph Chung <randolph@tausq.org>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Matt Taggart <taggart@carmen.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] New nfsroots and xc
Message-ID: <20001010112808.A26106@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20001010034345.6607638131@carmen.fc.hp.com> <20001010113957.E9399@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001010113957.E9399@linuxcare.com>; from rhirst@linuxcare.com on Tue, Oct 10, 2000 at 11:39:58AM +0100
List-ID: <linux-parisc.vger.kernel.org>

> 10:~# make mlock 
> cc     mlock.c   -o mlock
> /usr/bin/ld: cannot open crt1.o: No such file or directory
> collect2: ld returned 1 exit status
> make: *** [mlock] Error 1
> 
> 

According to Bdale, the fix is:

ln -s /usr/lib /usr/hppa-linux/lib

randolph
-- 
Debian Developer <tausq@debian.org>
http://www.TauSq.org/
