Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 012DE4882
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 Jul 2003 10:29:56 -0600 (MDT)
Date: Thu, 10 Jul 2003 17:29:49 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Matthew Wilcox <willy@debian.org>,
	Joel Soete <jsoe0708@tiscali.be>,
	"Carlos O'Donell" <carlos@baldric.uwo.ca>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C3000 SCSI config, was Re: linux grundler
In-Reply-To: <20030710161243.GB30482@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0307101724300.8453-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Thu, 10 Jul 2003, Grant Grundler wrote:

> Subject: Re: [parisc-linux] C3000 SCSI config, was Re: linux grundler
>
> On Thu, Jul 10, 2003 at 11:18:34AM +0100, M. Grabert wrote:
> > Yes, a (external) FW SCSI terminator and a (external) SE SCSI terminator
> > at the (external) SE SCSI box.
>
> "FW SCSI" == "FW Diff SCSI" ?

FastWide SCSI. Fast-SCSI 40.
The PDC console reports the external box as (SE) SCSI, the other as FW SCSI.
That's the reason I call/report it this way.

> C3000 doesn't have FW Diff SCSI built-in.
> Only 50-pin SE SCSI and 68-pin LVD/SE SCSI.

As I said, there are 2 LVD SCSI drives installed internally.

> Remove the FW Diff terminator and run w/o a terminator rather than
> the wrong one.

I got the machine with 2 terminators, a SE SCSI and (obviously) a LVD SCSI.
I don't think it's a differential terminator.

> > I'm using the the 2.4 -kernel, and it says:
> >
> > "The Zalon is an interface chip that sits between the PA-RISC
> > processor and the NCR 53c720 SCSI controller on K-series PA-RISC
> > boards (these are used, among other places, on some HP 780
> > workstations).  Say Y here to make sure it gets initialized
> > correctly before the Linux kernel tries to talk to the controller."
> >
> > Well, since the C240/C3000 are 780-series machines, I wasn't so sure ...
>
> C3000 is 9000/785 ...but the 2.5 help text is much clearer.

Thanks, Max
