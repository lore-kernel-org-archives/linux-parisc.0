Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA32130
	for <parisc-linux@puffin.external.hp.com>; Thu, 23 Sep 1999 09:29:47 -0600
Message-Id: <199909231530.IAA29217@milano.cup.hp.com>
To: Ryan Bradetich <rbradetich@uswest.net>
cc: Parisc Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Missing directories from CVS 
In-reply-to: Your message of "Wed, 22 Sep 1999 21:13:28 PDT."
             <37E99AD8.1472834B@uswest.net>
Date: Thu, 23 Sep 1999 08:30:21 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Ryan Bradetich wrote:
> Alex:
> 
> The following directories seem to be missing from the CVS repository:
> 
> drivers/isdn/eicon
> drivers/isdn/divert
> drivers/usb
> fs/efs
> net/irda

Yeah...I complained to Alex about this yesterday already.
And guess what? He fixed it! (kudos!)
You should try again...

I did a checkout, make config (for 715), make dep.
(make vmlinux is still running)

gcc is used to build scripts/mkdep, scripts/split-include and bin2hex.
The only thing I'm missing is native "gcc".  I don't have a native
"gcc" since I don't want to be confused about what's native and
what's cross-environment. So I built those items by hand with "cc".

Oh yeah...don't forget to ftp the ramdisk.bin if you start from
scratch like I did.

cheers,
grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
