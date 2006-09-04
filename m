From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Mon, 04 Sep 2006 10:51:44 -0500
Message-ID: <1157385104.3513.11.camel@mulgrave.il.steeleye.com>
References: <J4TKVV$8AA4E9E98C79A1A2778C0CBF8A96F048@scarlet.be>
	<20060830165211.GA3999@colo.lackof.org>
	<119aab440608301323w309debf2g6635ce4757ac024b@mail.gmail.com>
	<1157212326.4041.26.camel@mulgrave.il.steeleye.com>
	<119aab440609030800h264c16bcn2958a78558a2ef48@mail.gmail.com>
	<1157300093.3486.15.camel@mulgrave.il.steeleye.com>
	<20060903193122.GA20217@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060903193122.GA20217@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2006-09-03 at 13:31 -0600, Grant Grundler wrote:
> On Sun, Sep 03, 2006 at 11:14:53AM -0500, James Bottomley wrote:
> > Since the timer interrupts miss so many ticks, halftick processing looks
> > like a good idea to me.
> 
> I was going to argue halfticks are a bad idea.
> They just make it all more complicated.
> My last version of the rewrite patch does away with them complete.

I tried this on ioz ... you can simply remove the halftick code in my
version of the patch.  What happens is that we start to drop astonishing
number of ticks occasionally ... it looks like we're getting wrap
conditions again.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
