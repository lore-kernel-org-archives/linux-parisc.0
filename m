Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA03266
	for <parisc-linux@puffin.external.hp.com>; Sun, 30 Apr 2000 13:58:26 -0600
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by atlrel2.hp.com (Postfix) with ESMTP id C83346053
	for <parisc-linux@thepuffingroup.com>; Sun, 30 Apr 2000 15:58:24 -0400 (EDT)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id 365614FD83
	for <parisc-linux@thepuffingroup.com>; Sun, 30 Apr 2000 15:58:24 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id MAA10245 for <parisc-linux@thepuffingroup.com>; Sun, 30 Apr 2000 12:58:44 -0700 (PDT)
Message-Id: <200004301958.MAA10245@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] elf32-parisc linker broken?
In-reply-to: Your message of "Fri, 21 Apr 2000 15:26:16 PDT."
             <200004212226.PAA03137@milano.cup.hp.com>
Date: Sun, 30 Apr 2000 12:58:44 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> After ic_route_ioctl() is called, I get a "halted" message
> and the following output:
> ...
> IP-Config: Got BOOTP answer from 15.8.80.76, my address is 15.8.80.77
> sba_map_single 0xc7f7f2bc -> 0x5202bc pdir 0xc7fb2900 8000000007f7f07f
> sba_unmap_single iovp 0x5202bc
> halted
...
> GR2 0xc0232b94 ic_route_ioctl+20
> IAOQ 0xc0283e54 all_requests+43c
...

> I then disassembled vmlinux to see what's in ic_route_ioctl():
> c0232b74 <ic_route_ioctl>:
> c0232b74:       6b c2 3f d9     stw rp,-14(sr0,sp)
> c0232b78:       6f c5 00 80     stw,ma r5,40(sr0,sp)
> c0232b7c:       6b c4 3f 89     stw r4,-3c(sr0,sp)
> c0232b80:       08 1e 02 44     copy sp,r4
> c0232b84:       d4 80 1c 12     depwi 0,31,14,r4
> c0232b88:       0c 98 10 85     ldw c(sr0,r4),r5
> c0232b8c:       e8 5f 09 98     b,l c0271060 <inode_hashtable+0xe044>,rp
> c0232b90:       0c 80 12 98     stw r0,c(sr0,r4)
> c0232b94:       0c 85 12 98     stw r5,c(sr0,r4)
> c0232b98:       4b c2 3f 59     ldw -54(sr0,sp),rp
> c0232b9c:       4b c4 3f 89     ldw -3c(sr0,sp),r4
> c0232ba0:       e8 40 c0 00     bv r0(rp)
> c0232ba4:       4f c5 3f 81     ldw,mb -40(sr0,sp),r5
> 
> The b,l to 0xc0271060 seems rather bogus.  But I have no
> clue how the toolchain makes relative or "long" calls.

The "objdump --disassemble-all vmlinux" output hasn't changed
between i386-linux and parisc-hpux host build environments.
Here is also the "-S" output for ic_route_ioctl():

        .align 4
        .type    ic_route_ioctl,@function
ic_route_ioctl:
ic_route_ioctl: 
        .PROC
        .CALLINFO FRAME=64,CALLS,SAVE_RP,ENTRY_GR=4
        .ENTRY  
        stw %r2,-20(%r30)
        stwm %r5,64(%r30)
        stw %r4,-60(%r30)
#APP 
        copy 30,%r4
#NO_APP
        depi 0,31,14,%r4
        ldw 12(%r4),%r5
        .CALL ARGW0=GR,ARGW1=GR
        bl ip_rt_ioctl,%r2
        stw %r0,12(%r4)
        stw %r5,12(%r4)
        ldw -84(%r30),%r2
        ldw -60(%r30),%r4
        bv %r0(%r2)
        ldwm -64(%r30),%r5
        .EXIT
        .PROCEND
.Lfe4:
        .size    ic_route_ioctl,.Lfe4-ic_route_ioctl


This looks fine to me.
And "objdump --disassemble-all ipconfig.o" for ic_route_ioctl():

00000334 <ic_route_ioctl>:
     334:       6b c2 3f d9     stw rp,-14(sr0,sp)
     338:       6f c5 00 80     stw,ma r5,40(sr0,sp)
     33c:       6b c4 3f 89     stw r4,-3c(sr0,sp)
     340:       08 1e 02 44     copy sp,r4
     344:       d4 80 1c 12     depwi 0,31,14,r4
     348:       0c 98 10 85     ldw c(sr0,r4),r5
     34c:       e8 40 00 00     b,l 354 <ic_route_ioctl+0x20>,rp
     350:       0c 80 12 98     stw r0,c(sr0,r4)
     354:       0c 85 12 98     stw r5,c(sr0,r4)
     358:       4b c2 3f 59     ldw -54(sr0,sp),rp
     35c:       4b c4 3f 89     ldw -3c(sr0,sp),r4
     360:       e8 40 c0 00     bv r0(rp)
     364:       4f c5 3f 81     ldw,mb -40(sr0,sp),r5

This looks OK assuming the actualy branch destination gets fixed
up at link time.  Could this be a linker bug?
If so, where might I start to debug this?
(I've never looked the linker before)

thanks,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
