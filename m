From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: call_init in libc6 2.3.6.ds1-11
Date: Sat, 17 Feb 2007 16:50:15 -0500 (EST)
Message-ID: <200702172150.l1HLoFtW025612__11722.3810092129$1416624295$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440702171334w77152427s24c8317a21953518@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702171334w77152427s24c8317a21953518@mail.gmail.com>
	from "Carlos O'Donell" at Feb 17, 2007 04:34:29 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Both cases work correctly. So what happened in the original post?

There's two checks in call_init for the plabel bit:

0x400d77a4 <call_init+168>:     ldw 678(r1),ret0
0x400d77a8 <call_init+172>:     ldw 0(ret0),r20
0x400d77ac <call_init+176>:     bb,<,n r20,1e,0x400d7884 <call_init+392>
0x400d77b0 <call_init+180>:     cmpib,=,n 0,r21,0x400d77ec <call_init+240>
0x400d77b4 <call_init+184>:     ldw 4(r21),r20
0x400d77b8 <call_init+188>:     ldw 0(r3),ret0
0x400d77bc <call_init+192>:     add,l ret0,r20,r22
0x400d77c0 <call_init+196>:     bb,>=,n r22,1e,0x400d7854 <call_init+344>
0x400d77c4 <call_init+200>:     copy r19,r4
0x400d77c8 <call_init+204>:     fstw fr14,-10(sp)
0x400d77cc <call_init+208>:     ldw -10(sp),r26
0x400d77d0 <call_init+212>:     fstw fr13,-10(sp)
0x400d77d4 <call_init+216>:     ldw -10(sp),r25
0x400d77d8 <call_init+220>:     fstw fr12,-10(sp)
0x400d77dc <call_init+224>:     ldw -10(sp),r24
0x400d77e0 <call_init+228>:     b,l 0x400dedd4 <$$dyncall>,r31
0x400d77e4 <call_init+232>:     copy r31,rp
0x400d77e8 <call_init+236>:     copy r4,r19

It's the latter one that didn't have the plabel bit.  Didn't check
the first.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
