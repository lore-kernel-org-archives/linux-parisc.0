Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A1164871
	for <parisc-linux@parisc-linux.org>; Sat, 26 Jul 2003 12:02:18 -0600 (MDT)
Date: Sat, 26 Jul 2003 14:00:32 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Generic light-weight syscall.
Message-ID: <20030726180031.GG31744@systemhalted>
References: <20030725063739.GA13017@systemhalted> <20030725113700.GH1485@parcelfarce.linux.theplanet.co.uk> <20030726174845.GF31744@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030726174845.GF31744@systemhalted>
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

> 
> If you map the page and make CPU 0 update the date, then I'll write the
> userspace interface for gettimeofday.
> 
> I'm not sure how we would do the check for 'do we see fast gettimeofday'
> but it might be that we include a magic value there and check for it?
> Other arches must have solved this.

Talked to Rik Van Riel about fast gettimeofday and he indicated that
it's not doable since you can't guarantee your process will get
scheduled on another CPU whose clock is out of sync by more than X and
get negative time. Though I imagine you were talking about having one
CPU update one page with time on it... and then other CPU's read this?
LaMont notes that there is no requirement from the PA design that CPU's
clock at _exactly_ the same frequency or have monotonically incrementing
clocks at the right rate. Could you explain the idea you have a bit
more?

c.
