Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id ABCD148C7
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 21 Feb 2004 20:23:59 -0700 (MST)
Date: Sat, 21 Feb 2004 20:23:58 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Subject: Re: [parisc-linux] b2k scsi disk pb
Message-ID: <20040222032358.GC30849@colo.lackof.org>
References: <402A4CA500006E8D@ocpmta2.freegates.net>
	<Pine.LNX.4.58.0402201900540.26386@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.58.0402201900540.26386@sal.ucc.ie>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Feb 20, 2004 at 07:07:19PM +0000, M. Grabert wrote:
> 
> > sym0:5:0: ABORT operation timed-out.
> > sym0:5:0: DEVICE RESET operation started.
> > sym0:5:0: DEVICE RESET operation timed-out.
> > sym0:5:0: BUS RESET operation started.
> > sym0: SCSI BUS reset detected.
> > sym0: SCSI BUS has been reset.
> > sym0:5:0: BUS RESET operation complete.
> >
> > and during this time the system naturaly hang.

The "hang" is because no IO's are processed until 3 seconds
after the BUS RESET is issued.

> Got rid of it by not using the SE-SCSI driver ;)
> Try to physically detach the (not-used) ST336704LC.

I was pretty sure "LC" suffix meant LVD with SCA 80 pin connector.
Specs on seagate.com are easy to find if you know the model.

If both internal devices are LVD, check early sym2 dmesg output
to verify the SCSI bus is operating in LVD mode (vs SE).

grant
