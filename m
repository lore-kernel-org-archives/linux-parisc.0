From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] [Testers wanted] New glibc with profiling fixed.
Date: Mon, 5 Jan 2004 17:00:28 -0500
Message-ID: <20040105220028.GC9269__37029.2929969311$1416623107$gmane$org@systemhalted>
References: <20040105194809.GA9269@systemhalted>
	<20040105204510.GD9004@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <carlos@baldric.uwo.ca>
In-Reply-To: <20040105204510.GD9004@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Jan 05, 2004 at 01:45:10PM -0700, Grant Grundler wrote:
> On Mon, Jan 05, 2004 at 02:48:09PM -0500, Carlos O'Donell wrote:
> > Testers wanted please, in particular to test if building with -pg works
> > on your system and you get the expected results.
> 
> How much testing has this had?
> I'm willing to try it on various boxes if I have an idea
> of the risk involved.

Passes all the testsuites without regressions. Doesn't kill *my* system.
It's a *minor* change to the existing glibc provided by debian, purely
to fix the FTBS that lamont saw for "roy."

c.
