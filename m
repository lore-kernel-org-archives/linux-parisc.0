Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 21A66482B
	for <parisc-linux@lists.parisc-linux.org>; Sat,  4 Aug 2001 07:52:47 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A5761B00C; Sat,  4 Aug 2001 14:54:23 +0100 (BST)
Date: Sat, 4 Aug 2001 14:54:23 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: S Looman <steve__l__@hotmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 715/80 not booting (kernel crashes)
Message-ID: <20010804145423.K1011@linuxcare.com>
References: <F71V8zDv60gxapzhad20000df92@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <F71V8zDv60gxapzhad20000df92@hotmail.com>; from steve__l__@hotmail.com on Thu, Aug 02, 2001 at 11:03:32AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 02, 2001 at 11:03:32AM +0200, S Looman wrote:
> Hi,
> 
> Just got a 715/80 box from a friend and started playing with it, but HP-UX 
> sucks and wanted to install linux on it.
> I downloaded the iso-image yesterday and booted it.
> 
> The cd boots, starts loading the kernel 'n stuff. But then it panics.
> 
> It has the same dump as this email: 
> http://lists.parisc-linux.org/pipermail/parisc-linux/2001-July/013193.html
> 
> I guess using another kernel should fix it, but I can't build any kernel...
> 
> Can anybody give me a kernel (or suggestions)?

It is very unlikely that you get the same dump as that mail reported,
as that was froma 2.4.6 kernel, while the ISO uses a 2.4.0 one.

Are you using a serial or graphical console?  Serial console is more
likely to work, and has the advantage that you can capture the output
(with minicom, for example), to post here.

Which ISO are you using?  0.9 or 0.9.2?

Richard
