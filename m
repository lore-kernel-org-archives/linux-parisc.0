Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.alcatel.at (atusks01.alcatel.at [212.183.9.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 70C294A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Mar 2001 05:05:07 -0700 (MST)
Sender: christoph.plattner@alcatel.at
Message-ID: <3AB9EA34.61A8270B@alcatel.at>
Date: Thu, 22 Mar 2001 13:04:04 +0100
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: marteau <marteaut@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem with FS of ESIEE on 720 !
References: <20010322115429.50240D15F5@mail.esiee.fr>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Topic /dev/console :

You have to do nothing for "automatic" !!
The kernel manage this. The device `/dev/console' has
the major=5 minor=1. This device driver registered to this
major uses the system console. The system console driver
itself is internal a wrapper to the configured device
driver, defined via "console=ttyS0" the kernel command line
parameter. In this case (ttyS0) the driver on major=5
(/dev/console) intern calls the console i/o functions
(an own structure in the kernel) which are pointing to the
serial driver. In an other case, the pointer points to a
STI console interface. Also printk uses the pointer to
the write operation of the defined console !!

This console stuff was introduced in kernel 2.2
(2.1.xxx).

So the file system only should have the entry

crw-rw-rw-  root  root  5  1  xxxx xxxx /dev/console

Cheers
	Christop P.


marteau wrote:
> 
> Hi Christoph and PA-RISCers !
> 
> >I have tried the current and the last ESIEE file system,
> >but I have problems with both. I used my own kernel,
> The kernels you will find are designed for 712 but it seems to work
> many others boxes!
> vmlinux.mou is a kernel that integrate the low level mouse driver!
> (you can check via /proc/interrupts)
> 
> >running with the palinux-0.5, but the ESIEE always hangs.
> >If I do not change the /dev/console, I get the warning...
> >(of course, I have not compiled in the STI). So tried
> >to set the `mknod console c 5 1' and I also tried the
> >"hack" doing a link to `ttyS0'. In both cases `init'
> I read what Matthew wrote. We goona look at it in order to be
> automatic
> 
> >gives no welcome message (version, etc...) and the machine
> >hangs !
> Our inittab file is specific for dual screen (if you use STI console
> and Serial terminal!)
> I do not know how it reacts if the kernel expect a console with the
> serail port :( Any idea?
> 
> Also you can refer to this mail:
> http://lists.parisc-linux.org/pipermail/parisc-linux/2001-March/011997
> .html
> 
> >Now I will instrument the kernel with `printk's to see,
> >if he can start something,.....
> You can but once init is launched the dmesg is less usefull.
> 
> >What's the topic with the TERM variable ??
> TERM=LINUX is not operational
> TERM=vt100 or pcansi are working!
> 
> >Have I set it to a special value ???
> >Can that be the reason ???
> Don't think so
> 
> Bye, Thomas
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
  +--------V--------+	Christoph.Plattner@alcatel.at
  |  A L C A T E L  |	-----------------------------
  +-----------------+	Phone: +43 1 27722 3706	
         T A S		Fax:   +43 1 27722 3955
