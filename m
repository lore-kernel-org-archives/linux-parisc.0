Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id E497F4832
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Mar 2002 08:55:26 -0700 (MST)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 16mzTk-0001Lm-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Mar 2002 16:55:20 +0100
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1016466919.3c960de7350ce@webmail.tiscalinet.be>
Date: Mon, 18 Mar 2002 16:55:19 +0100 (CET)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] STI without PCI
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

Hi Matt,

I test your patch against k-2.4.18-pa5 (co this morning)

I uncheck CONFIG_PCI in my .config file then make menuconfig and make dep ; make
cklean ; make vmlinux.

It compiles successfully (with apt-get dist-upgrade this morning).

BUT:
(or 'b' to boot with this command line)? b

Command line for kernel: 'root=/dev/sda3 HOME=/ console=ttyS0 TERM=vt102
palo_kernel=3/boot/vmlinux-t'
Selected kernel: /boot/vmlinux-t from partition 3
...
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
STI word mode ROM at f0011000, hpa=f8000000
STI word mode ROM, id 2d08c0a7-9a02587, conforms to spec rev. 8.07
STI device: INTERNAL_EG_1280
Console: switching to colour frame buffer device 160x64
...

Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 08:03

I hope it will help you,
    Joel

-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
