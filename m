Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from posti.pp.htv.fi (posti.pp.htv.fi [212.90.64.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id 93D5D4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Sep 2002 08:48:44 -0600 (MDT)
From: Arto Jantunen <viiru@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: Jeremy Drake <jeremyd@apptechsys.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP problems
References: <20020924060541.GA27852@dt-link.fi>
	<Pine.LNX.4.44.0209240141510.20374-100000@garibaldi.apptechsys.com>
	<20020924112830.GA27877@dt-link.fi>
	<20020924132934.F27458@parcelfarce.linux.theplanet.co.uk>
Date: 24 Sep 2002 17:47:50 +0300
In-Reply-To: <20020924132934.F27458@parcelfarce.linux.theplanet.co.uk>
Message-ID: <87fzvzphpl.fsf@welho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Matthew Wilcox <willy@debian.org> writes:

> On Tue, Sep 24, 2002 at 02:28:30PM +0300, Arto Jantunen wrote:
> > I have a HP9000/D390. Dual PA-8200. It doesn't boot at all with that
> > kernel or any other 64-bit kernel. Some things do suggest that it should
> > work, but it doesn't. After the kernel branching point it starts
> > scrolling FLT codes on the LCD display, but doesn't report anything on
> > the console. I have a ser pim output taken out after rebooting the box
> > if someone is interrested. I'll try building the latest CVS with 32-bit
> > and SMP and see if it's any better then the ones I have tried so far.
> 
> Do you have the CAP/MUX card installed?  (the card with the other serial
> port on it)  If so, you should enable "Serial MUX support" and make
> sure to use console=ttyB0 on the command line (ie pretend you have a K
> class machine).

Is that the so called remote admin card you told me to remove?-) If it
is, no I don't have it in there because I was told to remove it. Will
putting it back actually fix problems? Will it cause problems? It did
before. Where should I connect my console after putting it back in?

-- 
Arto Jantunen
