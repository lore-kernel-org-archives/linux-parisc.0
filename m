Received: from rhirst.linuxcare.com (pc188-bre9.cable.ntl.com [213.105.88.188])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id PAA17643
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 Jan 2001 15:50:16 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 80985B005; Thu, 18 Jan 2001 22:44:10 +0000 (GMT)
Date: Thu, 18 Jan 2001 22:44:10 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: "arete@libero.it" <arete@libero.it>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] No booting 715 old
Message-ID: <20010118224410.F28638@linuxcare.com>
References: <G7D13X$IWdMk3UWppTTFaurPylOrikzjQAW9PMmvU2uFHUGD@libero.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <G7D13X$IWdMk3UWppTTFaurPylOrikzjQAW9PMmvU2uFHUGD@libero.it>; from arete@libero.it on Thu, Jan 18, 2001 at 02:21:33PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jan 18, 2001 at 02:21:33PM +0100, arete@libero.it wrote:
> I have an 715/50 , with PDC rom 1.3 and IODC rom 1.1
> i use the palinux-0.5.iso image
>   and recive this messages
> 
> 
> .....
> 
> IASQ:00000000 IAOQ:c01c5280 c015280
> IIR:c840c00 ISR: 00000000 IOR:c02773f0
> ORIG_R28:00000000

If this is just after a message something like "ASP version .. found",
then it is a known problem with that kernel.  There is a newer kernel
on the ftp site, which you should try and boot (probably with rbootd
rather than bootpd on your server).

Richard
