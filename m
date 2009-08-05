From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Wed, 5 Aug 2009 11:45:07 -0600
Message-ID: <20090805174507.GB11458@lackof.org>
References: <20090615134519.6EE824FC5@hiauly1.hia.nrc.ca> <Pine.SOC.4.64.0907302054100.20870@math.ut.ee> <4A724818.4080909@tausq.org> <Pine.SOC.4.64.0907310923520.710@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Randolph Chung <randolph@tausq.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.SOC.4.64.0907310923520.710@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jul 31, 2009 at 09:28:51AM +0300, Meelis Roos wrote:
> The real problem happens after tulip driver 
> loading and PCI configuration of the cards.

This would be consistent with add-on cards not getting MMIO
space assigned correctly. The ioread32() is one of several operations
to configure the card.

It would be helpful to know if 2.6.30.x kernels (from unstable)
show the same problem.

cheers,
grant

 From these, I only have the 
> SER PIM data, no kernel backtrace.
> 
> > > Begin: Running /scripts/init-premount ... [17179583.856000] Linux Tulip
> > > driver version 1.1.15-NAPI (Feb 27, 2007)
> > > [17179584.008000] tulip 0000:00:00.0: enabling device (0140 -> 0143)
> > > [17179584.028000] tulip0: no phy info, aborting mtable build
> > > [17179584.140000] tulip0:  MII transceiver #1 config 1000 status 782d
> > > advertising 0061.
> > > [17179584.164000] eth0: Digital DS21142/43 Tulip rev 65 at MMIO
> > > 0xfffffffff8006000, 00:10:83:fe:9c:b0, IRQ 66.
> > > [17179584.428000] tulip 0000:18:00.0: enabling device (0000 -> 0003)
> > > [17179584.436000] tulip 0000:18:00.0: enabling SERR and PARITY (0003 ->
> > > 0143)
> > > 
> > > ************* SYSTEM ALERT **************
> > > SYSTEM NAME: scaspdb24
> > > DATE: 07/30/2009 TIME: 17:30:06
> > > ALERT LEVEL: 7 = reserved
> > > 
> > > REASON FOR ALERT
> > > SOURCE: 0 = unknown, no source stated
> > > SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
> > > PROBLEM DETAIL: 0 = no problem detail
> > > 
> > > LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
> > >        ON       FLASH         OFF       ON         ON
> > > LED State: There was a system interruption that did not take the system
> > > down.
> > > Check Chassis and Console Logs for error messages.
> > > 
> > > 0x0000007000FF6292 000000F0 F0000000 - type  0 = Data Field Unused
> > > 0x5800087000FF6292 00006D06 1E111E06 - type 11 = Timestamp 07/30/2009
> > > 17:30:06
> [...]
> 
> > > Main Menu: Enter command or menu > ser pim
> > > 
> > > 
> > > PROCESSOR PIM INFORMATION
> > > 
> > > Original Product Number:   A5576A
> > > Current Product Number:    A5576A
> > > 
> > > 
> > > -----------------  Processor 0 HPMC Information - PDC Version: 44.28  ------ 
> > > Timestamp =    Thu Jul  30 17:30:07 GMT 2009    (20:09:07:30:17:30:07)
> > > 
> > > HPMC Chassis Codes 
> > >        Chassis Code        Extension        ------------        ---------
> > > 0x0000082000ff6242  0x0000000000000000
> > >        0x1800082011006312  0xcb81000000000000
> > >        0x0000087000ff6292  0x000000f0f0000000
> > >        0x6000082070006062  0x0000000000100010
> > >        0x7000082070006082  0x0000000000b92400
> > >        0x7000082379006133  0xc1bff0fffed08040
> > >        0x0000080080006310  0x0000000000000001
> > >        0x000008008000631f  0x0000000000000000
> > >        
> > > General Registers 0 - 31
> > > 00-03  0000000000000000  00000000402e7098  000000000c1b5c78
> > > 000000007f954680
> > > 04-07  000000000c1b1000  000000000c1fc800  000000000c1c79b0
> > > 000000007f954000
> > > 08-11  000000000c1fc830  0000000000000003  00000000fe87e800
> > > 000000000c1fc800
> > > 12-15  0000000000000000  00000000fb6a2d5e  00000000fb6a2b5e
> > > 0000000000000003
> > > 16-19  0000000000026420  0000000000000000  00000000fe87e880
> > > 000000007f9555b8
> > > 20-23  0000000000000000  000000007f9552c0  ffffffffc0000000
> > > 0000000000100000
> > > 24-27  0000000000000000  0000000000000000  000000000c1fc830
> > > 00000000406791c0
> > > 28-31  000000000c1b4010  000000007f858be0  000000007f858c90
> > > 000000000c1b3fd0
> > > 
> > > 
> > > Control Registers 0 - 31
> > > 00-03  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 04-07  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 08-11  000000000000011c  0000000000000000  00000000000000c0
> > > 0000000000000001
> > > 12-15  0000000000000000  0000000000000000  0000000000103000
> > > ff80000000000000
> > > 16-19  0000003aeb5d81e1  0000000000000000  00000000402e70d0
> > > 000000000f40109c
> > > 20-23  00000000a627ff41  000000004fdfc830  000000ff0804ff0f
> > > 8000000000000000
> > > 24-27  0000000000586000  000000003f892000  ffffffffffffffff
> > > 0000000040001480
> > > 28-31  ffffffffffffffff  ffffffffffffff2f  000000007f858000
> > > ffffffffffffffff
> > > 
> > > Space Registers 0 - 7
> > > 00-03  0004d800          00000000          00000000          00047000
> > > 04-07  00000000          00000000          00000000          00000000
> > > 
> > > 
> > > IIA Space (back entry)       = 0x0000000000000000
> > > IIA Offset (back entry)      = 0x00000000402e70d4
> > > Check Type                   = 0x20000000
> > > CPU State                    = 0x9e000004
> > > Cache Check                  = 0x00000000
> > > TLB Check                    = 0x00000000
> > > Bus Check                    = 0x0030103b
> > > Assists Check                = 0x00000000
> > > Assist State                 = 0x00000000
> > > Path Info                    = 0x00000000
> > > System Responder Address     = 0x000000ffd053f830
> > > System Requestor Address     = 0xfffffffffffa0000
> > > 
> > > 
> > > Floating Point Registers 0 - 31
> > > 00-03  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 04-07  0000000000000000  00000000bf840350  00000000bf840358
> > > 0000000000000008
> > > 08-11  000000004020b518  00000000ff83a268  0000000000000000
> > > 0000000000000002
> > > 12-15  00000000ff83fc10  00000000ff8403f0  00000000ff83fc00
> > > 00000000406791c0
> > > 16-19  0000000000000002  00000000ff83a268  00000000406879c0
> > > 00000000406809c0
> > > 20-23  00000000000000ff  00000000406791c0  0000000000000000
> > > 0000000000000000
> > > 24-27  0000000000000000  0000000000000000  fffffffffffff000
> > > 00000000fefa6000
> > > 28-31  0000000000000000  0000000000000000  ffffffffffffff9c
> > > 00000000406791c0
> > > 
> > > 
> > > Check Summary                = 0xcb81000000000000
> > > Available Memory             = 0x00000000c0000000
> > > CPU Diagnose Register 2      = 0x0203000100802004
> > > CPU Status Register 0        = 0x2440c24000000000
> > > CPU Status Register 1        = 0x8002000000000000
> > > SADD LOG                     = 0x147ffcffffffffff
> > > Read Short LOG               = 0xc1af00ffd053f830
> > > 
> > > 
> > > 
> > > -----------------  Processor 0 LPMC Information ------------------
> > > 
> > > Check Type                   = 0x00000000
> > > IC Parity Info               = 0x00000000
> > > Cache Check                  = 0x00000000
> > > TLB Check                    = 0x00000000
> > > Bus Check                    = 0x00000000
> > > Assists Check                = 0x00000000
> > > Assist State                 = 0x00000000
> > > Path Info                    = 0x00000000
> > > System Responder Address     = 0x0000000000000000
> > > System Requestor Address     = 0x0000000000000000
> > > 
> > > 
> > > 
> > > -----------------  Processor 0 TOC Information -------------------
> > > 
> > > General Registers 0 - 31
> > > 00-03  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 04-07  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 08-11  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 12-15  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 16-19  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 20-23  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 24-27  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 28-31  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 
> > > 
> > > Control Registers 0 - 31
> > > 00-03  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 04-07  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 08-11  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 12-15  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 16-19  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 20-23  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 24-27  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 28-31  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 
> > > Space Registers 0 - 7
> > > 00-03  00000000          00000000          00000000          00000000
> > > 04-07  00000000          00000000          00000000          00000000
> > > 
> > > IIA Space (back entry)       = 0x0000000000000000
> > > IIA Offset (back entry)      = 0x0000000000000000
> > > CPU State                    = 0x00000000
> > > 
> > > 
> > > 
> > > -----------------  Processor 3 HPMC Information - PDC Version: 44.28  ------ 
> > > Timestamp =    Thu Jul  30 17:30:07 GMT 2009    (20:09:07:30:17:30:07)
> > > 
> > > HPMC Chassis Codes 
> > >        Chassis Code        Extension        ------------        ---------
> > > 0x0000082000ff6242  0x0000000000000000
> > >        0x1800082011036322  0xcb81800000000000
> > >        
> > > General Registers 0 - 31
> > > 00-03  0000000000000000  000000004067a9c0  000000004011c18c
> > > 0000000043541518
> > > 04-07  00000000406791c0  00000000fc985000  000000007f93f000
> > > 0000000000000000
> > > 08-11  00000000fca67918  000000007f8d9cc0  00000000404eb740
> > > 0000000040000000
> > > 12-15  0000000000000000  0000000000000200  0000000040311427
> > > 0000000000000000
> > > 16-19  00000000419e85c8  000000007f93f888  0000000000000000
> > > 0000000000000000
> > > 20-23  000000000003f93f  00000000fffffffa  0000000000000000
> > > 0000000000000040
> > > 24-27  0000000000000010  00000000fc985fc0  000000004050a000
> > > 00000000406791c0
> > > 28-31  0000000000000001  000000007f94c800  000000007f94c830
> > > 00000000005282a3
> > > 
> > > 
> > > Control Registers 0 - 31
> > > 00-03  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 04-07  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 08-11  0000000000000146  0000000000000000  00000000000000c0
> > > 0000000000000000
> > > 12-15  0000000000000000  0000000000000000  0000000000103000
> > > ff80000000000000
> > > 16-19  0000003aeb5d7f36  0000000000000000  000000004011c190
> > > 0000000004a01200
> > > 20-23  0000000000000000  00000000fc985000  000000ff0804f90f
> > > 8000000000000000
> > > 24-27  0000000000586000  000000003f952000  fffffffff37f7f00
> > > 0000000040001b60
> > > 28-31  fffffffff37f7f00  fffffffff37f7f00  000000007f94c000
> > > fffffffff37f7f00
> > > 
> > > Space Registers 0 - 7
> > > 00-03  00051800          00000000          00000000          00051800
> > > 04-07  00000000          00000000          00000000          00000000
> > > 
> > > 
> > > IIA Space (back entry)       = 0x0000000000000000
> > > IIA Offset (back entry)      = 0x000000004011c194
> > > Check Type                   = 0x20000000
> > > CPU State                    = 0x9e000004
> > > Cache Check                  = 0x00000000
> > > TLB Check                    = 0x00000000
> > > Bus Check                    = 0x0030000d
> > > Assists Check                = 0x00000000
> > > Assist State                 = 0x00000000
> > > Path Info                    = 0x00000000
> > > System Responder Address     = 0xfffffffffffa6000
> > > System Requestor Address     = 0xfffffffffffa0000
> > > 
> > > 
> > > Floating Point Registers 0 - 31
> > > 00-03  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 04-07  0000000000000000  00000000bf840350  00000000bf840358
> > > 0000000000000008
> > > 08-11  000000004020b518  00000000ff83a268  0000000000000000
> > > 0000000000000002
> > > 12-15  00000000ff83fc10  00000000ff8403f0  00000000ff83fc00
> > > 00000000406791c0
> > > 16-19  0000000000000002  00000000ff83a268  00000000406879c0
> > > 00000000406809c0
> > > 20-23  00000000000000ff  00000000406791c0  0000000000000000
> > > 0000000a4067a9c0
> > > 24-27  0000000000000000  00000000406841c0  fffffffffffff000
> > > 00000000fefa6000
> > > 28-31  0000000000000000  0000000000000000  ffffffffffffff9c
> > > 00000000406791c0
> > > 
> > > 
> > > Check Summary                = 0xcb81800000000000
> > > Available Memory             = 0x00000000c0000000
> > > CPU Diagnose Register 2      = 0x0203030100802004
> > > CPU Status Register 0        = 0x3440c24000000000
> > > CPU Status Register 1        = 0x8000000000000000
> > > SADD LOG                     = 0x4800000000000000
> > > Read Short LOG               = 0xc13ff0f0f0047218
> > > 
> > > 
> > > 
> > > -----------------  Processor 3 LPMC Information ------------------
> > > 
> > > Check Type                   = 0x00000000
> > > IC Parity Info               = 0x00000000
> > > Cache Check                  = 0x00000000
> > > TLB Check                    = 0x00000000
> > > Bus Check                    = 0x00000000
> > > Assists Check                = 0x00000000
> > > Assist State                 = 0x00000000
> > > Path Info                    = 0x00000000
> > > System Responder Address     = 0x0000000000000000
> > > System Requestor Address     = 0x0000000000000000
> > > 
> > > 
> > > 
> > > -----------------  Processor 3 TOC Information -------------------
> > > 
> > > General Registers 0 - 31
> > > 00-03  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 04-07  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 08-11  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 12-15  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 16-19  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 20-23  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 24-27  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 28-31  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 
> > > 
> > > Control Registers 0 - 31
> > > 00-03  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 04-07  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 08-11  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 12-15  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 16-19  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 20-23  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 24-27  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 28-31  0000000000000000  0000000000000000  0000000000000000
> > > 0000000000000000
> > > 
> > > Space Registers 0 - 7
> > > 00-03  00000000          00000000          00000000          00000000
> > > 04-07  00000000          00000000          00000000          00000000
> > > 
> > > IIA Space (back entry)       = 0x0000000000000000
> > > IIA Offset (back entry)      = 0x0000000000000000
> > > CPU State                    = 0x00000000
> > > 
> > > 
> > > --------------  Memory Error Log Information  --------------
> > > 
> > > Bus 0 Log Information
> > > 
> > > Timestamp =    Thu Jul  30 17:30:07 GMT 2009    (20:09:07:30:17:30:07)
> > > 
> > >   OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
> > >   --  --  --      -----      -  -  -  ----  ---  --  --  --
> > >   X       X     ERR_ERROR       X            X           
> > > Bus Requestor Address      = 0xfffffffffffa0000
> > > Bus Target Address         = 0x0000000000000000
> > > Bus Responder Address      = 0xfffffffffed00000
> > > 
> > > Error Status Reg           = 0x0000000000100010
> > > Runway Control Reg         = 0x0000021c00001418
> > > Runway Address Reg         = 0xc1bff0fffed08040
> > > Runway Data High Reg       = 0xe840c000083c025c
> > > Runway Data Low Reg        = 0xe840c000083c025c
> > > Memory Address Reg         = 0x000001ff3fffffff
> > > Memory Address Corr Reg    = 0x000001ff3fffffff
> > > Memory Syndrome Reg        = 0x0000000000000000
> > > Memory Syndrome Corr Reg   = 0x0000000000000000
> > > 
> > > 
> > > 
> > >  Address/Control Parity Error Registers  
> > >    Address/Control Parity Error Bit (mem_addr_par_stat) Not Set 
> > > 
> > > 
> > > ------------  I/O Module Error Log Information  ------------
> > > 
> > > 
> > >    No I/O module errors logged
> > > 
> > > 
> > > Main Menu: Enter command or menu > 
> > 
> 
> -- 
> Meelis Roos (mroos@linux.ee)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
