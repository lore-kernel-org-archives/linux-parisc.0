Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id D837848CA
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Sep 2003 12:03:45 -0600 (MDT)
Message-ID: <3F77227F.7000400@tiscali.be>
Date: Sun, 28 Sep 2003 18:03:43 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org,
	James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] Re: zalon/ncr53c720 (linux-2.6.0-test5-pa22) broken
 on C110
References: <3F76A312.8090603@tiscali.be> <20030928122414.GF24824@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20030928122414.GF24824@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Matthew Wilcox wrote:

>The driver is rev 1.5 in -test5-pa6.  rev 1.6 is in -test5-pa18.
>After -test5-pa20, we don't have anyautotagged stuff, but let's start
>with -pa18.
>
>  
>
Sorry it already failled with following satck dump:
zalon_probe: Zalon vers field is 0x1, IRQ 34
ncr53c720-0: rev 0xf on bus 0 device 0 function 0 irq 34
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
ncr53c720-0: suspicious SCSI data while resetting the BUS.
ncr53c720-0: dp1,d15-8,dp0,d7-0,rst,req,ack,bsy,sel,atn,msg,c/d,i/o = 
0x3fdff00, expecting 0x100
ncr53c720-0: FATAL ERROR: CHECK SCSI BUS - CABLES, TERMINATION, DEVICE 
POWER etc.!
ncr53c720-0: detaching...

Stack Dump:
 17fb8758:  17fb8758 00000202 0000000e 00000000
 17fb8748:  10385f84 00000001 10385f84 00000020
 17fb8738:  17ff8b2c 000000d0 17ff8b2c 1013efec
 17fb8728:  00000001 17ff8b48 0000003c 17ff7800
 17fb8718:  10385f84 00000202 0000000e 17fb83c0
 17fb8708:  0000001a 00000194 00000000 00000040
 17fb86f8:  17ff8b2c 000000d0 17ff8b2c 10106524
 17fb86e8:  10090600 100906a0 10357000 17ff7800
 17fb86d8:  17ff8bac 10385f84 00000202 00000001
 17fb86c8:  103862c0 00002574 00002575 00000000
 17fb86b8:  100e2568 000000d0 100e2568 10214844
 17fb86a8:  00000001 100e2584 00000001 100e2568
 17fb8698:  10094ac0 17ff0088 00000000 1033a000
 17fb8688:  10468810 10397010 10370010 10391054
 17fb8678:  00000004 000012c8 10454a18 101421fc
 17fb8668:  00001329 10397010 10370010 103d11c0
 17fb8658:  00000000 0000004d 10472478 ffffffff
 17fb8648:  100e2568 00000080 00000001 f00000a4
 17fb8638:  f00000ac f00010f4 00000000 10141b60
 17fb8628:  0000004d 00000000 103d11c0 10370010
 17fb8618:  10453810 10385810 10453884 1037f5ec
 17fb8608:  100e2568 100e2568 100e25d4 10391054
 17fb85f8:  00000004 00001382 10454a18 1010b088
 17fb85e8:  0000139c 10397010 100e2568 100e2584
 17fb85d8:  00100100 00200200 17ee4034 10434810
 17fb85c8:  10397010 10370010 103d11c0 f00000a4
 17fb85b8:  f00000ac f00010f4 00000000 101422c8
 17fb85a8:  0000004d 00000000 17fb8488 00000002
 17fb8598:  10090600 17ee4034 00000194 00000000
 17fb8588:  4b5a0328 0000001f 100e25d4 103d11c0
 17fb8578:  00000000 0000004d 000000fd 10257458
 17fb8568:  1025ba9c 00000000 00000000 00000000
 17fb8558:  00000000 00000000 00000000 00000000
 17fb8548:  00000000 00000000 00000000 00000000
 17fb8538:  41000000 00000000 40800000 00000000
 17fb8528:  40000000 00000000 40000000 7fffffff
 17fb8518:  41800000 00000000 40200000 00000000
 17fb8508:  40200000 00000000 40300000 00000000
 17fb84f8:  41000000 00000000 40800000 7fffffff
 17fb84e8:  7fffffff 00000000 41000000 7fffffff
 17fb84d8:  7fffffff 00000800 00000400 00000200
 17fb84c8:  00000100 00000080 00000040 00000000
 17fb84b8:  00000000 00000010 00000010 00000000
 17fb84a8:  41800000 25b7ea20 45e69c6a 00000000
 17fb8498:  00000000 e0000000 43ebebeb ffffffff
 17fb8488:  7f7fffff 00000020 00000010 00000000
 17fb8478:  00000000 00000000 00000000 00000000
 17fb8468:  00000000 00000000 00000000 00000000
 17fb8458:  0000001f 00000000 0000001f 00000000
 17fb8448:  0000001f 00000000 000b0800 10142ce8
 17fb8438:  17fb83c0 0000000b 00000000 1036e010
 17fb8428:  00000000 17ffc360 000002c7 10082000
 17fb8418:  0000000f 0000001f 00000036 0000001f
 17fb8408:  f00000a4 f00000ac f00010f4 00000000
 17fb83f8:  000000fd 0000004d 00000000 103d11c0
 17fb83e8:  10370010 ffffffed 17ff0000 00000022
 17fb83d8:  10468810 1033a000 00000000 17ff0088
 17fb83c8:  1025baa0 1025b800 000eff0f 100cd800
 17fb83b8:  fffffffb 10353000 10370528 f3f8c800
 17fb83a8:  00000001 1033a000 10353000 00000022
 17fb8398:  17ff0088 00000001 1033a000 10468810
 17fb8388:  00000022 17ff0000 ffffffed 10391054
 17fb8378:  00000004 000011b5 10454a18 103e7e64
 17fb8368:  000011de 00000000 100864e0 10359e74

Kernel addresses on the stack:
 [<10124204>] copy_process+0x3d8/0x9f0
 [<10106220>] parisc_terminate+0x60/0xb8
 [<1013efec>] buffered_rmqueue+0xd8/0x164
 [<10106524>] handle_interruption+0x2ac/0x5bc
 [<10214844>] serial8250_console_write+0x1ac/0x37c
 [<101421fc>] do_drain+0x18/0x28
 [<10141b60>] slab_destroy+0x15c/0x214
 [<1010b088>] intr_check_sig+0x0/0xc
 [<101422c8>] __cache_shrink+0x70/0xc0
 [<10257458>] ncr_detach+0x0/0x374
 [<103d11c0>] start_kernel+0x4/0x214
 [<103e7e64>] zalon_probe+0x240/0x270
 [<1010ecf8>] parisc_driver_probe+0x2c/0x60
 [<10219dcc>] bus_match+0x48/0x80
 [<10219f28>] driver_attach+0x70/0xa4
 [<1021a1b0>] bus_add_driver+0x98/0xa8
 [<101ec1b4>] pci_populate_driver_dir+0x30/0x38
 [<1021a51c>] driver_register+0x48/0x54
 [<103e7c14>] sym2_init+0x18/0x28
 [<103d1438>] do_initcalls+0x58/0xdc
 [<10100400>] init+0x2c/0x144
 [<1010ac5c>] ret_from_kernel_thread+0x1c/0x24


Kernel Fault: Code=26 regs=17fb83c0 (Addr=00000194)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000011101111111100001111 Not tainted
r00-03  00000000 1025b800 1025baa0 17ff0088
r04-07  00000000 1033a000 10468810 00000022
r08-11  17ff0000 ffffffed 10370010 103d11c0
r12-15  00000000 0000004d 000000fd 00000000
r16-19  f00010f4 f00000ac f00000a4 0000001f
r20-23  00000036 0000001f 0000000f 10082000
r24-27  000002c7 17ffc360 00000000 1036e010
r28-31  00000000 0000000b 17fb83c0 10142ce8
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1025ba9c 10257458
 IIR: 4b5a0328    ISR: 00000000  IOR: 00000194
 CPU:        0   CR30: 17fb8000 CR31: 103c6000
 ORIG_R28: 00000000
 IAOQ[0]: ncr53c8xx_release+0xc/0x20
 IAOQ[1]: ncr_detach+0x0/0x374
 RP(r2): ncr53c8xx_release+0x10/0x20

Now what do you thing foward pa20 or backward pa14?

Thanks,
    Joel
