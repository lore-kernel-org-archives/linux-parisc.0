Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 30 Jul 2003 18:37:53 +0200
From: Thibaut VARENE <varenet@esiee.fr>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	Matthew Wilcox <willy@debian.org>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Generic light-weight syscall.
Message-Id: <20030730183753.72bf106c.varenet@esiee.fr>
In-Reply-To: <20030729233624.GB17107@systemhalted>
References: <20030726174845.GF31744@systemhalted>
	<20030726180031.GG31744@systemhalted>
	<20030727122745.GC16753@dsl2.external.hp.com>
	<20030728155703.GA32553@systemhalted>
	<20030728174551.GC3840@parcelfarce.linux.theplanet.co.uk>
	<20030728190455.GE32553@systemhalted>
	<20030728191420.GE3840@parcelfarce.linux.theplanet.co.uk>
	<20030728211012.GC6706@sleepie.demon.co.uk>
	<20030729175057.GA17107@systemhalted>
	<20030729210609.GK6706@sleepie.demon.co.uk>
	<20030729233624.GB17107@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 29 Jul 2003 19:36:25 -0400
Carlos O'Donell <carlos@baldric.uwo.ca> wrote:


> To add a datapoint to #2, on a PA8700 650Mhz I see:
> Anyone wishing to run this test on another box, please do...

A500-5X (PA8600@550Mhz):

cr26=4294934527
cr16a=4175244475
cr16b=4175244488
diff=13
avg_diff=12993.000000
Average ticks per back/back cr16 read (1000 loops) = 12.993000

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
