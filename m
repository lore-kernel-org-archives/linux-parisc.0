Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id D01A04866
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Nov 2003 22:35:33 -0700 (MST)
Date: Fri, 21 Nov 2003 22:35:32 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: JjDunnjr@aol.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Boot-up challenges on a 715/75
Message-ID: <20031122053532.GC29917@colo.lackof.org>
References: <171.26ba943e.2cefd34e@aol.com> <20031122045731.GA29917@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031122045731.GA29917@colo.lackof.org>
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

On Fri, Nov 21, 2003 at 09:57:31PM -0700, Grant Grundler wrote:
> > 2. It spun the disk upon issuing the "bo P2" command, however, i still got 
> > the
> > ENTRY_INIT =-4 message
> 
> The PA I/O Architecture Control Document (aka IO ACD) describes the 
> ENTRY_INIT returns codes. See "Documentation" on www.parisc-linux.org.

sorry - it's called "iodc.pdf" on
	http://www.parisc-linux.org/documentation/index.html

-4	Unrecoverable hardware error
	A hardware error on the module or device prevented the call
	from completing correctly.
	CONDITIONAL. Must be used if hardware errors are isolated.

Sounds like either a problem with the CD or the CD-ROM drive.

grant
