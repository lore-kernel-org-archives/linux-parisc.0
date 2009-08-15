From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: hppa64 gcc ICE building linux-2.6.31-rc5
Date: Sat, 15 Aug 2009 18:49:00 -0400 (EDT)
Message-ID: <20090815224901.DE9874CFD@hiauly1.hia.nrc.ca>
References: <20090812213456.GD13142@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090812213456.GD13142@lackof.org> from "Grant Grundler" at Aug 12, 2009 03:34:56 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Grant,

Can you try again switching the alternative 4.4?  I think it currently
points to 4.2.  There are significant changes in this area in 4.3 and 4.4.

The GCC 4.2 tree  is dead.

Dave

> Carlos, Dave,
> Just got this after updating gsyprf11 and trying to build
> linux-2.6.31-rc5 using .config provided by dannf.
> 
> grundler <534>uname -a
> Linux gsyprf11 2.6.22.19 #5 SMP Tue Aug 4 17:16:18 PDT 2009 parisc64 GNU/Linux
> grundler <535>make 
> ...
>   CC [M]  fs/xfs/xfs_iomap.o
> fs/xfs/xfs_iomap.c: In function 'xfs_iomap_write_delay':
> fs/xfs/xfs_iomap.c:648: error: insn does not satisfy its constraints:
> (insn 331 99 103 12 fs/xfs/xfs_iomap.c:599 (set (reg:QI 60 SAR)
>         (mem/c:QI (plus:DI (reg/f:DI 30 %r30)
>                 (const_int -273 [0xfffffffffffffeef])) [0 %sfp+191 S1 A128])) 101 {*pa.md:3318} (nil))
> fs/xfs/xfs_iomap.c:648: internal compiler error: in reload_cse_simplify_operands, at postreload.c:396
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <http://gcc.gnu.org/bugs.html> for instructions.
> make[2]: *** [fs/xfs/xfs_iomap.o] Error 1
> make[1]: *** [fs/xfs] Error 2
> make: *** [fs] Error 2
> 
> I'll not touch the source tree on gsyprf11:/usr/src/linux-2.6 until either
> of you can look at it. (No hurry...just letting you know where to look).
> 
> thanks,
> grant
> 


-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
