From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] kernel module relocation bug
Date: Fri, 26 Nov 2004 22:47:10 -0800
Message-ID: <20041127064710.GL9148@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

currently the kernel module loader does not support long branch stubs.
using the debian 2.6.8-1 kernel, when loading the ipv6 module, i see:

legolas[6:43] linux-2.6% sudo modprobe ipv6
FATAL: Error inserting ipv6 (/lib/modules/2.6.8-1-32-smp/kernel/net/ipv6/ipv6.ko): Invalid module format

in syslog, i get:
module ipv6 relocation of symbol fold_prot_inuse is out of range (0x3ffeffe2 in 17 bits)

these are the other modules i have loaded at the moment:

legolas[6:26] linux-2.6% lsmod
Module                  Size  Used by
ehci_hcd               58788  0
ohci_hcd               41924  0
usbcore               121084  2 ehci_hcd,ohci_hcd
tulip                  65468  0
ad1889                 19524  0
soundcore              13828  1 ad1889
ac97_codec             24876  1 ad1889
tg3                   107760  0
ext3                  135588  2
jbd                   103960  1 ext3
sd_mod                 24416  5
sym53c8xx             105004  4

the kernel i have is:
Linux legolas 2.6.8-1-32-smp #1 SMP Tue Nov 2 13:07:05 MST 2004 parisc
GNU/Linux

to fix this we will probably need to introduce long branch stubs into 
into the kernel module loader. anybody want to give this a shot?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
