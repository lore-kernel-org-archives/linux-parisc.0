From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: BUG: soft lockup - CPU#0 stuck for 61s! [stty:11381]
Date: Sun, 18 Jul 2010 15:01:21 -0400
Message-ID: <20100718190121.GA1179@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I had this lockup a few days ago with vanilla UP 64-bit 2.6.34.1 kernel
on rp3440.

BUG: soft lockup - CPU#0 stuck for 61s! [stty:11381]
Modules linked in: ext2 sd_mod crc_t10dif sym53c8xx tg3 scsi_transport_spi libphy scsi_mod [last unloaded: scsi_wait_scan]

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001111 Not tainted
r00-03  000000ff0804ff0f 00000000405992d0 0000000040202d58 000000007fb508c8
r04-07  0000000040584ad0 0000000000000002 00000000c0307448 0000000040245410
r08-11  0000000000000000 ffffffffffffffea 0000000000019a04 0000000000019abc
r12-15  0000000000000002 000000000001c674 0000000000000001 0000000000000000
r16-19  0000000000000001 0000000000000001 0000000000000061 ffffffff80305828
r20-23  0000000000000036 000000004052c8c4 00000000405fac24 0000000000000000
r24-27  00000000403eeca0 0000000040245410 000000007fb508c8 0000000040584ad0
r28-31  000000408f955c50 000000408b2a82e0 000000408b2a8310 00000000404c6fb8
sr00-03  0000000000006800 0000000000006800 0000000000000000 0000000000006800
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004029d7cc 000000004029d7d0
 IIR: 53450110    ISR: 000000408b2a8488  IOR: 0000000000000000
 CPU:        0   CR30: 000000408b2a8000 CR31: 0000000040564000
ORIG_R28: 0000000040584ad0
IAOQ[0]: tty_compat_ioctl+0x44/0x130
IAOQ[1]: tty_compat_ioctl+0x48/0x130
RP(r2): compat_sys_ioctl+0xb8/0x420
Backtrace:
[<0000000040202d58>] compat_sys_ioctl+0xb8/0x420
[<0000000040104ed4>] syscall_exit+0x0/0x14

Assembly:
    4029d7c8:   53 5c 00 30     ldd 18(r26),ret0
    4029d7cc:   53 45 01 10     ldd 88(r26),r5
    4029d7d0:   53 99 00 20     ldd 10(ret0),r25
    4029d7d4:   eb ff bb 8d     b,l 4029d5a0 <tty_paranoia_check>,rp
    4029d7d8:   08 05 02 5a     copy r5,r26

static long tty_compat_ioctl(struct file *file, unsigned int cmd,
                                unsigned long arg)
{
	struct inode *inode = file->f_dentry->d_inode;
	struct tty_struct *tty = file->private_data;
	struct tty_ldisc *ld;
	int retval = -ENOIOCTLCMD;

	if (tty_paranoia_check(tty, inode, "tty_ioctl"))
		return -EINVAL;

I can't see anything obviously wrong with code, so it's possible the
lockup was caused by the lockup detection itself.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
