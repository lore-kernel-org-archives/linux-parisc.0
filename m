Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 89A954829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Sep 2002 08:58:57 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17tr9L-0007eG-00; Tue, 24 Sep 2002 15:58:55 +0100
Date: Tue, 24 Sep 2002 15:58:55 +0100
From: Matthew Wilcox <willy@debian.org>
To: Arto Jantunen <viiru@debian.org>
Cc: Matthew Wilcox <willy@debian.org>,
	Jeremy Drake <jeremyd@apptechsys.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP problems
Message-ID: <20020924155855.I27458@parcelfarce.linux.theplanet.co.uk>
References: <20020924060541.GA27852@dt-link.fi> <Pine.LNX.4.44.0209240141510.20374-100000@garibaldi.apptechsys.com> <20020924112830.GA27877@dt-link.fi> <20020924132934.F27458@parcelfarce.linux.theplanet.co.uk> <87fzvzphpl.fsf@welho.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87fzvzphpl.fsf@welho.com>; from viiru@debian.org on Tue, Sep 24, 2002 at 05:47:50PM +0300
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

On Tue, Sep 24, 2002 at 05:47:50PM +0300, Arto Jantunen wrote:
> Is that the so called remote admin card you told me to remove?-) If it

That's the one...

> is, no I don't have it in there because I was told to remove it. Will
> putting it back actually fix problems? Will it cause problems? It did
> before. Where should I connect my console after putting it back in?

Let's leave it out for the moment -- fewer variables the better.  If you
build a serial console kernel and you're not getting any output before
the machine hangs, it's time to break out the PDC console debugger.
Edit arch/parisc/kernel/pdc_cons.c and change #undef EARLY_BOOTUP_DEBUG
to #define EARLY_BOOTUP_DEBUG.  Let us know how you get on with that.

-- 
Revolutions do not require corporate support.
