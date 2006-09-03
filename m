From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Sun, 03 Sep 2006 11:14:53 -0500
Message-ID: <1157300093.3486.15.camel@mulgrave.il.steeleye.com>
References: <J4TKVV$8AA4E9E98C79A1A2778C0CBF8A96F048@scarlet.be>
	<20060830165211.GA3999@colo.lackof.org>
	<119aab440608301323w309debf2g6635ce4757ac024b@mail.gmail.com>
	<1157212326.4041.26.camel@mulgrave.il.steeleye.com>
	<119aab440609030800h264c16bcn2958a78558a2ef48@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Joel Soete <soete.joel@scarlet.be>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440609030800h264c16bcn2958a78558a2ef48@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2006-09-03 at 11:00 -0400, Carlos O'Donell wrote:
> Your guess that this is the solution to problem 2) is not quite right.
> I will argue that the "halftick" counting is at fault here. When a
> "halftick" is counted as a full tick the system time moves into the
> future. All calls to gettimeoffset must therefore return negative
> adjustments. I think removing the erroneous halftick counting is the
> solution to issue 2.


Actually, I think we just accept it as a feature rather than a bug.
Since the timer interrupts miss so many ticks, halftick processing looks
like a good idea to me.  Thus, we have to assume gettimeoffset() can be
negative by up to half a tick.  The current processing in
do_gettimeofday() already copes nicely with this.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
