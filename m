Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.latnet.lv (mail.latnet.lv [159.148.108.208])
	by dsl2.external.hp.com (Postfix) with SMTP id 26D9F482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Jul 2003 10:03:58 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1057161835.3f03026b7fc95@clients.latnet.lv>
Date: Wed, 02 Jul 2003 19:03:55 +0300 (EEST)
From: Dub <dub@latnet.lv>
MIME-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Subject: [parisc-linux] Where to get precompiled SMP kernel for 2.4.20?
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

Hi,

I have installed Debian from netinst CD found at
http://pateam.esiee.fr/cd-images/testing/palinux-2.4.20-pa35-20030513-netinst.iso

Q. Is it possible to get pre-compiled SMP kernel for this version 2.4.20. 

Official Woody release is 2.4.18, any actions with kernel 2.4.18 (even
installing of kernel-source) give the error

Setting up kernel-image-2.4.18-32-smp (12.1) ...
depmod: *** Unresolved symbols in
/lib/modules/2.4.18-32-smp/kernel/net/ipv4/netfilter/ip_tables.o
depmod: *** Unresolved symbols in
/lib/modules/2.4.18-32-smp/kernel/net/ipv4/netfilter/ipchains.o
 
I understand that I can try re-compiling the kernel, but ready-to-go variants
may also fit my needs.

Thanks in advance for your help!

BR,
Dub
