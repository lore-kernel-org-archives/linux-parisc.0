Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA32162
	for <parisc-linux@puffin.external.hp.com>; Thu, 11 Jan 2001 09:33:53 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 11 Jan 2001 16:37:26 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id F4110B005; Thu, 11 Jan 2001 16:28:53 +0000 (GMT)
Date: Thu, 11 Jan 2001 16:28:53 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Aleksandr Konstantinov <sanjak@tipas.lt>
Cc: parisc-linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Booting palinux on model 735 problems.
Message-ID: <20010111162853.F18838@linuxcare.com>
References: <3699F3A6.1A7AFB31@tipas.lt>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3699F3A6.1A7AFB31@tipas.lt>; from sanjak@tipas.lt on Mon, Jan 11, 1999 at 02:50:46PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jan 11, 1999 at 02:50:46PM +0200, Aleksandr Konstantinov wrote:

1999?

> Hello All.
> 
>   I have problem.
>  We have here two HP Apollo 9000 Series 700 Model 735 boxes (both
> identical).  I tried to boot
> palinux-0.5.iso on one of them. Because boxes have no cdrom I did it
> through network using 
> rbootd (slightly modified to accept empty target names) giving it whole
> cdrom device as target.
> It started ok, listed all devices available on board and passed to (all
> strings are copied from
> screen)
> 
>   ASP version 20 at f0800000 found.
> 
> Then it waits a bit and writes at screen

See http://parisc-linux.org/faq.html question 8 - you probably need to
build/wait for a new kernel.

Richard
