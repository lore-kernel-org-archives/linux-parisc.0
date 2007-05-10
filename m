From: Rob Landley <rob@landley.net>
Subject: [parisc-linux] Re: [patch] removes MAX_ARG_PAGES
Date: Thu, 10 May 2007 05:19:37 -0400
Message-ID: <200705100519.38073.rob__4611.68904225833$1416624357$gmane$org@landley.net>
References: <65dd6fd50705060151m78bb9b4fpcb941b16a8c4709e@mail.gmail.com>
	<200705092104.43353.rob@landley.net>
	<65dd6fd50705092106i15722e97g85f43191ceb5a3d7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: linux-arch@vger.kernel.org,
 Peter Zijlstra <a.p.zijlstra@chello.nl>,
 linux-kernel@vger.kernel.org,
 Andi Kleen <ak@suse.de>,
 linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Ingo Molnar <mingo@elte.hu>,
 parisc-linux@lists.parisc-linux.org
To: "Ollie Wild" <aaw@google.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <65dd6fd50705092106i15722e97g85f43191ceb5a3d7@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thursday 10 May 2007 12:06 am, Ollie Wild wrote:
> On 5/9/07, Rob Landley <rob@landley.net> wrote:
> > Just FYI, a really really quick and dirty way of testing this sort of 
thing on
> > more architectures and you're likely to physically have?
> 
> Does this properly emulate caching?  On parisc, cache coherency was
> the main issue we ran into.  I suspect this might be the case with
> other architectures as well.

This is really a QEMU question.  I've been focused on making cross-compilers 
and using those to create kernels and a minimal native build environment I 
could use to natively compile packages with.  (The way I designed the thing 
you could substitute real hardware for the qemu step, assuming you had it.  
Or another emulator like armulator for a specific platform.)

I don't believe QEMU emulates parisc yet, although it adds new platforms all 
the time.  (It just grew an alpha emulation last month.)  It's under very 
active development.

Rob
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
