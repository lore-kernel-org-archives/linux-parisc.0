Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA21288
	for <parisc-linux@puffin.external.hp.com>; Fri, 21 Apr 2000 16:26:07 -0600
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by atlrel2.hp.com (Postfix) with ESMTP id B2C7511AA
	for <parisc-linux@thepuffingroup.com>; Fri, 21 Apr 2000 18:26:02 -0400 (EDT)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id 222B84FD86
	for <parisc-linux@thepuffingroup.com>; Fri, 21 Apr 2000 18:26:02 -0400 (EDT)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id PAA03137 for parisc-linux@thepuffingroup.com; Fri, 21 Apr 2000 15:26:16 -0700 (PDT)
Date: Fri, 21 Apr 2000 15:26:16 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200004212226.PAA03137@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ELF toolchain broken on HP-UX
List-ID: <linux-parisc.vger.kernel.org>



Ran into the next "wall". This is a heads up the toolchain built
on HP-UX doesn't build valid code for parisc-linux.  (It might be
fine for HP-UX binaries).


After ic_route_ioctl() is called, I get a "halted" message
and the following output:
...
IP-Config: Got BOOTP answer from 15.8.80.76, my address is 15.8.80.77
sba_map_single 0xc7f7f2bc -> 0x5202bc pdir 0xc7fb2900 8000000007f7f07f
sba_unmap_single iovp 0x5202bc
halted

PSW  : 000cfd0b  GR 1 : c0235800  GR 2 : c0232b94  GR 3 : c7fbc508  
GR 4 : c7fbc000  GR 5 : 00000000  GR 6 : c029a800  GR 7 : c0298800  
GR 8 : c0100000  GR 9 : c7ff0000  GR10 : 00505964  GR11 : c0299000  
GR12 : 00000000  GR13 : ffffffff  GR14 : 00000001  GR15 : f0400004  
GR16 : f00008c4  GR17 : f000017c  GR18 : f0000174  GR19 : 00000002  
GR20 : c7fbc50c  GR21 : c7fbc52c  GR22 : c7fbc51c  GR23 : 00000003  
GR24 : 0f08504c  GR25 : c7fbc508  GR26 : 0000890b  GR27 : c020e000  
GR28 : c7fbc508  GR29 : 00000001  GR30 : c7fbc740  GR31 : c01cb330  
SR0  : 00000000  SR1  : 00000000  SR2  : 00000000  SR3  : 00000000  
SR4  : 00000000  SR5  : 00000000  SR6  : 00000000  SR7  : 00000000  

IASQ : 00000000 00000000 IAOQ : c0283e54 c0283d98
 IIR : 00000000 ISR : c7fbc618 IOR : c7fea200
...
["halted" code isn't (a) SMP safe and (b) doesn't block all interrupts.
  I see more interrupts from tulip afterwards]

GR2 0xc0232b94 ic_route_ioctl+20
IAOQ 0xc0283e54 all_requests+43c

all_requests[] is an array of structs, not code.


>From net/ipv4/ipconfig.c:

static int __init ic_route_ioctl(unsigned int cmd, struct rtentry *arg)
{
        int res;

        mm_segment_t oldfs = get_fs();
        set_fs(get_ds());
        res = ip_rt_ioctl(cmd, arg);
        set_fs(oldfs);
        return res;
}

I put printk's in ip_rt_ioctl() and they don't show up on the console.


It seems the call to ip_rt_ioctl() branches to "IAOQ : c0283e54" and
hits a "break" instruction instead of branching to ip_rt_ioctl() code.
At first, I suspected the EXPORT_SYMBOL in:
    ./net/netsyms.c:254:EXPORT_SYMBOL(ip_rt_ioctl);

but EXPORT_SYMBOL is defined to nop.

I then disassembled vmlinux to see what's in ic_route_ioctl():
c0232b74 <ic_route_ioctl>:
c0232b74:       6b c2 3f d9     stw rp,-14(sr0,sp)
c0232b78:       6f c5 00 80     stw,ma r5,40(sr0,sp)
c0232b7c:       6b c4 3f 89     stw r4,-3c(sr0,sp)
c0232b80:       08 1e 02 44     copy sp,r4
c0232b84:       d4 80 1c 12     depwi 0,31,14,r4
c0232b88:       0c 98 10 85     ldw c(sr0,r4),r5
c0232b8c:       e8 5f 09 98     b,l c0271060 <inode_hashtable+0xe044>,rp
c0232b90:       0c 80 12 98     stw r0,c(sr0,r4)
c0232b94:       0c 85 12 98     stw r5,c(sr0,r4)
c0232b98:       4b c2 3f 59     ldw -54(sr0,sp),rp
c0232b9c:       4b c4 3f 89     ldw -3c(sr0,sp),r4
c0232ba0:       e8 40 c0 00     bv r0(rp)
c0232ba4:       4f c5 3f 81     ldw,mb -40(sr0,sp),r5

The b,l to 0xc0271060 seems rather bogus.  But I have no
clue how the toolchain makes relative or "long" calls.

Most folks seem to be building parisc-linux kernels on x86 linux boxes.
I wondered if the tool-chain gets built slightly differently under
HP-UX and may pull in misc HP-UX header files.  Willy kindly provided
me with a x86-linux built ic_route_ioctl() and it looks a bit different:

c0273b88 <ic_route_ioctl>:
c0273b88:       6b c2 3f d9     stw rp,-14(sr0,sp)
c0273b8c:       6f c5 00 80     stw,ma r5,40(sr0,sp)
c0273b90:       6b c4 3f 89     stw r4,-3c(sr0,sp)
c0273b94:       08 1e 02 44     copy sp,r4
c0273b98:       d4 80 1c 12     depwi 0,31,14,r4
c0273b9c:       0c 98 10 85     ldw c(sr0,r4),r5
c0273ba0:       0c 80 12 98     stw r0,c(sr0,r4)
c0273ba4:       e5 00 3f 8a     be,l,n fc4(sr4,r8)
c0273ba8:       0c 85 12 98     stw r5,c(sr0,r4)
c0273bac:       4b c2 3f 59     ldw -54(sr0,sp),rp
c0273bb0:       4b c4 3f 89     ldw -3c(sr0,sp),r4
c0273bb4:       e8 40 c0 00     bv r0(rp)
c0273bb8:       4f c5 3f 81     ldw,mb -40(sr0,sp),r5

This looks better to me.  (And willy wondered why the delay
slot wasn't used....major performance hole here.)

So I'm hosed until I either (a) get the equivalent tool chain
for HP-UX or (b) setup an x86 build machine locally.
It will cost me a day or two for (b). But it's more likely
to succeed than me mucking around with (a).


regards,
grant
