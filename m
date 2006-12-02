From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] kernel crash with IPv6
Date: Sat, 2 Dec 2006 15:15:47 +0100
Message-ID: <200612021515.47161.deller__32409.2464325533$1416624225$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: "list parisc-linux" <parisc-linux@lists.parisc-linux.org>
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

Just got a kernel crash with our git tree code.
Not sure if this is generic problem or related to parisc.
I didn't investigated any further. 
Just reporting her in case someone has an idea.
IPV6 and serial console were enabled.
Turning IPV6 off fixed it for me.

Helge
-----------
rtc-test rtc-test.0: setting the system clock to 2006-12-02 14:04:48 (1165068288)
Sending BOOTP requests . OK
IP-Config: Got BOOTP answer from 192.168.178.50, my address is 192.168.178.70
IP-Config: Complete:
      device=eth0, addr=192.168.178.70, mask=255.255.255.0, gw=192.168.178.1,
     host=c3000, domain=box, nis-domain=(none),
     bootserver=192.168.178.50, rootserver=192.168.178.50, rootpath=
md: Autodetecting RAID arrays.
skb_over_panic: text:1045715c len:56 put:16 head:8fa40a80 data:8fa40a90 tail:8fa40ac8 end:8fa40ac0 dev:eth0
kernel BUG at net/core/skbuff.c:93!
Backtrace:
 [<103e4b44>] skb_over_panic+0x74/0x84
 [<10457164>] ndisc_send_rs+0x268/0x4ac
 [<1044d15c>] addrconf_dad_completed+0x84/0xd8
 [<1044d09c>] addrconf_dad_timer+0xe8/0x124
 [<10131360>] run_timer_softirq+0x140/0x1dc
 [<1012c7b0>] __do_softirq+0x60/0xcc
 [<101042f0>] do_softirq+0x38/0x48
 [<101084ac>] do_cpu_irq_mask+0xf0/0x11c
 [<1010b068>] intr_return+0x0/0xc
 [<102a19ac>] serial8250_console_putchar+0x34/0x108
 [<10127370>] vprintk+0x2b8/0x2f4
 [<10127368>] vprintk+0x2b0/0x2f4
 [<101270ac>] printk+0x20/0x2c
 [<10398220>] autostart_arrays+0x28/0xd4
 [<103960fc>] md_ioctl+0x44c/0x474
 [<1023e6bc>] blkdev_driver_ioctl+0x58/0x64

Kernel panic - not syncing: BUG!
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
