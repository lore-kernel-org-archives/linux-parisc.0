Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0D3484878
	for <parisc-linux@lists.parisc-linux.org>; Thu, 10 Jul 2003 05:28:33 -0600 (MDT)
Date: Thu, 10 Jul 2003 12:28:26 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Matthew Wilcox <willy@debian.org>
Cc: Joel Soete <jsoe0708@tiscali.be>,
	"Carlos O'Donell" <carlos@baldric.uwo.ca>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C3000 SCSI config, was Re: linux grundler
In-Reply-To: <20030710112637.GD1939@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.44.0307101227480.6826-100000@sal.ucc.ie>
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

On Thu, 10 Jul 2003, Matthew Wilcox wrote:

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
> OK, I'll just copy the 2.5 helptext into 2.4 then.  It wouldn't have
> confused you, right?

True ;)

Thanks, Max
