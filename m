Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA29059
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 Jan 2001 06:52:10 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 26 Jan 2001 13:56:06 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C49D6B005; Fri, 26 Jan 2001 13:46:03 +0000 (GMT)
Date: Fri, 26 Jan 2001 13:46:03 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] sh segfaults
Message-ID: <20010126134603.G3571@linuxcare.com>
References: <200101260615.WAA23253@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101260615.WAA23253@milano.cup.hp.com>; from grundler@cup.hp.com on Thu, Jan 25, 2001 at 10:15:27PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jan 25, 2001 at 10:15:27PM -0800, Grant Grundler wrote:
> 
> Hi all,
> So despite booting our shiny new 2.4.0 kernel fine and being able to rcp
> the sources to attempt a native build, "make oldconfig" consistently
> sees a segfault:
> 
> c3k:/usr/src/linux \<535\>make oldconfig > /dev/null
> 
> do_page_fault() pid=561 command='sh' type=15 address=0x000006e4
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001011
> r0-3     00000000 00000368 000327a3 bb002490
> r4-7     4001399b 00000000 401cf630 401d2fbc
> r8-11    00076d74 00000000 bb002490 000c3110
> r12-15   ffffffff 00000000 00000000 00000001
> r16-19   0000005c 00000000 00000000 401d2fbc
> r20-23   fffff000 400eb63c 0007e498 00000008
> r24-27   00000000 bb002908 00000002 00076808
> r28-31   0000023a 0000002f bb002880 400eb663
> sr0-3    00000368 00000368 00000000 00000368
> sr4-7    00000368 00000368 00000368 00000368
> 
> IASQ: 00000368 00000368 IAOQ: 000327a3 000327a7
>  IIR: 483306f8    ISR: 00000368  IOR: 000006e4
> ORIG_R28: 00000001
> make: *** [oldconfig] Segmentation fault
> c3k:/usr/src/linux \<536\>

On the B180, following cvs update an hour ago, make config gave

do_page_fault() pid=184 command='sh' type=15 address=0x000004ce                                        
                                                                                                       
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                                                  
PSW: 00000000000001001111111100001011                                                                  
r0-3     00000000 00000152 000327a3 bb002450                                                           
r4-7     4001399b 00000000 401cf630 401d2fbc                                                           
r8-11    00076d74 00000000 bb002450 000c3110                                                           
r12-15   ffffffff 00000000 00000000 00000001                                                           
r16-19   0000005c 00000000 00000000 401d2fbc                                                           
r20-23   fffff000 400eb63c 0007e498 00000008                                                           
r24-27   00000000 bb0028c8 00000002 00076808                                                           
r28-31   000000c2 0000002f bb002840 400eb663                                                           
sr0-3    00000152 00000152 00000000 00000152                                                           
sr4-7    00000152 00000152 00000152 00000152                                                           
                                                                                                       
IASQ: 00000152 00000152 IAOQ: 000327a3 000327a7                                                        
 IIR: 483306f8    ISR: 00000152  IOR: 000004ce                                                         
ORIG_R28: 00000001                                                                                     


0x327a0 <command_substitute+756>:       ldw 37c(sr0,r1),r19

Worked on the second, third, fourth attempts.

make dep gave:

make[6]: Entering directory `/build/linux/drivers/media/video'
/build/linux/scripts/mkdep audiochip.h bt848.h bttv-cards.c bttv-driver.c bttv-if.c bttv.h bttvp.h buz.c buz.h bw-qcam.c bw-qcam.h c-qcam.c cpia.c cpia.h cpia_pp.c cpia_usb.c cs8420.h i2c-old.c i2c-parport.c ibmmpeg2.h id.h msp3400.c planb.c planb.h pms.c saa5249.c saa7110.c saa7111.c saa7121.h saa7146.h saa7146reg.h saa7185.c saa7196.h stradis.c tda7432.c tda9875.c tuner-3036.c tuner.c tuner.h tvaudio.c tvaudio.h tvmixer.c videodev.c vino.c zr36057.h zr36060.h zr36120.c zr36120.h zr36120_i2c.c zr36120_mem.c zr36120_mem.h > .depend
make[6]: *** wait: No child processes.  Stop.
make[6]: *** Waiting for unfinished jobs....
make[6]: *** wait: No child processes.  Stop.
make[5]: *** [_sfdep_video] Error 2
make[5]: Leaving directory `/build/linux/drivers/media'
make[4]: *** [fastdep] Error 2
make[4]: Leaving directory `/build/linux/drivers/media'
make[3]: *** [_sfdep_media] Error 2
make[3]: Leaving directory `/build/linux/drivers'
make[2]: *** [fastdep] Error 2
make[2]: Leaving directory `/build/linux/drivers'
make[1]: *** [_sfdep_drivers] Error 2
make[1]: Leaving directory `/build/linux'
make: *** [dep-files] Error 2


What a good time ot go on holiday ;-)

Richard
