From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: can't compile kernel for parisc
Date: Fri, 27 Feb 2009 11:51:07 -0500 (EST)
Message-ID: <20090227165107.A7F224EF8@hiauly1.hia.nrc.ca>
References: <a4423d670902270740y2c376722j2c2b444401bdc271@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: a.beregalov@gmail.com (Alexander Beregalov)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a4423d670902270740y2c376722j2c2b444401bdc271@mail.gmail.com> from "Alexander Beregalov" at Feb 27, 2009 06:40:46 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The same problem: ld segfaults:
> 
> do_page_fault() pid=15739 command='ld' type=15 address=0x00000c84
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001101111111100001111 Not tainted
> r00-03  0006ff0f ffffffff 407d542b fb6b2640
> r04-07  408e3f6c fb6afa37 fb6afa48 00000c84
> r08-11  fb6b2aa3 00000000 fb6b0520 00000000
> r12-15  00000025 fb6afa0c 00068958 00000042
> r16-19  4048e518 00000010 fb6af9cc 408e3f6c
> r20-23  80808000 80808080 fefefeff 81010100
> r24-27  fb6b25d0 fb6afa47 00000c84 000675c0
> r28-31  feff0000 00000073 fb6b2c00 00000c84
> sr00-03  00002e25 00000000 00000000 00002e25
> sr04-07  00002e25 00002e25 00002e25 00002e25
> 
>       VZOUICununcqcqcqcqcqcrmunTDVZOUI
> FPSR: 00000000000000000000000000000000
> FPER1: 00000000
> fr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> fr04-07  00000020ef80068c eec228401016a6e0 1051b81000000000 0000000000000000
> fr08-11  ffffff9cefc16000 efc11bc000000003 00000000eec22840 00000000fffff000
> fr12-15  fb6afa349c4df9fe fb6afa0c10128010 fb6af9d4ac2f99e4 10ba6aa8eaf8382a
> fr16-19  0004010f10574010 10128010efc241c8 1043a1540000000b 105742670000000f
> fr20-23  106002f800000000 0004000e1016aa9c fb6afa4700008000 fb6afa0c00000af8
> fr24-27  0000000000000000 0000000000000000 00000000812df5e4 896cf5835c46e68e
> fr28-31  1aab4042650e89ca eb5bc7cd1016aa38 1aab404200000000 efc2424000800480
> 
> IASQ: 00002e25 00002e25 IAOQ: 4080f407 4080f40b
>  IIR: 0f401094    ISR: 00002e25  IOR: 00000c84
>  CPU:        0   CR30: c410c000 CR31: 0185e003
>  ORIG_R28: 00000000
>  IAOQ[0]: 0x4080f404
>  IAOQ[1]: 0x4080f408
>  RP(r2): 0x407d5428

The insn is:

dave@hiauly6:~$ disasm 0x0f401094
   0:   0f 40 10 94     ldw 0(r26),r20

The program is probably in libc or the dynamic loader.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
