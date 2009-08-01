From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Sat, 1 Aug 2009 16:59:03 -0400 (EDT)
Message-ID: <20090801205904.619B14E4F@hiauly1.hia.nrc.ca>
References: <Pine.SOC.4.64.0908010202020.15830@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: varenet@parisc-linux.org, randolph@tausq.org,
	linux-parisc@vger.kernel.org
To: mroos@ut.ee (Meelis Roos)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.SOC.4.64.0908010202020.15830@math.ut.ee> from "Meelis Roos" at Aug 1, 2009 02:16:29 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Did this - managed to boot via etch netinst+chroot. The address ranges 
> do not match (as suggested by an earleir post?) - they start with
> 0000000040100000. r02 shows 000000000c1b5c78 and I can not find anything 
> sensible ending with 1b5c7XX. The only match is in the middle of 
> filemap_fault:
> 
>     401b5c64:   08 19 02 49     copy r25,r9

The fault is at 0x402e70d0.  Register r26 contains 0 in the dump.

00000000402e7098 <ioread32>:
    402e7098:   0f c2 12 c1     std rp,-10(sp)
    402e709c:   9f 40 60 58     cmpb,*<= r0,r26,402e70d0 <ioread32+0x38>
    402e70a0:   73 c4 01 08     std,ma r4,80(sp)
    402e70a4:   db 5f 00 7d     extrd,u r26,3,3,r31
    402e70a8:   2b 63 20 00     addil L%7000,dp,r1
    402e70ac:   50 3c 0b 50     ldd 5a8(r1),ret0
    402e70b0:   0f 9f 20 dc     ldd,s r31(ret0),ret0
    402e70b4:   37 dd 3f a1     ldo -30(sp),ret1
    402e70b8:   53 9c 00 30     ldd 18(ret0),ret0
    402e70bc:   53 82 00 20     ldd 10(ret0),rp
    402e70c0:   e8 40 f0 00     bve,l (rp),rp
    402e70c4:   53 9b 00 30     ldd 18(ret0),dp
    402e70c8:   e8 00 00 30     b,l 402e70e8 <ioread32+0x50>,r0
    402e70cc:   53 c2 3e e1     ldd -90(sp),rp
    402e70d0:   0f 40 10 9c     ldw 0(r26),ret0
    402e70d4:   d3 9c 09 ff     shrpw ret0,ret0,16,r31

Since register r2 doesn't contain a normal address, it not clear
where ioread32 was called from.
> Also, there is no mention of IAOQ, IIR, IOR in HPMC - are they there but 
> with different names?

IAOQ is the HPMC dump (back entry).  It's 0x402e70d4.
IIR is control register 19 (CR 19).
IOR is control register 21 (CR 21).

> The disassmebly from the image is at
> http://muuseum.at.mt.ut.ee/~mroos/objdump-2.6.19-2-parisc64-smp if 
> sombeody can help me find my way through it. The image itself is at
> http://muuseum.at.mt.ut.ee/~mroos/vmlinux-2.6.29-2-parisc64-smp

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
