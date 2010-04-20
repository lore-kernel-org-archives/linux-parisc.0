From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Tue, 20 Apr 2010 14:52:53 -0400 (EDT)
Message-ID: <20100420185255.3D8CF4E77@hiauly1.hia.nrc.ca>
References: <4BCDEB6E.1060408@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	gniibe@fsij.org, carlos@systemhalted.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BCDEB6E.1060408@gmx.de> from "Helge Deller" at Apr 20, 2010 07:59:10 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Helge,

Ok, I think the next thing to try is to try a patch with the tlb
purges and inserts inside the locked region so that the pte and tlb
updates are fully consistent.

I fired up four windows and started minifail on gsyprf11 and got
a core dump in the thread within a couple of minutes.  The parent
was in pthread_join.

Overall stability is definitely better with the change on my rp3440.
I have now got through three GCC builds at -j8.  This never worked before,
so I think we have some progress.

Thanks for testing,
Dave

> Thanks for the patch.
> I applied it on top of a clean 2.6.33.2 kernel and ran multiple parallel 
> minifail programs on my B2000 (2 CPUs, SMP kernel, 32bit kernel).
> Sadly minifail still crashed the same way as before.
> 
> Should I have applied other patches as well?
> 
> Helge
> 
> > I have lightly tested the attached change on rp3440 with SMP 2.6.33.2
> > kernel.  It got through a GCC build at -j8, which is something of a
> > record.  However, I did see one issue this morning in the ada testsuite:
> > 
> > malloc: ../bash/make_cmd.c:100: assertion botched
> > malloc: block on free list clobbered
> > Aborting.../home/dave/gnu/gcc/gcc/gcc/testsuite/ada/acats/run_all.sh: line 67: 29176 Aborted                 (core dumped) ls ${i}.adb >> ${i}.lst 2> /dev/null
> > 
> > I have seen this before.
> > 
> > The change reworks all code that manipulates ptes to use the pa_dbit_lock
> > to ensure that we don't lose state information during updates.  I also
> > added code to purge the tlb associated with the pte as it wasn't obvious
> > to me how for example the write protect bit got set in the tlb.
> > 
> > Someone had clearly tried to fix the dirty bit handling in the past,
> > but the change was incomplete.
> 


-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
