Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF8DC4845
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Mar 2002 08:58:39 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16mzWr-0000hd-00; Mon, 18 Mar 2002 15:58:33 +0000
Date: Mon, 18 Mar 2002 15:58:33 +0000
From: Matthew Wilcox <willy@debian.org>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] STI without PCI
Message-ID: <20020318155833.M21765@parcelfarce.linux.theplanet.co.uk>
References: <1016466919.3c960de7350ce@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1016466919.3c960de7350ce@webmail.tiscalinet.be>; from joel.soete@freebel.net on Mon, Mar 18, 2002 at 04:55:19PM +0100
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Mon, Mar 18, 2002 at 04:55:19PM +0100, joel.soete@freebel.net wrote:
> I uncheck CONFIG_PCI in my .config file then make menuconfig and make dep ; make
> cklean ; make vmlinux.
> 
> It compiles successfully (with apt-get dist-upgrade this morning).

thanks.

> BUT:
> (or 'b' to boot with this command line)? b
> 
> Command line for kernel: 'root=/dev/sda3 HOME=/ console=ttyS0 TERM=vt102
> palo_kernel=3/boot/vmlinux-t'
> Selected kernel: /boot/vmlinux-t from partition 3
> ...
> parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
> STI word mode ROM at f0011000, hpa=f8000000
> STI word mode ROM, id 2d08c0a7-9a02587, conforms to spec rev. 8.07
> STI device: INTERNAL_EG_1280
> Console: switching to colour frame buffer device 160x64
> ...
> 
> Please append a correct "root=" boot option
> Kernel panic: VFS: Unable to mount root fs on 08:03

umm.. could you show the portions of your boot log relating to scsi or sda?

-- 
Revolutions do not require corporate support.
