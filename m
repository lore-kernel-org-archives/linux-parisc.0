Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.goquest.com (ns1.goquest.com [12.18.108.6])
	by dsl2.external.hp.com (Postfix) with SMTP id 8E9CF482E
	for <parisc-linux@parisc-linux.org>; Sun, 27 Jul 2003 14:47:10 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@goquest.com>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Generic light-weight syscall.
Date: Sun, 27 Jul 2003 15:43:11 -0500
References: <20030725063739.GA13017@systemhalted> <20030726174845.GF31744@systemhalted> <20030726180031.GG31744@systemhalted>
In-Reply-To: <20030726180031.GG31744@systemhalted>
MIME-Version: 1.0
Message-Id: <03072715431101.00932@wolf686>
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

On Saturday 26 July 2003 01:00 pm, Carlos O'Donell wrote:
> > If you map the page and make CPU 0 update the date, then I'll write the
> > userspace interface for gettimeofday.
> >
> > I'm not sure how we would do the check for 'do we see fast gettimeofday'
> > but it might be that we include a magic value there and check for it?
> > Other arches must have solved this.
>
> Talked to Rik Van Riel about fast gettimeofday and he indicated that
> it's not doable since you can't guarantee your process will get
> scheduled on another CPU whose clock is out of sync by more than X and
> get negative time. Though I imagine you were talking about having one
> CPU update one page with time on it... and then other CPU's read this?
> LaMont notes that there is no requirement from the PA design that CPU's
> clock at _exactly_ the same frequency or have monotonically incrementing
> clocks at the right rate. Could you explain the idea you have a bit
> more?
Note - some multiple cpu hardware intentionally clocks the cpu's at
slightly different rates to limit RFI generation.
Not sure if any HP-PARISC machines do such clocking.
Mike
