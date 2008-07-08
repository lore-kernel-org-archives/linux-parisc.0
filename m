From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re: in ccio_io_pdir_entry(),BUG_ON() seems to break gcc-4.2
	optimization?
Date: Tue,  8 Jul 2008 10:04:06 +0100
Message-ID: <K3OJUU$AD461F2DD4F7CAAF0D27FCC2C55B9241@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "grundler" <grundler@parisc-linux.org>,
	"linux-parisc" <linux-parisc@vger.kernel.org>
To: "grundler" <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

[...]
> 
> In "New Stuff", r20 gets clobbered and values copied from
> r26 are lost. That's not the case in the original code.
> "depw" only replaces 12 bits of "ret0" in the original code.
> 
Good catch, in fact I would just have to save the read+write constraint on pa;
i.e this seems to make the drill:

        __asm__ __volatile__ (
        "lci    %%r0(%%sr1, %2), %0\n"
        "\textru        %0,19,12,%0\n"
        "\tdepw         %0,15,12,%1\n"
        : "=r" (ci), "+r" (pa)
        : "r" (vba)
        );

comparing produced objdump:
00000000 <ccio_io_pdir_entry>:           00000000 <ccio_io_pdir_entry>:
 0: 00 19 58 20  mtsp r25,sr1             0: 00 19 58 20  mtsp r25,sr1
 4: 23 80 0e 01  ldil L%-10000000,ret0    4: 23 80 0e 01  ldil L%-10000000,ret0
 8: 0b 98 0a 1c  add,l r24,ret0,ret0      8: 0b 98 0a 1c  add,l r24,ret0,ret0
 c: d7 97 0c 14  depw r23,31,12,ret0      c: d7 97 0c 14  depw r23,31,12,ret0
10: 0f 5c 12 88  stw ret0,4(r26)       | 10: 34 13 00 00  ldi 0,r19
14: 07 00 53 18  lci r0(sr1,r24),r24   | 14: 0f 5c 12 88  stw ret0,4(r26)
18: d3 18 1a 74  extrw,u r24,19,12,r24 | 18: 07 00 53 1c  lci r0(sr1,r24),ret0
1c: 34 1c 00 00  ldi 0,ret0            | 1c: d3 9c 1a 74  extrw,u ret0,19,12,ret0
20: d7 98 0e 14  depw r24,15,12,ret0   | 20: d6 7c 0e 14  depw ret0,15,12,r19
24: 0f 5c 12 80  stw ret0,0(r26)       | 24: 0f 53 12 80  stw r19,0(r26)
28: 07 40 12 80  fdc r0(r26)             28: 07 40 12 80  fdc r0(r26)
2c: 00 00 04 00  sync                    2c: 00 00 04 00  sync
30: e8 40 c0 02  bv,n r0(rp)             30: e8 40 c0 02  bv,n r0(rp)
Disassembly of section .text.ccio_free_consistent:Disassembly of section ...

This time r19 is well 'initialized' with 0 (as per C code pa = 0);
the coherent index in r28 (ret0) and after extrw, depw replaces 12 bits of r19.

Many thanks for re-reading ;-)
    J.

> thanks,
> grant
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 


