Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.latnet.lv (mail.latnet.lv [159.148.108.208])
	by dsl2.external.hp.com (Postfix) with SMTP id 92DA34848
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Aug 2003 10:36:09 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1060878968.3f3bba7807eb5@clients.latnet.lv>
Date: Thu, 14 Aug 2003 19:36:08 +0300 (EEST)
From: Mihails Nikitins <nikitins@latnet.lv>
MIME-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Subject: [parisc-linux] PALO questions
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

Hi all,

1. PALO docs tell "recoverykernel" in palo.conf is the path to the kernel that
you want to boot within a failsafe session, it will be stored in the 'f0'
partition. Do I undertstand correctly that command like 
palo &#8211;I /dev/sda
copies file specified by paloc.conf line
--recoverykernel=/boot/vmlinux   ?

2. Is it possible to see f0 partition contents? In HP-UX, there are commands
working with LIF files like lifls and lifcp. How can I check if there is a
recovery kernel in PALO area?

3. I noticed palo warns about bad DOS magic. Is it normal?

# palo -I /dev/sda
palo version 1.0 bame@palinux Mon Apr  1 10:03:01 MST 2002
ELF32 executable
Bad DOS magic in extended partition 

fdisk -l /dev/sda

Disk /dev/sda: 64 heads, 32 sectors, 8683 cylinders
Units = cylinders of 2048 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sda1             1        17     17392   f0  Linux/PA-RISC boot
/dev/sda2            18        50     33792   fd  Linux raid autodetect
/dev/sda3            51       563    525312   fd  Linux raid autodetect
/dev/sda4           564      8683   8314880    5  Extended
/dev/sda5           564      4683   4218864   fd  Linux raid autodetect
/dev/sda6          4684      8683   4095984   fd  Linux raid autodetect

Many thanks in advance for your clever comments!

BR,
Mihails
