Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sisko.scot.redhat.com (82-41-9-220.cable.ubr02.edin.blueyonder.co.uk [82.41.9.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 60363483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 08:46:17 -0600 (MDT)
Subject: Re: [parisc-linux] Fwd:  Problems with raw interface.
From: "Stephen C. Tweedie" <sct@redhat.com>
To: "David S. Miller" <davem@redhat.com>
Cc: Matthew Wilcox <willy@debian.org>, santosha@india.hp.com,
	santosh.abraham@hp.com, randolph@tausq.org,
	parisc-linux@lists.parisc-linux.org, Stephen Tweedie <sct@redhat.com>
In-Reply-To: <20030926072059.0447b074.davem@redhat.com>
References: <20030926053805.63bda07a.davem@redhat.com>
	 <200309261311.SAA27414@redsea.india.hp.com>
	 <20030926055652.32ddbbc2.davem@redhat.com>
	 <20030926132901.GJ24824@parcelfarce.linux.theplanet.co.uk>
	 <20030926062143.20d85a72.davem@redhat.com>
	 <20030926140948.GK24824@parcelfarce.linux.theplanet.co.uk>
	 <20030926070450.603c5c33.davem@redhat.com>
	 <20030926143052.GL24824@parcelfarce.linux.theplanet.co.uk>
	 <20030926072059.0447b074.davem@redhat.com>
Content-Type: text/plain
Message-Id: <1064587327.4227.175.camel@sisko.scot.redhat.com>
Mime-Version: 1.0
Date: 26 Sep 2003 15:42:07 +0100
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

Hi,

On Fri, 2003-09-26 at 15:20, David S. Miller wrote:

> Any page can be mremap()'d to any other address.

Yep.  At least this case is rare, and you can optimise for the simple
case by checking page->count.  But the general case really does need to
be covered if you're going to be fully correct for all cases.

And with O_DIRECT being an unprivileged operation, users have the
ability to expose this problem quite easily.

Cheers,
 Stephen
