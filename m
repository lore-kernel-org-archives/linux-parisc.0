Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5E3744872
	for <parisc-linux@parisc-linux.org>; Mon, 25 Aug 2003 06:13:34 -0600 (MDT)
Date: Mon, 25 Aug 2003 14:13:28 +0200
Message-ID: <3F2E2C7700004F23@ocpmta2.freegates.net>
In-Reply-To: <20030823142159.GM18834@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] CVS mixups
To: "Matthew Wilcox" <willy@debian.org>,
	parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>So... for the second time I messed up and committed 2.6 to the 2.4 tree.

Thanks for advise.

I just update this Monday morning and just notice that last Carlos's patch
(itlb_fault optmizaztion) were reverted (also). Accident? (one step beyond
:) )

>In my defence, this time we were trying the new style of imports so it's
>not too surprising I got something wrong (and nobody spotted the problem
>till too late...), but twice is too many.

[In french we say "never twice without thrice" ( :-) )]

>Short term fix: I'm going to merge the latest marcelo patch into our
>2.4 tree today.  Looks like that'll be 2.4.22-rc2.  That'll fix this
>cvs diff autogeneration breakage.

Cool (i am awaiting this for a long time :) )

>Long term fix: I'm going to rename the linux tree to linux-2.4.  This will
>cause some disruption since everyone with a cvs tree checked out will have
>to mangle it to work again.  I'll make a script available in build-tools
>to mangle your tree for you.

Thanks again,
    Joel

-------------------------------------------------------------------------
Tiscali ADSL, seulement 35 eur/mois et le modem est inclus...abonnez-vous!
http://reg.tiscali.be/default.asp?lg=fr 
