From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: "add,dc" problem with new binutils in csum_ipv6_magic asm
Date: Mon, 14 Mar 2011 09:22:24 -0400 (EDT)
Message-ID: <20110314132225.5A57D4FDC@hiauly1.hia.nrc.ca>
References: <alpine.SOC.1.00.1103141024040.3640@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: mroos@linux.ee (Meelis Roos)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1103141024040.3640@math.ut.ee> from "Meelis Roos" at Mar 14, 2011 10:29:03 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> While trying to compile 2.6.38-rc8-00065 on hppa64 with new binutils 
> 2.21.0.20110302 I hit a problem with inline asm in 64-bit variant of 
> csum_ipv6_magic() with first network driver that used it:
> 
>   CC [M]  drivers/net/atl1c/atl1c_main.o                    
> drivers/net/atl1c/atl1c_main.c:2543: warning: 'atl1c_resume' defined but not used
> {standard input}: Assembler messages:
> {standard input}:4996: Error: Invalid Add Condition: dc
> {standard input}:4997: Error: Invalid Add Condition: dc
> {standard input}:4998: Error: Invalid Add Condition: dc
> {standard input}:4999: Error: Invalid Add Condition: dc

Yuck!  I hadn't realized that the change that caused this was backported
to 2.21.  The change fixed something that wasn't really a problem and
broke dc and db.

This is fixed on binutils head.  Can you use it?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
