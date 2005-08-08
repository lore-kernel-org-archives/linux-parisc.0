From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: GCC not disabling the use fr31 even with
	-mdisable-fpregs.
Date: Sun, 7 Aug 2005 20:52:22 -0400 (EDT)
Message-ID: <200508080052.j780qMuI006934@hiauly1.hia.nrc.ca>
References: <20050807233503.GE9703@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050807233503.GE9703@systemhalted.org> from "Carlos O'Donell"
	at Aug 7, 2005 07:35:08 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> .o file can be found at:
> www.baldric.uwo.ca/~carlos/sched.o
> 
> carlos@firin:~/fsrc/linux-2.6-exp/linux-2.6$ hppa64-linux-gnu-objdump -d
> kernel/sched.o | grep fr31R
>      600:       5c df 00 9a     fldw 4c(r6),fr31R
>     29d8:       5c df 24 8a     fldw 1244(r6),fr31R
>     29fc:       5c df 24 8a     fldw 1244(r6),fr31R
>     2a50:       5c df 24 8a     fldw 1244(r6),fr31R
>     2a74:       5c df 24 8a     fldw 1244(r6),fr31R
>   4c:   5f 5f 00 22     fldw 10(r26),fr31R
>  130:   5c 3f 00 9a     fldw 4c(r1),fr31R
> carlos@firin:~/fsrc/linux-2.6-exp/linux-2.6$ 

Need preproccessed source and .s output.

> I think that objdump should not produce fr31R if it's dumping 2.0w code.

To my eye, objdump is doing the right thing.  The difference between
narrow and wide only comes in the interpretation of the space register
bits.  They are zero in the above instructions.

There must be another bug that's setting the R bit.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
