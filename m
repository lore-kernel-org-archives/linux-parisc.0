Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 50DD64829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Sep 2002 06:29:38 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17tooo-0004e4-00; Tue, 24 Sep 2002 13:29:34 +0100
Date: Tue, 24 Sep 2002 13:29:34 +0100
From: Matthew Wilcox <willy@debian.org>
To: Arto Jantunen <viiru@debian.org>
Cc: Jeremy Drake <jeremyd@apptechsys.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP problems
Message-ID: <20020924132934.F27458@parcelfarce.linux.theplanet.co.uk>
References: <20020924060541.GA27852@dt-link.fi> <Pine.LNX.4.44.0209240141510.20374-100000@garibaldi.apptechsys.com> <20020924112830.GA27877@dt-link.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020924112830.GA27877@dt-link.fi>; from viiru@debian.org on Tue, Sep 24, 2002 at 02:28:30PM +0300
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

On Tue, Sep 24, 2002 at 02:28:30PM +0300, Arto Jantunen wrote:
> I have a HP9000/D390. Dual PA-8200. It doesn't boot at all with that
> kernel or any other 64-bit kernel. Some things do suggest that it should
> work, but it doesn't. After the kernel branching point it starts
> scrolling FLT codes on the LCD display, but doesn't report anything on
> the console. I have a ser pim output taken out after rebooting the box
> if someone is interrested. I'll try building the latest CVS with 32-bit
> and SMP and see if it's any better then the ones I have tried so far.

Do you have the CAP/MUX card installed?  (the card with the other serial
port on it)  If so, you should enable "Serial MUX support" and make
sure to use console=ttyB0 on the command line (ie pretend you have a K
class machine).

-- 
Revolutions do not require corporate support.
