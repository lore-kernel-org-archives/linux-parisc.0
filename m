From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Re: [Update] TLS toolchain.
Date: Tue, 17 Jan 2006 15:28:03 -0500
Message-ID: <20060117202803.GQ17559@baldric.uwo.ca>
References: <20060108055109.GE17559@baldric.uwo.ca>
	<43C36337.9040202@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43C36337.9040202@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jan 10, 2006 at 03:33:11PM +0800, Randolph Chung wrote:
> > The elf related failures are relatively new and related to binutils.
> > ---
> > 
> > I'm going to run the NPTL build and see how the tests turn out.
> > 
> > Anyone remember what the next step was?
> 
> I think the gcc stuff is all merged upstream already.
> 
> binutils stuff needs to be merged upstream. Perhaps we should look at
> those elf related failures first.

The constructor ordering issues? We have some failures now, but
are they regressions? Doesn't binutils head exhibit them?
 
> I don't think we are ready for NPTL yet. Did we settle on how we are
> implementing futexes? Are we going to implement a new kernel fsyscall
> for the compare-and-exchange primitive that NPTL seems to depend on?

The options in my mind are:

(1) VDSO implements atomic_compare_and_exchange.
(2) Continue to call LWS directly.

For testing we can continue to use (2).

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
