Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6F258486E
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Jul 2002 16:50:30 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17PWTa-00086R-00; Tue, 02 Jul 2002 23:50:26 +0100
Date: Tue, 2 Jul 2002 23:50:26 +0100
From: Matthew Wilcox <willy@debian.org>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: Matthew Wilcox <willy@debian.org>,
	Grant Grundler <grundler@dsl2.external.hp.com>,
	Ryan Bradetich <rbradetich@uswest.net>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Problem find devices on the E55 I/O interfaces
Message-ID: <20020702235026.H27706@parcelfarce.linux.theplanet.co.uk>
References: <3D1A377A.E0CFABBD@gmx.at> <1025579851.956.469.camel@beavis> <3D22101D.74982658@gmx.at> <christoph.plattner@gmx.at> <20020702212501.84BD14861@dsl2.external.hp.com> <20020702225559.G27706@parcelfarce.linux.theplanet.co.uk> <3D2228AD.DC192B3B@gmx.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D2228AD.DC192B3B@gmx.at>; from christoph.plattner@gmx.at on Wed, Jul 03, 2002 at 12:26:53AM +0200
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

On Wed, Jul 03, 2002 at 12:26:53AM +0200, Christoph Plattner wrote:
> So, the devices below may be the HP-PB bus, as you mentioned.
> The resulting question: is this HP-PB bus now transperent ?
> Why are the devices not found ?
> 
> The point confusing me, is that the PDC boot monitor can display the
> hardware paths below the "56", but Linux calling PDC calls cannot see
> those devices, independent, if the device type is really know or only
> found as unknown.

Ah!  Now I understand why you were so confused ;-)

Yes, PDC tells us about some devices, but not all.  We have to walk
the native busses to find the remaining devices.  What's a native bus?
Uhh.. can't remember, ask grant.  The central bus will be native and
I'm sure GSC is also native.  I believe HP-PB must be native too, since
I seem to remember rbrad finding more devices once he walked the HP-PB
busses on his K class.

-- 
Revolutions do not require corporate support.
