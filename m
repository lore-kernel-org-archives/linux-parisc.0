Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 29 Jul 2003 19:38:16 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Matthew Wilcox <willy@debian.org>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Generic light-weight syscall.
Message-ID: <20030729233816.GC17107@systemhalted>
References: <20030726174845.GF31744@systemhalted> <20030726180031.GG31744@systemhalted> <20030727122745.GC16753@dsl2.external.hp.com> <20030728155703.GA32553@systemhalted> <20030728174551.GC3840@parcelfarce.linux.theplanet.co.uk> <20030728190455.GE32553@systemhalted> <20030728191420.GE3840@parcelfarce.linux.theplanet.co.uk> <20030728211012.GC6706@sleepie.demon.co.uk> <20030729175057.GA17107@systemhalted> <20030729210609.GK6706@sleepie.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030729210609.GK6706@sleepie.demon.co.uk>
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

> Depends what people want to use it for.  I couldn't use it to time how
> long some syscall took, for example.  But if we zap the microseconds
> part on smp anyway, that's irrelevant.

useconds gets zapped in gettimeofday on SMP systems. I'm working on
trying to fix this :)

c.
