Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C3536482A
	for <parisc-linux@parisc-linux.org>; Tue, 30 Jul 2002 13:40:08 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17Zcql-0006gp-00; Tue, 30 Jul 2002 20:40:07 +0100
Date: Tue, 30 Jul 2002 20:40:07 +0100
From: Matthew Wilcox <willy@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] GCC CVS strange update?
Message-ID: <20020730204007.E3317@parcelfarce.linux.theplanet.co.uk>
References: <20020730073009.N1441@parcelfarce.linux.theplanet.co.uk> <200207301533.g6UFXLge019647@hiauly1.hia.nrc.ca> <20020730192041.GD6502@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020730192041.GD6502@systemhalted>; from carlos@baldric.uwo.ca on Tue, Jul 30, 2002 at 03:20:41PM -0400
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

On Tue, Jul 30, 2002 at 03:20:41PM -0400, Carlos O'Donell wrote:
> > 
> > 3.1.1 has just been released.  3.2 will be released in the near future
> > and it will be identical to 3.1.1 except for the updates to the c++
> > ABI.  The 3.1 branch is now dead.  Regression fixing will continue
> > on the 3.2 branch after the first release.  The update to the 3.1
> > branch was made to accomodate the schedule of other projects (e.g.,
> > OpenOffice).  Since dwarf2 exception support isn't in 3.2, I doubt
> > this will affect hppa-linux much.
> 
> dwarf2 exception support isn't in 3.2 for hppa?
> I'm confused, I believed that dwarf2 exception support wasn't
> goin to be in 3.1, but surely in 3.2? 

The renumbering has confused everyone (as I rather thought it might).
Old plan:	New:

3.1		3.1
3.1.1		3.1.1
3.1.2		3.2
3.2		3.3

So everything which used to read `this will be in gcc 3.2' should now read
`this will be in gcc 3.3'.  And everything which was `not in 3.1' is now
`not in 3.1 or 3.2 either'.

-- 
Revolutions do not require corporate support.
