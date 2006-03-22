From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes)
Date: Wed, 22 Mar 2006 18:18:16 +0100
Message-ID: <IWJHEG$84A0993CB79425B02A52A47173C782A6@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: "grundler" <grundler@parisc-linux.org>,
 "parisc-linux" <parisc-linux@lists.parisc-linux.org>,
 "tsg45800" <tsg45800@scarlet.be>
To: "deller" <deller@gmx.de>
Return-Path: <soete.joel@tiscali.be>
List-ID: <linux-parisc.vger.kernel.org>

> Hi all,
> 
> it turned out, that it was a stupid bug in the PFN calculation of the D=
TLB
handler routine.
> It's fixed now in CVS.
> The 64bit Kernel boots now, but I still have to clean up STIfb driver t=
o do
the right thing.
> 
> Anyway, nice to have this fixed.
> If STIfb is done, it's time to remove the CONFIG_HPPA_IOREMAP option.
> 
Great job ;-)

Tested on n4k (2 way 64bit kernel) and all seems to works fine.

But unfortuantely failed to boot on b2k (64bit up kernel):
Soft power switch enabled, polling @ 0xfffffff0f0400804.                 =
    
                                                      
STI GSC/PCI core graphics driver Version 0.9a                            =
    
                                                      
STI PCI graphic ROM found at fffffffff4940000 (128 kB), fb at fffffffffb0=
00000
(16 MB)                                              
    id 35acda16-9a02587, conforms to spec rev. 8.0c                      =
    
                                                      
BUG: soft lockup detected on CPU#0!                                      =
    
                                                      
                                                                         =
    
                                                      
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                    =
    
                                                      
PSW: 00001000000001000000000000001111 Not tainted                        =
    
                                                      
r00-03  0000000000000000 0000000000000080 000000001010a908 00000000800000=
00  
                                                      
r04-07  000000000000002a 00000000a8000000 0000000000000555 00000000000000=
0d  
                                                      
r08-11  0000000000000000 0000000090dc4f6c 0000000000000001 0000000010dc51=
c8  
                                                      
r12-15  0000000000000010 0000000000000010 0000000000000001 ffffffffffffff=
ff  
                                                      
r16-19  000000001043b328 0000000000000000 0000000000000000 00000000000000=
00  
                                                      
r20-23  0000000000000000 0000000000000000 0000000000000005 00000000000080=
00  
                                                      
r24-27  0000000000000000 0000000000008000 00000000000000cc 00000000105cbc=
40  
                                                      
r28-31  0000000000000000 00000000002aa800 0000000010dc5390 00000000002aa8=
00  
                                                      
sr0-3   0000000000000000 0000000000000000 0000000000000000 00000000000000=
00  
                                                      
sr4-7   0000000000000000 0000000000000000 0000000000000000 00000000000000=
00  
                                                      
                                                                         =
    
                                                      
      VZOUICununcqcqcqcqcqcrmunTDVZOUI                                   =
    
                                                      
FPSR: 00000100000100000000100000000000                                   =
    
                                                      
FPER1: 24850e06                                                          =
    
                                                      
fr00-03  0000000000000000 0000001f00000000 0000001f00000000 0000001f00000=
000 
                                                      
fr04-07  0000000000000000 5555555555555555 5555555555555555 5555555555555=
555 
                                                      
fr08-11  5555555555555555 5555555555555555 5555555555555555 5555555555555=
555 
                                                      
fr12-15  5555555555555555 5555555555555555 5555555555555555 5555555555555=
555 
                                                      
fr16-19  5555555555555555 5555555555555555 5555555555555555 5555555555555=
555 
                                                      
fr20-23  5555555555555555 5555555555555555 0000000000000000 0000000000000=
000 
                                                      
fr24-27  0000000000000000 5555555555555555 5555555555555555 5555555555555=
555 
                                                      
fr28-31  5555555555555555 5555555555555555 5555555555555555 5555555555555=
555 
                                                      
                                                                         =
    
                                                      
IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000102a3cd8
00000000102a3cdc                                                     
 IIR: d3bd1ae8    ISR: 0000000000000000  IOR: 00000000105cbc40           =
    
                                                      
 CPU:        0   CR30: 0000000010dc4000 CR31: 0000000010584000           =
    
                                                      
 ORIG_R28: 00000000104bd008                                              =
    
                                                      
 IAOQ[0]: memset+0x378/0x8e0                                             =
    
                                                      
 IAOQ[1]: memset+0x37c/0x8e0                                             =
    
                                                      
 RP(r2): __udivdi3+0x518/0x940

(which same 32bit kernel seems to works fine?)

Thanks,
    Joel

PS: on going to test on d380 (will advise later)
=0A=0A-------------------------------------------------------=0ANOTE! My =
email address is changing to ... @scarlet.be=0APlease make the necessary =
changes in your address book. =0A=0A
