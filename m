Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 29 Jul 2003 22:06:09 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: Matthew Wilcox <willy@debian.org>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Generic light-weight syscall.
Message-ID: <20030729210609.GK6706@sleepie.demon.co.uk>
References: <20030725113700.GH1485@parcelfarce.linux.theplanet.co.uk> <20030726174845.GF31744@systemhalted> <20030726180031.GG31744@systemhalted> <20030727122745.GC16753@dsl2.external.hp.com> <20030728155703.GA32553@systemhalted> <20030728174551.GC3840@parcelfarce.linux.theplanet.co.uk> <20030728190455.GE32553@systemhalted> <20030728191420.GE3840@parcelfarce.linux.theplanet.co.uk> <20030728211012.GC6706@sleepie.demon.co.uk> <20030729175057.GA17107@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030729175057.GA17107@systemhalted>
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

On Tue, Jul 29, 2003 at 01:50:58PM -0400, Carlos O'Donell wrote:
> > > We discussed this in the Black Thorn ... record what value you last
> > > returned to the user and never return less than that.
> > 
> > Not very nice if the difference between CPUs is significant.  You could
> > find yourself checking time on CPU A, doing some work, getting moved to
> > CPU B, checking time, and finding you apparently did all that in 0ns.
> 
> Willy and myself talked about this, you just return 1ns in the case
> where you know that _something_ must have taken _some_ amount of time
> (e.g. the insns that make up fast gettimeofday) so you couldn't have done
> it in zero time :)

Depends what people want to use it for.  I couldn't use it to time how
long some syscall took, for example.  But if we zap the microseconds
part on smp anyway, that's irrelevant.

Richard
