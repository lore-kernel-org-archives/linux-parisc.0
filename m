From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] Bug report data collection tool
Date: Thu, 21 Jul 2005 10:22:31 -0400
Message-ID: <20050721142230.GZ30182@systemhalted.org>
References: <42DF53E8.5010904@excelcia.org>
	<20050721125853.GC27330@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050721125853.GC27330@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jul 21, 2005 at 06:58:53AM -0600, Grant Grundler wrote:
> On Thu, Jul 21, 2005 at 01:51:04AM -0600, Kurt Fitzner wrote:
> > I was thinking that perhaps it would be useful to have a tool to help
> > collate information after a hang/crash.  Something you would run on the
> > next boot.
> > 
> > I wasn't able to tell from a cursory glance at pdc_stable.c, but if the
> > driver supports it then perhaps the tool could read HPMC/TOC data post
> > crash from nvram (rather than having to write out or use a serial
> > console to capture 'ser pim' data).
> 
> We thought of that before but there are a few issues:
> 1) stable storage access is only via PDC calls.
> 2) format of PIM data is platform dependent - ie every model machine
>    could have a different format. In practice, ISTR the format usually
>    is the same for a given processor model and not each model of machine.

Don't we already have 1) thanks to lkcd?
And as far as 2) can't you just do that through hte PDC too?

> >  It could then cross reference the
> > crash address with the System.map, gather pre-crash data from the logs
> > and a machine profile from /proc.
> > 
> > If something like this would be useful, I could do with having a project
> > to help me learn the ropes.
> 
> Lack of documentation will make this a fairly hard project. :^(

Really?

This sounds like kexec + lkcd.

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
