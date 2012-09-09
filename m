From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Thread stack allocation
Date: Sun, 9 Sep 2012 16:23:57 -0400
Message-ID: <BLU0-SMTP91500D9B875298D4CD828597AD0@phx.gbl>
References: <BLU0-SMTP405E1823EA93DF4FBFC1797AD0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP405E1823EA93DF4FBFC1797AD0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 9-Sep-12, at 1:52 PM, John David Anglin wrote:

> 40751000-40755000 rwxp 00000000 00:00  
> 0                                  [stack:22180]


It seems to me this must be a kernel bug:
Breakpoint 13, __mmap (addr=0x0, len=1572864, prot=7, flags=18, fd=-1,
     offset=0) at ../ports/sysdeps/unix/sysv/linux/hppa/mmap.c:36
36	{
(gdb) disass
Dump of assembler code for function __mmap:
=> 0x406cd270 <+0>:	stw rp,-14(sp)
    0x406cd274 <+4>:	stw,ma r4,40(sp)
    0x406cd278 <+8>:	ldw -78(sp),r21
    0x406cd27c <+12>:	stw r19,-20(sp)
    0x406cd280 <+16>:	ldw -74(sp),r22
    0x406cd284 <+20>:	copy r19,r4
    0x406cd288 <+24>:	be,l 100(sr2,r0),sr0,r31
    0x406cd28c <+28>:	ldi 5a,r20

The return from this syscall is the above region.

--
John David Anglin	dave.anglin@bell.net



