From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] [Testers wanted] New glibc with profiling fixed.
Date: Sun, 11 Jan 2004 15:43:55 -0500
Message-ID: <20040111204355.GL28742__46836.9845919826$1416623123$gmane$org@systemhalted>
References: <20040105194809.GA9269@systemhalted>
	<20040105194839.GB9269@systemhalted>
	<20040111040906.GA32382@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <carlos@baldric.uwo.ca>
In-Reply-To: <20040111040906.GA32382@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, Jan 10, 2004 at 09:09:06PM -0700, Grant Grundler wrote:
> On Mon, Jan 05, 2004 at 02:48:39PM -0500, Carlos O'Donell wrote:
> > http://www.parisc-linux.org/~carlos/glibc-2.3.2-debs-2004-01-05/
> 
> I finally installed these (libc6 and libc6-dev) and live is still good.
> thanks carlos!

Excellent. You haven't tried profiling any programs have you? :)
Compile with CFLAGS=-pg, run-em, then run gprof on the gmon.out output?

c.
