Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailgw.cvut.cz (mailgw.cvut.cz [147.32.3.235])
	by dsl2.external.hp.com (Postfix) with ESMTP id 91C304829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 10:11:21 -0600 (MDT)
From: "Petr Vandrovec" <VANDROVE@vc.cvut.cz>
To: Andreas Seltenreich <s_selten@informatik.uni-karlsruhe.de>
Date: Fri, 20 Sep 2002 18:10:52 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Subject: Re: [parisc-linux] Re: partial success with matroxfb
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <257F2C27A66@vcnet.vc.cvut.cz>
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

On 20 Sep 02 at 17:50, Andreas Seltenreich wrote:
> * Petr Vandrovec <VANDROVE@vc.cvut.cz> [2002-09-20 12:12]:
> >   boot with 'video=matrox:novga'. It looks like that Matrox responded
> 
> No success with novga or no_pci_retry either. It results in the same crash. 

Can you verify (with lspci -xxx) that PCI dword register 0x40 in matroxfb
configuration space has not set bit 8 (it is lowest bit in register
0x41). 0=>disable legacy VGA, 1=>enable legacy VGA. Old Millennium I
always responded to framebuffer accesses, and it was fixed in Millennium II.
I thought that it was fixed in Mystique too. You can fix it with
setpci, if matroxfb gets it wrong.

> > Can you print DAC registers 0x4C,0x4D,0x4E,0x4F after this message?
> > 0x4C..0x4E should contain 8,7E,3, and 0x4F should contain 0 when
> > PLL is not locked, and 0x40 if PLL is locked.
> 
> Ok, the code around the message now looks like this:

> DAC register 4c=8
> DAC register 4d=7e
> DAC register 4e=1f
> DAC register 4f=0

Strange. Stalls it for 5 seconds here, or goes it through immediately?

> DAC register 4c=8
> DAC register 4d=7e
> DAC register 4e=1f
> DAC register 4f=40

                                                            Petr
                                                            
