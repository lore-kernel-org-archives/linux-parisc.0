Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 27 Jul 2003 06:27:45 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Generic light-weight syscall.
Message-ID: <20030727122745.GC16753@dsl2.external.hp.com>
References: <20030725063739.GA13017@systemhalted> <20030725113700.GH1485@parcelfarce.linux.theplanet.co.uk> <20030726174845.GF31744@systemhalted> <20030726180031.GG31744@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030726180031.GG31744@systemhalted>
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

On Sat, Jul 26, 2003 at 02:00:32PM -0400, Carlos O'Donell wrote:
> Talked to Rik Van Riel about fast gettimeofday and he indicated that
> it's not doable since you can't guarantee your process will get
> scheduled on another CPU whose clock is out of sync by more than X and
> get negative time.

Yes we can. We can sync CR16 across CPUs within a few CPU cycles.
I've described this before on parisc-linux.

"sync" means figure out the difference between CR16 on several
CPUs and using CPU 0 as the reference.

> Though I imagine you were talking about having one
> CPU update one page with time on it... and then other CPU's read this?
> LaMont notes that there is no requirement from the PA design that CPU's
> clock at _exactly_ the same frequency or have monotonically incrementing
> clocks at the right rate.

correct. IIRC 9000/870 have seperate clock sources.
But all the boxes we support to date have exactly one clock source.
The multi-cell boxes (like superdome) will have multiple sources
and I don't know how to handle those - maybe a "not quite so fast"
gettimeofday().

hth,
grant
