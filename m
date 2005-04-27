From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] ssm/rsm sequences
Date: Wed, 27 Apr 2005 15:27:21 +0200
Message-ID: <426F2530000004FE@mail-6-bnl.tiscali.it>
References: <426F253000000322@mail-6-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: rhirst@levanta.com
To: "Grant Grundler" <grundler@parisc-linux.org>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <426F253000000322@mail-6-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Grant,
> 
mmm aleady reach to reboot without pb (b180 32bit and b2k 64bit) :-)

unfortunately b180 pb is always there:
Backtrace:
 [<1015146c>] cache_grow+0xd4/0x1ac
 [<101516ec>] cache_alloc_refill+0x1a8/0x26c
 [<10151a10>] kmem_cache_alloc+0x48/0x4c
 [<101b634c>] ext3_alloc_inode+0x18/0x40
 [<10187158>] alloc_inode+0x28/0x1a0
 [<10187dac>] new_inode+0x10/0x8c
 [<101aaf90>] ext3_new_inode+0xc4/0x744
 [<101b43a0>] ext3_mkdir+0xc0/0x38c
 [<1017c8c8>] vfs_mkdir+0xcc/0x12c
 [<1017c9ec>] sys_mkdir+0xc4/0x120
 [<1010d120>] syscall_exit+0x0/0x14


Kernel Fault: Code=3D15 regs=3D14cb0540 (Addr=3D27b274cc)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001110011100001111 Not tainted
r00-03  00000000 10517e58 1015146c 105044f8
r04-07  17623000 100e36e0 00000010 00000050
r08-11  00000001 14cd43c0 1216d5d4 000001ed
r12-15  16eccdd4 000041ed 0004db4e 000edec8
r16-19  000edfc8 000edda8 00000000 27b274f8
r20-23  27b274bc 000001bc 000001c8 00000050
r24-27  105044bc 17623000 100e36e0 10400010
r28-31  27b274bc 00000000 14cb0540 10153dc4
sr0-3   00000000 00000000 00000000 00000a4b
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101511f4 101511f8
 IIR: 6b800020    ISR: 00000000  IOR: 27b274cc
 CPU:        0   CR30: 14cb0000 CR31: 10464000
 ORIG_R28: 00000000
 IAOQ[0]: alloc_slabmgmt+0x30/0x6c
 IAOQ[1]: alloc_slabmgmt+0x34/0x6c
 RP(r2): cache_grow+0xd4/0x1ac
Kernel panic - not syncing: Kernel Fault
 <0>Rebooting in 120 seconds..

Sorry,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
