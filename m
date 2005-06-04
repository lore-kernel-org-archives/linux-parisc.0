From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [PATCH] usb/input/hid-core.c extract() brain damage
Date: Sat, 04 Jun 2005 13:59:15 +0000
Message-ID: <42A1B3B3.7030003__35224.5811991908$1416624542$gmane$org@tiscali.be>
References: <20050604011655.GA16999@colo.lackof.org>	<200506040125.j541PI7g009179@hiauly1.hia.nrc.ca>	<20050604072510.GD8230@colo.lackof.org>
	<42A182E9.7020609@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@parisc-linux.org,
 linux-usb-devel@lists.sourceforge.net,
 kyle@cabal.ca
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42A182E9.7020609@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

[...]
>>
>> Ok. Can you want to try the older version of 
>> include/asm-parisc/unaligned.h?
>>
> Interesting, I will too
> 
Sorry it didn't help for me (on a b180 with kernel 2.6.12-rc5-pa2 and 2.6.8/include/asm-parisc/unaligned.h)
still panicing as usual:
  [<101511b0>] cache_grow+0xd8/0x1a8
  [<10151428>] cache_alloc_refill+0x1a8/0x264
  [<10151744>] kmem_cache_alloc+0x48/0x4c
  [<101b590c>] ext3_alloc_inode+0x18/0x40
  [<10186ae8>] alloc_inode+0x28/0x1a0
  [<1018772c>] new_inode+0x10/0x8c
  [<101aa718>] ext3_new_inode+0xc4/0x73c
  [<101b36b8>] ext3_create+0x8c/0x12c
  [<1017b484>] vfs_create+0xe0/0x140
  [<1017bd54>] open_namei+0x680/0x734
  [<101694bc>] filp_open+0x3c/0x70
  [<101699ac>] sys_open+0x70/0xb8
  [<1010d12c>] syscall_exit+0x0/0x14


Kernel Fault: Code=15 regs=15154600 (Addr=27c944cc)

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001110011100001111 Not tainted
r00-03  00000000 10513e58 101511b0 105004f8
r04-07  17794000 100df6e0 00000010 00000050
r08-11  00000001 15f172bc 17b050dc 00000000
r12-15  15154110 000081a4 0004db4e 000e1bc8
r16-19  000e1c68 00000000 00000000 27c944f8
r20-23  27c944bc 000003dc 000001a5 00000050
r24-27  105004bc 17794000 100df6e0 10400010
r28-31  27c944bc 00000000 15154600 10153a94
sr0-3   00000000 000028a9 00000000 00002635
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10150f30 10150f34
  IIR: 6b800020    ISR: 00000000  IOR: 27c944cc
  CPU:        0   CR30: 15154000 CR31: 10460000
  ORIG_R28: 00000000
  IAOQ[0]: alloc_slabmgmt+0x30/0x6c
  IAOQ[1]: alloc_slabmgmt+0x34/0x6c
  RP(r2): cache_grow+0xd8/0x1a8
Kernel panic - not syncing: Kernel Fault
  <0>Rebooting in 120 seconds..

:_(

Thanks,
	Joel

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
