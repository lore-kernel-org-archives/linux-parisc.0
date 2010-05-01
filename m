From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Sat, 1 May 2010 16:17:14 -0400 (EDT)
Message-ID: <20100501201715.44ABB515D@hiauly1.hia.nrc.ca>
References: <k2y7d01f9f01005011134p72082b2bh5fe41d61d9e16aa1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, deller@gmx.de,
	linux-parisc@vger.kernel.org, gniibe@fsij.org,
	carlos@systemhalted.org
To: T-Bone@parisc-linux.org (Thibaut VARENE)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <k2y7d01f9f01005011134p72082b2bh5fe41d61d9e16aa1@mail.gmail.com> from "Thibaut VARENE" at May 1, 2010 08:34:13 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Mon, Apr 19, 2010 at 6:26 PM, John David Anglin
> <dave@hiauly1.hia.nrc.ca> wrote:
> > Hi Helge,
> >
> > On Tue, 13 Apr 2010, Helge Deller wrote:
> >
> >> Still crashes.
> >
> > Can you you try the patch below? =C2=A0The change to cacheflush.h is the =
> same
> > as before.
> 
> For the records, while setting up the wiki's TestCases page, it
> noticed that the initial large patch that you sent (see
> https://patchwork.kernel.org/patch/91525/ ) contained bits that
> weren't part of the split chunks you sent afterwards.
> 
> This patch (pte.d.2) seems to update some of those chunks and also
> contains bits that weren't either part of them.

The split chunks were mainly cleanups.  As far as I know, they are
obvious and provide no significant change in functionality.  I didn't
intentionally change any of the split hunks in patch4 (pte.d.2) although
this patch does touch some of the same files.  Possibly, the LWS fixes
should be split into two (obvious and UP locking).

Both the original patch and pte.d.2 were experimental.  Since I sent it,
I continued to experiment and reached a change that appears to fix the
minifail bug in a somewhat different manner than proposed by James.  However,
I'm still seeing some issues that appear to be PTE related (segmentation
faults in sh mainly).

At this point, I don't know why I still see problems.  I have one idea left
to try.  I also would like to implement copy_user_page with equivalent
aliasing.  My first attempt didn't work.  I just enabled code in pacache.S.

I have more or less reached the conclusion that our PTE/TLB management
is quite broken on SMP.  I tried James' patch but had trouble with segmention
faults on my rp3440 and a GCC build died early in stage 1 (make -j8
bootstrap).  I need to try it with a clean build.

I may be wrong but I think a flush in kmap(_atomic) won't work on SMP
because another user may just redirty the page when it is shared.

> That being said so that we do not loose track of potentially useful
> code. Though maybe kyle has all of this sorted out already and I'm
> just unable to figure it out myself ;-)

I don't think there's a clear path.  I've come to realize that I don't
understand what's required of the higher level code.  The documentation
doesn't help much.  Looking at other archs provides some clues.  I've
looked at ia64 a bit (see for example TLB shootout support and retry in
TLB miss handler).

Regarding the wiki, it's a useful summary.  However, #561203 (minifail
bug) is not a "Futex wait failure".  We may have futex bugs, but I'm not
aware of a testcase.  The minifail bug is a "Threads and fork" problem
arising from cache corruption.  Mainly, copy_user_page is broken when
copying memory shared by more than one process.  There are also issues
in PTE/TLB management on SMP systems.  Probably, the vfork/execve bug
is caused by the same problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
