From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: PA8800 Status (Happy New Year)
Date: Tue, 2 Jan 2007 20:41:42 -0500 (EST)
Message-ID: <200701030141.l031fgxn019232__28578.9060676054$1416624250$gmane$org@hiauly1.hia.nrc.ca>
References: <no.id>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <no.id> from "John David Anglin" at Jan 2, 2007 07:58:56 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Bad Address (null pointer deref?): Code=15 regs=0000000245b4f590 (Addr=00000625733a213a)
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00001000000001001011110100001111 Not tainted
> r00-03  000000ff0804bd0f 000000004050f8c0 0000000040311010 0000000084f664ff
> r04-07  00000000405038c0 0000000000000002 0000000084f664c1 000000007fe0a000
> r08-11  0000000000000000 000000007fe0a000 00000000000002b1 000000007ea85600
> r12-15  000000004f2241c0 000000007e96c000 000000007fe0a000 0000000000000040
> r16-19  0000000000000000 000000007fe0a494 000000007ad0b012 00000000404ba2d4
> r20-23  3c353e25733a2046 000000004050f8c0 000000007fe0a000 0000000000000000
> r24-27  0000000084f664c1 0000000000013c43 0000000078340400 00000000405038c0
> r28-31  0000000000000003 0000000245b4f560 0000000245b4f590 00000000404ba2c0
> sr00-03  0000000001436800 0000000000000000 0000000000000000 0000000001436800
> sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
> 
> IASQ: 0000000000000000 0000000000000000 IAOQ: 000000004031104c 0000000040311050
>  IIR: 4a9c01e8    ISR: 000000003c353800  IOR: 00000625733a213a
>  CPU:        0   CR30: 0000000241ee0000 CR31: 00000000404c4000
>  ORIG_R28: 00000054000000c8
>  IAOQ[0]: ip_route_input+0xb4/0xca8
>  IAOQ[1]: ip_route_input+0xb8/0xca8
>  RP(r2): ip_route_input+0x78/0xca8
> Kernel panic - not syncing: Bad Address (null pointer deref?)
>  <0>Rebooting in 5 seconds..

The code seems to be:

    40311008:   eb fe ac 25     b,l 4030e620 <rt_hash_code>,rp
    4031100c:   0b 97 02 28     and r23,ret0,r8
    40311010:   08 04 02 5b     copy r4,dp
    40311014:   2b 63 20 00     addil L%7000,dp,r1
    40311018:   50 3f 04 f0     ldd 278(r1),r31
    4031101c:   0f e0 10 d3     ldd 0(r31),r19
    40311020:   0e 7c 20 dc     ldd,s ret0(r19),ret0
    40311024:   9f 80 22 00     cmpb,*= r0,ret0,4031112c <ip_route_input+0x194>
    40311028:   2b 66 00 00     addil L%c000,dp,r1
    4031102c:   08 1c 02 54     copy ret0,r20
    40311030:   50 33 0e a0     ldd 750(r1),r19
    40311034:   e8 00 00 20     b,l 4031104c <ip_route_input+0xb4>,r0
    40311038:   08 01 02 55     copy r1,r21
    4031103c:   37 9c 00 02     ldo 1(ret0),ret0
    40311040:   6a 7c 00 70     stw ret0,38(r19)
    40311044:   0e 80 10 d4     ldd 0(r20),r20
    40311048:   9e 80 21 ba     cmpb,*=,n r0,r20,4031112c <ip_route_input+0x194>
    4031104c:   4a 9c 01 e8     ldw f4(r20),ret0

It seems like there must be some way to get to 4031104c avoiding the
on r20/ret0.  Don't see any branches to the region between 40311024
and 40311044 in the function, or any other direct branches to 4031104c.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
