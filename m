Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 71E9C4840
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 Oct 2003 09:21:00 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A6XAN-00015E-88; Mon, 06 Oct 2003 16:20:55 +0100
Date: Mon, 6 Oct 2003 16:20:55 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Padgett, Pat M [NTWK SVCS]" <PatPadgett@NMCC.SprintSpectrum.com>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux]  HP FC A3591 aka Mombasa GS -- or A6684A?
Message-ID: <20031006152055.GZ24824@parcelfarce.linux.theplanet.co.uk>
References: <1289146742B56546AE580DFC6B711A8301B1AF99@PKDWB07C.ad.sprint.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1289146742B56546AE580DFC6B711A8301B1AF99@PKDWB07C.ad.sprint.com>
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

On Mon, Oct 06, 2003 at 09:38:42AM -0500, Padgett, Pat M [NTWK SVCS] wrote:
> Good morning,
> 
> Does anyone know if the replacement for the A3591B is supported?
> 
> The replacement card is the A6684A HSC Tachlite card.

I think this is much more likely to work ... do you happen to know whether
it's a native GSC card or whether it has a Dino bridge on it?  Dino is
a biggish HP chip labelled 1FC3-0004, probably close to the GSC connector.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
