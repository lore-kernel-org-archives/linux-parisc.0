Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id AA3864829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  8 Jan 2003 10:36:10 -0700 (MST)
Message-Id: <200301081735.h08HZxn2026972@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: do_page_fault() infinite loop running 2.4.20-pa18 #9 SMP
To: Matt.Foster@Unilever.com
Date: Wed, 8 Jan 2003 12:35:59 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <003001c2b6f9$693c0bd0$211def9f@teatime> from "Matt Foster" at Jan 8, 2003 09:36:24 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> saturn:/usr/local/src# dmesg | more
> Linux version 2.4.20-pa18 (bame@dsl2) (gcc version 3.0.3) #1 Tue Jan 7
> 06:44:31
> MST 2003
> FP[0] enabled: Rev 1 Model 15
> The 32-bit Kernel has started...
> Determining PDC firmware type: System Map.
> [*SNIP*]
> Adding Swap: 249232k swap-space (priority -1)
> eth0: link ok.
> 
> do_page_fault() pid=266 command='sendmail' type=6 address=0x00000003
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001111 Not tainted
> r00-03  00000000 400c78f0 40315e07 00000000
> r04-07  40326bec 40316230 00000010 00000001
> r08-11  00000000 402d3c98 0008df50 0008df54
> r12-15  00000076 00000073 00000006 00000000
> r16-19  000b3348 ffffffff 000bc248 40326bec
> r20-23  00000000 faf02a58 00000000 00000001
> r24-27  00000000 40316230 000f6dd0 000b3348
> r28-31  00000016 400e19dc faf029c0 40315e07
> sr0-3   00000000 0000016e 00000000 0000016e
> sr4-7   0000016e 0000016e 0000016e 0000016e
> 
> IASQ: 0000016e 0000016e IAOQ: 00000003 00000007

The code has branched to address 0.  If there is a core dump,
you might get some idea what happened by disassembling the
code just before and after $rp (0x40315e04).  Branches to address
0 can occur if the code tries to call an undefined weak function
or if there is a problem with function pointers.  I suspect an
indirect call since $r22 is 0 (this register contains the address
of the callee in an indireect call).

Page faults often occur when there is a problem in user code.
In the SMP case, certain page faults cause an infinite loop
in do_page_fault().  Do you see the above repeated indefinitely?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
