From: Meelis Roos <mroos@ut.ee>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Sat, 1 Aug 2009 02:16:29 +0300 (EEST)
Message-ID: <Pine.SOC.4.64.0908010202020.15830@math.ut.ee>
References: <20090731144654.F3D374CFD@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Thibaut VARENE <varenet@parisc-linux.org>, randolph@tausq.org,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090731144654.F3D374CFD@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Are you sure? There are basic explanations about the info we need. For instance:
> > 
> > "- The r02 register is the "return pointer" - it indicates the calling function
> > - The IAOQ contents specify the address of the instruction where the
> > fault occured."
> > 
> > Of course they are undecoded, that's why you need to be able to
> > objdump the kernel.
> 
> I tried to download the kernel package, but it's gone from the debian
> servers.  So, you will have to run objdump yourself.  Just do
> 
> hppa64-linux-gnu-objdump vmlinux-2.6.29-2-parisc64-smp | less

Did this - managed to boot via etch netinst+chroot. The address ranges 
do not match (as suggested by an earleir post?) - they start with
0000000040100000. r02 shows 000000000c1b5c78 and I can not find anything 
sensible ending with 1b5c7XX. The only match is in the middle of 
filemap_fault:

    401b5c64:   08 19 02 49     copy r25,r9
    401b5c68:   53 5c 00 50     ldd 28(r26),ret0
    401b5c6c:   c5 fc 43 e8     bb,< ret0,f,401b5e68 <filemap_fault+0x278>
    401b5c70:   34 0b 00 00     ldi 0,r11
    401b5c74:   34 0c 00 00     ldi 0,r12
    401b5c78:   2b 60 00 00     addil L%0,dp,r1
    401b5c7c:   08 01 02 4d     copy r1,r13
    401b5c80:   2b 63 30 00     addil L%7800,dp,r1
    401b5c84:   37 c7 3f a1     ldo -30(sp),r7
    401b5c88:   08 01 02 48     copy r1,r8

Also, there is no mention of IAOQ, IIR, IOR in HPMC - are they there but 
with different names?

The disassmebly from the image is at
http://muuseum.at.mt.ut.ee/~mroos/objdump-2.6.19-2-parisc64-smp if 
sombeody can help me find my way through it. The image itself is at
http://muuseum.at.mt.ut.ee/~mroos/vmlinux-2.6.29-2-parisc64-smp

I also installed Debian's current 2.6.30-1-parisc64 kernel and it 
behaves the same - HPMC after PCI messages from tulip.

For some strange reason, 2.6.18-6-parisc64 (as fully working netbooted 
etch's uname tells) does not boot from disk either - it panics in a 
differnet place so I did not investigate it further. Maybe probles with 
my initramfs.

-- 
Meelis Roos (mroos@ut.ee)      http://www.cs.ut.ee/~mroos/
