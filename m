Return-Path: <dub@latnet.lv>
Received: from mail.latnet.lv (mail.latnet.lv [159.148.108.13])
	by dsl2.external.hp.com (Postfix) with SMTP id 662524881
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 13 Feb 2004 11:06:14 -0700 (MST)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1076695572.402d1214ad4b7@clients.latnet.lv>
Date: Fri, 13 Feb 2004 20:06:12 +0200 (EET)
From: dub@latnet.lv
MIME-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Subject: [parisc-linux] can't compile 2.4.24: pdc_cons.o problem!
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi,

I'm trying to compile a new kernel for K210. I tried both stable 2.4.24 and 2.4.23
(got them by "apt-get -t stable kernel-source-2.4.2x")

"make bzImage" fails with the following output:

arch/parisc/kernel/pdc_cons.o: In function `pdc_console_die':
arch/parisc/kernel/pdc_cons.o(.text.pdc_console_die+0x28): undefined reference
to `log_end'
arch/parisc/kernel/pdc_cons.o(.text.pdc_console_die+0x2c): undefined reference
to `log_end'
arch/parisc/kernel/pdc_cons.o(.text.pdc_console_die+0x38): undefined reference
to `con_start'
arch/parisc/kernel/pdc_cons.o(.text.pdc_console_die+0x3c): undefined reference
to `con_start'
arch/parisc/kernel/pdc_cons.o: In function `pdc_console_restart':
arch/parisc/kernel/pdc_cons.o(.text.pdc_console_restart+0x44): undefined
reference to `log_end'
arch/parisc/kernel/pdc_cons.o(.text.pdc_console_restart+0x48): undefined
reference to `log_end'
arch/parisc/kernel/pdc_cons.o(.text.pdc_console_restart+0x4c): undefined
reference to `con_start'
arch/parisc/kernel/pdc_cons.o(.text.pdc_console_restart+0x50): undefined
reference to `con_start'
ld: arch/parisc/kernel/kernel.o(.text.show_trace+0x58): fixing R_PARISC_DPREL21L
make: *** [vmlinux] Error 1	

Please tell me what kernel version can be compiled for PDC support? I compiled
2.4.20 without any problems! As far as I understand, pre-compiled kernels are
compiled without any  PDC console support. Thanks in advance for any help, I'm
not a Debian kernel guru. :-)

BR,
Dub
