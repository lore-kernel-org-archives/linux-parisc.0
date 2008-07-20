From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.26 kernel crash
Date: Sun, 20 Jul 2008 13:38:09 -0400 (EDT)
Message-ID: <20080720173810.6EE7F4E43@hiauly1.hia.nrc.ca>
References: <200807201907.59762.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200807201907.59762.deller@gmx.de> from "Helge Deller" at Jul 20, 2008 07:07:59 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Kernel Fault: Code=15 regs=5f578640 (Addr=000127ec)
> > 
> >      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> > PSW: 00000000000001001111110000001111 Not tainted
> > r00-03  0004fc0f 10644f10 1011ee68 5f578288
> > r04-07  00000014 8c1fe860 8c1fe828 8eb7d030
> > r08-11  105ee890 00000040 0001264a 000d3b60
> > r12-15  00000000 000d3b5c 000dde68 000b0000
> > r16-19  8eb7d250 000b0000 ffffffff 000127ec

FWIW, this is the instruction:

dave@hiauly6:~/opt/gnu/bin$ disasm 0x0e601093
   0:	0e 60 10 93 	ldw 0(r19),r19

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
