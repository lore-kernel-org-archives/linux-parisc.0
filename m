Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5879848ED
	for <parisc-linux@lists.parisc-linux.org>; Sun, 19 Oct 2003 23:06:25 -0600 (MDT)
Date: Mon, 20 Oct 2003 01:02:29 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: HPPA FPU Specification? (FE_INEXACT raised by accident)
Message-ID: <20031020050229.GC26432@systemhalted>
References: <20031019215130.GG8642@systemhalted> <200310192316.h9JNG3At027825@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200310192316.h9JNG3At027825@hiauly1.hia.nrc.ca>
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

On Sun, Oct 19, 2003 at 07:16:03PM -0400, John David Anglin wrote:
> > I've noticed that I cannot generate an underflow or overflow exception
> > without also forcing an inexact exception on my PA 2.0 system. Are you
> > familiar with this behaviour at all? I'm trying to straighten our fenv
> > setup, and this is really the last crinkle.
> 
> I suggest looking at page 10-7.  It describes the PA 2.0 behavior
> for this situation.  I'm not an IEEE so I don't know offhand what it
> mandates.

Multiple exceptions per instruction is not the intended behaviour :)
I need two numbers, that when added only overflow, not overflow and
inexact. The same to be said for underflow. Perhaps I just need to 
dig more.

c.
