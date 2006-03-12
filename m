From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcj can't make shared libs on hppa
Date: Sun, 12 Mar 2006 10:27:38 -0500 (EST)
Message-ID: <200603121527.k2CFRcig015476@hiauly1.hia.nrc.ca>
References: <200603121510.k2CFArcx015381@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200603121510.k2CFArcx015381@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Mar 12, 2006 10:10:53 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>  84c:   e8 40 01 f0     b,l 94c <frame_dummy>,rp
>  850:   08 00 02 40     nop

I just noticed that r19 is not restored after the call to frame_dummy.
It's clobbering r19.

>  854:   e8 40 05 c0     b,l b3c <__do_global_ctors_aux>,rp
>  858:   08 00 02 40     nop
>  85c:   4b c2 3f 59     ldw -54(sp),rp
>  860:   08 04 02 53     copy r4,r19
>  864:   e8 40 c0 00     bv r0(rp)
> 
> 00000868 <_end_init>:
>  868:   4f c4 3f 81     ldw,mb -40(sp),r4
> 
> _init comes from the crt files in glibc.  The code at 824 is an
> import stub which appears to be provided by ld.  So, if r19 is wrong,
> it would seem the relocations in the import stub used to load the
> new r19 value must be wrong.  I'm not sure how _init manages to call
> the stub.  That's a bit unusual.

Doh, it's actually just a call to __gmon_start__ ().

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
