Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viemta05.chello.at (viemta05.chello.at [195.34.133.55])
	by dsl2.external.hp.com (Postfix) with ESMTP id AEA56482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 25 Mar 2001 14:41:09 -0700 (MST)
Received: from dot.at ([62.178.92.247]) by viemta05.chello.at
          (InterMail vK.4.03.02.00 201-232-124 license 6aea1bd1f01aef5a9a73363c16ebee43)
          with ESMTP id <20010325214107.IRTY24343.viemta05@dot.at>
          for <parisc-linux@lists.parisc-linux.org>;
          Sun, 25 Mar 2001 23:41:07 +0200
Sender: chris@dsl2.external.hp.com
Message-ID: <3ABE65F2.16100D87@dot.at>
Date: Sun, 25 Mar 2001 23:41:06 +0200
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
References: <20010322115429.50240D15F5@mail.esiee.fr>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Again problem with FS of ESIEE on 720 !
List-ID: <linux-parisc.vger.kernel.org>

Again and again. The ESIEE file system does not work. The kernel
is built myself (not from ESIEE !!!) and the nfs_root is set to
ESIEE. The problem is, that the init or other processes like shell
do not start. The hang before any output is done.

I instruemented the kernel for testing stdout via /dev/console and
to print out where it is. In the kernel everything is perfect.

No process is able to start (giver per init= command line or patched
in init/main.c in the kernel tree.

Also an old trick of mine, starting the bash or init via strace from
the kernel (calling strace instead of init in execve) does not work,
noi reaction, the system seems to be halted or no I/O is working,
or perhaps there is a problem with the shared libraries.

Is there something to do special by building the kernel to use ESIEE ??
Cheers
	Christoph


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
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
