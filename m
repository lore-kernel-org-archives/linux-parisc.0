From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Unknown FPU exception, help needed, please decode.
Date: Thu, 15 Dec 2005 19:33:32 -0700
Message-ID: <20051216023332.GA1787@colo.lackof.org>
References: <20051215192204.GE1298@baldric.uwo.ca> <43A20253.6080408@tausq.org>
	<20051216011318.GL1298@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051216011318.GL1298@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Dec 15, 2005 at 08:13:18PM -0500, Carlos O'Donell wrote:
> It's the glibc fp testsuite. We test for a lot of things, I need to
> narrow down the insn sequence causing the exception.
> 
> I've never seen this print before. Atleast not with the older
> sysdeps/hppa/fpu/* bits in place.

Maybe the glibc test has changed too?

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
