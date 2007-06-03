From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Sun, 3 Jun 2007 15:49:38 -0400 (EDT)
Message-ID: <200706031949.l53Jncmi016795__32856.971739284$1416624383$gmane$org@hiauly1.hia.nrc.ca>
References: <20070603192829.GA23062@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org,
 matthew@wil.cx
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070603192829.GA23062@fattire.cabal.ca> from "Kyle McMartin" at
	Jun 3, 2007 03:28:29 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> This is bad. Your kernel is too old, and glibc didn't take this into
> account. I'll hack something up to return -ENOSYS.

I'm a bit surprised that 2.6.20 is too old.  In any event, my
initial attempt to do the above hasn't worked:

Kernel command line: root=/dev/sda3 panic=5 console=ttyS1 palo_kernel=1/vmlinux
Backtrace:
 [<00000000401c6d02>] ep_remove+0xc8/0xe8
 [<0000000040200215>] log_do_checkpoint+0x1cc/0x418
 [<0000000040287010>] class_device_add+0x510/0x5f0
 [<0000000040140912>] sysctl_string+0x188/0x1b8
 [<000000004010020f>] aligned_rfi+0xc/0xe00
 [<0000000040366380>] packet_getsockopt+0x130/0x138
 [<0000000040365160>] packet_ioctl+0x188/0x198
 [<0000000040362798>] unix_ioctl+0xb8/0x110
 [<000000004034cecc>] ipv4_sysctl_forward_strategy+0x12c/0x138
 [<000000004034ce48>] ipv4_sysctl_forward_strategy+0xa8/0x138
 [<000000004034bd5c>] ip_mc_msfget+0x16c/0x1d0
 [<0000000040343fa0>] ipv4_doint_and_flush_strategy+0x110/0x138
 [<000000004033ef8c>] udp_ioctl+0xf4/0x100
 [<000000004033d8bc>] udp_lib_setsockopt+0x8c/0x170
 [<000000004033d37c>] udp_lib_getsockopt+0x54/0x110
 [<000000004033c140>] raw_sendmsg+0x640/0x810


Kernel Fault: Code=15 regs=00000000404c0290 (Addr=0000000080000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001000000011100001110 Not tainted
r00-03  000000000804070e 00000000405107c0 000000004051aed4 0000000040103000
r04-07  0000000040503fc0 0000000000480000 00000000fffffff0 00000000f040dd30
r08-11  0000000000000258 0000000000000001 000000000804000e 0000000040514634
r12-15  0000000000000000 0000000000000001 0000000000000001 00000000000225c4
r16-19  00000000f0d00b0c 0000000000000000 00000000000f76f8 0000000080000000
r20-23  00000000e208b185 000000003ffffd90 0000000040103020 00000000404e5300
r24-27  0000000000000000 00000000403c3491 000000004010300d 0000000040503fc0
r28-31  00000000e208b185 00000000404c0260 00000000404c0290 000000000fec6fc0
sr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004051af34 000000004051af38
 IIR: 0e60109c    ISR: 0000000000000000  IOR: 0000000080000000
 CPU:        0   CR30: 00000000404c0000 CR31: 00000000404c4000
 ORIG_R28: 00000000401385a4
 IAOQ[0]: check_ivt+0x84/0xe0
 IAOQ[1]: check_ivt+0x88/0xe0
 RP(r2): check_ivt+0x24/0xe0
Kernel panic - not syncing: Kernel Fault
<0>Rebooting in 5 seconds..

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
