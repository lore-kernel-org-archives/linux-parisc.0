Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.iinet.net.au (symphony-02.iinet.net.au [203.59.24.17])
	by dsl2.external.hp.com (Postfix) with SMTP id C91C5482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Jun 2001 00:27:49 -0600 (MDT)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id OAA15595
	for parisc-linux@lists.parisc-linux.org; Thu, 28 Jun 2001 14:04:03 +0800
Date: Thu, 28 Jun 2001 14:03:59 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] rbootd for HP715/50
Message-ID: <20010628140358.A15334@neep.com.au>
References: <Pine.SOL.4.21.0106271612400.10527-100000@panther.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.SOL.4.21.0106271612400.10527-100000@panther.uwo.ca>; from yhan@uwo.ca on Wed, Jun 27, 2001 at 04:16:35PM -0400
List-ID: <linux-parisc.vger.kernel.org>

y.   han said:
> We are trying to use rbootd to boot up HP715/50 machines. The machine we 
> are using is running RedHat 7.1. We downloaded
> the rbootd files from
> ftp://puffin.external.hp.com/pub/parisc/binaries/tgz/rbootd-2.0-2.tar.gz
> 
> How can we run it so that the hp box can find it when it boot. how can we
> change rboot.conf file to make it work.
> 
> Or is there a manual/ instruction for it?

Have you installed this tarball's contents?  It does include a man page,
rbootd.8 ...

  tar xzpvfC rbootd-2.0-2.tar.gz /

You'll need to modify /etc/rbootd.conf that contains the MAC address of
your workstation and the name of the image file.

Here is one of mine, for example:

  08:00:09:35:B9:38       Image         # hpsauce Linux kernel

Your kernel image(s) need to go in /export/hp/rbootd for this build of
rbootd (as far as I can tell).  "mkdir -p /export/hp/rbootd" to create.

As for how to start it, well, just run "/etc/rc.d/init.d/rbootd start" ...

Andrew.

--
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
