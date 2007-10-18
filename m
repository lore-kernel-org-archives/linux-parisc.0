From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] what's in parisc-2.6.git
Date: Thu, 18 Oct 2007 15:41:00 -0400
Message-ID: <20071018194100.GA11936__18019.1497588114$1416624445$gmane$org@fattire.cabal.ca>
References: <20071018082953.GB16148@fattire.cabal.ca>
	<200710181937.l9IJbeBL009388@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200710181937.l9IJbeBL009388@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Oct 18, 2007 at 03:37:39PM -0400, John David Anglin wrote:
> Hi Kyle,
> 
> > [Note, I've given up on the quilt tree for now, because it ended up
> > being a bit more hassle than just keeping topic branches around.]
> 
> Have you also given up on your patch tree?  Seems to have disappeared.
> 

Just temporarily. The workflow wasn't really working for me, and wasn't
motivating me to generate diffs. I'll be putting more -pa testkernels
up.

Now that I have some time again, I'll be fixing the autobuilder as well.

> Yesterday, I applied your latest patch set to 2.6.23.1 and built
> an SMP kernel.  I didn't test it much but there were weird errors
> (e.g., postfix failed to start because it thought user postfix
> and user nobody, and apt-get reported missing groups such as
> Debian-exim).  This is all bogus and the errors don't occur with
> 2.6.22.9 + your getdents compat patch.  I still have this kernel
> around.
> 

Er, really? This is bizarre, I'm running tip on all my machines without
problem (granted, in 64-bit mode.)

Can you upload the failing kernel somewhere, and I'll try to reproduce
it?

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
