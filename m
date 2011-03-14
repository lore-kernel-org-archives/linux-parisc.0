From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: "add,dc" problem with new binutils in csum_ipv6_magic asm
Date: Mon, 14 Mar 2011 18:32:52 -0400
Message-ID: <20110314223252.GA28338@hiauly1.hia.nrc.ca>
References: <alpine.SOC.1.00.1103141024040.3640@math.ut.ee>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.SOC.1.00.1103141024040.3640@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 14 Mar 2011, Meelis Roos wrote:

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
> make[3]: *** [drivers/net/atl1c/atl1c_main.o] Error 1
> 
> arch/parisc/include/asm/checksum.h has the corresponding inline asm - it 
> seems that add,dc is not accepted by the new binutils.

I backported the fix from binutils mainline.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
