From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] [RFC] Reorder compat structure placement and
	casting (firmware.c)?
Date: Thu, 5 Aug 2004 00:06:00 -0400
Message-ID: <20040805040600.GA21912@baldric.uwo.ca>
References: <20040801045032.GE31520@baldric.uwo.ca>
	<20040802052751.GD20904@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040802052751.GD20904@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Aug 01, 2004 at 11:27:51PM -0600, Grant Grundler wrote:
> On Sun, Aug 01, 2004 at 12:50:32AM -0400, Carlos O'Donell wrote:
> > +#ifdef __LP64__
> > +        /* If we have a 64-bit kernel reference the stack as
> > +           such, but cast down to a 32-bit structure if
> > +           required. */
> > +	extern struct wide_stack real_stack;
> > +#else
> >  	extern struct narrow_stack real_stack;
> > +#endif
> 
> This is the bit I don't think will work.

Why not? In a wide kernel we only ever declare "extern struct wide_stack
real_stack" and then if we need a narrow stack we cast the pointer. It's
just a label to 8192 bytes declared in real2.S.

 
> > +        real32_stack = (struct narrow_stack *)&real_stack;
> 
> Apologies - this is probbaly the right way to alias/union
> the same address. I just overlooked it before.

The problem is that we can't have two externs declare the same variable
with different storage types. So in wide kernels we make gcc think it's
pointing to a wide_stack, and cast about as neccessary. I coded it such
that the fallback case should optimize away.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
