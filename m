Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA19714
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 Jan 2001 16:25:40 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 18 Jan 2001 23:29:24 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C5E6CB005; Thu, 18 Jan 2001 23:20:09 +0000 (GMT)
Date: Thu, 18 Jan 2001 23:20:09 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Josiah Carlson <jcarlson@macalester.edu>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] /proc problems
Message-ID: <20010118232009.G28638@linuxcare.com>
References: <3A677280148.B3CFJCARLSON@smtp.macalester.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A677280148.B3CFJCARLSON@smtp.macalester.edu>; from jcarlson@macalester.edu on Thu, Jan 18, 2001 at 04:47:28PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jan 18, 2001 at 04:47:28PM -0600, Josiah Carlson wrote:
> Good afternoon,
> 
> (I'm using the .5 image and used the install instructions on
> www.parisc-linux.org/install.html to get the booting system on a B160L)
> 
> Upon boot, the system is not automatically mounting /proc.
> I made sure that the line:
> /proc	/proc	proc	defaults
> was in /etc/fstab, but the kernel never mounts it.
> 
> I also need a script to be run every boot (to set up the ethernet
> interface...or if it automatically did this, I would be happy to know
> how to do set it up to do this as well.)

I thought the instructions for that were in the README.POSTINSTALL
on the CD image...

Richard
