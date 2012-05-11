From: Vincent <vincent.stehle@laposte.net>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Fri, 11 May 2012 23:17:50 +0200
Message-ID: <4FAD81FE.5010308@bergerie>
References: <4FA9975C.5060708@bergerie> <4FAADE2A.9080803@bergerie> <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl> <2075347.T446pQRFvO@donald.sf-tec.de> <4FABED84.2040401@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4FABED84.2040401@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05/10/2012 06:32 PM, John David Anglin wrote:
(..)
> I asked where the crash occurred because PA 2.0 mnemonics are used in
> the tmpalias
> code.  On the other hand, if the failure occurs on the first flush
> instruction, the issue is likely
> in the TLB insert code in entry.S.

Hi John,

I think the crash occurs at the first 'fdc,m r1(ret0)', but I don't read
PA assembly that much, so you might want to cross-check by yourself :)
Here is the crash dump:

---
      _______________________________
     < Your System ate a SPARC! Gah! >
      -------------------------------
             \   ^__^
                 (__)\       )\/\
                  U  ||----w |
                     ||     ||
swapper (pid 1): Illegal instruction (code 8)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000000000000000000000000 Not tainted
r00-03  00000000 00000001 1019d550 105ebbc0
r04-07  00000000 00000017 16640000 ffeffff6
r08-11  0f2ff000 0f000000 00000001 fff00ff6
r12-15  1742c000 00000017 00000000 00000020
r16-19  00000000 00000043 1662f000 fffff000
r20-23  000005de 00118277 00000001 00000020
r24-27  00000000 00000000 0000bbc0 104f2000
r28-31  0f2ff000 00000001 17430600 102691d8
sr00-03  00000000 00000001 00000000 00000000
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10100c10 10100c14
 IIR: 078112a0    ISR: 00000000  IOR: 0f2ff000
 CPU:        0   CR30: 17430000 CR31: 00000002
 ORIG_R28: 1662f000
 IAOQ[0]: flush_dcache_page_asm+0x28/0x7c
 IAOQ[1]: flush_dcache_page_asm+0x2c/0x7c
 RP(r2): __get_user_pages+0x2c8/0x370
Backtrace:
 [<1019d550>] __get_user_pages+0x2c8/0x370
 [<101bcf8c>] get_arg_page+0x5c/0x108
 [<101bd250>] copy_strings+0x114/0x25c
 [<101bd3b4>] copy_strings_kernel+0x1c/0x30
 [<101be78c>] do_execve+0x1f4/0x370
 [<101180a0>] sys_execve+0x44/0x70
 [<10103084>] __execve+0x20/0x34
 [<1012a224>] vprintk+0x39c/0x3f0
 [<1010e074>] printk+0x24/0x30
 [<101110cc>] init_post+0x6c/0x148
 [<105a1624>] kernel_init+0x218/0x250

Backtrace:
 [<1011329c>] die_if_kernel+0x138/0x1b0
 [<101134ec>] handle_interruption+0x1d8/0x6d8
 [<10104078>] intr_check_sig+0x0/0x34
 [<1018975c>] __alloc_pages_nodemask+0x1a4/0x688
---

And here is the disassembly of function flush_dcache_page_asm:

---
10100be8 <flush_dcache_page_asm>:
10100be8:       23 80 01 e0     ldil L%f000000,ret0
10100bec:       d3 5a 1b 07     extrw,u r26,24,25,r26
10100bf0:       d7 99 0c 0a     depw r25,31,22,ret0
10100bf4:       d7 80 1c 14     depwi 0,31,12,ret0
10100bf8:       07 80 12 00     pdtlb r0(ret0)
10100bfc:       20 39 c2 08     ldil L%104f2000,r1
10100c00:       48 21 00 b8     ldw 5c(r1),r1
10100c04:       d7 22 19 9f     depwi,z 1,19,1,r25
10100c08:       0b 3c 06 39     add ret0,r25,r25
10100c0c:       08 39 04 39     sub r25,r1,r25
10100c10:       07 81 12 a0     fdc,m r1(ret0)
10100c14:       07 81 12 a0     fdc,m r1(ret0)
10100c18:       07 81 12 a0     fdc,m r1(ret0)
10100c1c:       07 81 12 a0     fdc,m r1(ret0)
10100c20:       07 81 12 a0     fdc,m r1(ret0)
10100c24:       07 81 12 a0     fdc,m r1(ret0)
10100c28:       07 81 12 a0     fdc,m r1(ret0)
10100c2c:       07 81 12 a0     fdc,m r1(ret0)
10100c30:       07 81 12 a0     fdc,m r1(ret0)
10100c34:       07 81 12 a0     fdc,m r1(ret0)
10100c38:       07 81 12 a0     fdc,m r1(ret0)
10100c3c:       07 81 12 a0     fdc,m r1(ret0)
10100c40:       07 81 12 a0     fdc,m r1(ret0)
10100c44:       07 81 12 a0     fdc,m r1(ret0)
10100c48:       07 81 12 a0     fdc,m r1(ret0)
10100c4c:       83 3c 9f 7d     cmpb,<< ret0,r25,10100c10
<flush_dcache_page_asm+0x28>
10100c50:       07 81 12 a0     fdc,m r1(ret0)
10100c54:       00 00 04 00     sync
10100c58:       07 20 12 00     pdtlb r0(r25)
10100c5c:       e8 40 c0 00     bv r0(rp)
10100c60:       08 00 02 40     nop
---

Best regards,

V.
