Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sisko.scot.redhat.com (82-41-9-220.cable.ubr02.edin.blueyonder.co.uk [82.41.9.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3384E483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 05:58:02 -0600 (MDT)
Subject: Re: [parisc-linux] Fwd:  Problems with raw interface.
From: "Stephen C. Tweedie" <sct@redhat.com>
To: "David S. Miller" <davem@redhat.com>
Cc: Matthew Wilcox <willy@debian.org>, santosh.abraham@hp.com,
	randolph@tausq.org, parisc-linux@lists.parisc-linux.org,
	Stephen Tweedie <sct@redhat.com>
In-Reply-To: <20030926042029.1cdd77e9.davem@redhat.com>
References: <20030925105005.GX16872@tausq.org>
	 <000801c38356$dea5cda0$e5624c0f@india.hp.com>
	 <20030925142623.GO13172@parcelfarce.linux.theplanet.co.uk>
	 <20030925180848.2763911b.davem@redhat.com>
	 <20030926112400.GA24824@parcelfarce.linux.theplanet.co.uk>
	 <20030926042029.1cdd77e9.davem@redhat.com>
Content-Type: text/plain
Message-Id: <1064577420.4227.0.camel@sisko.scot.redhat.com>
Mime-Version: 1.0
Date: 26 Sep 2003 12:57:01 +0100
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

On Fri, 2003-09-26 at 12:20, David S. Miller wrote:

> Are you sure?  Isn't raw I/O allowed on user buffers backed by
> some kind of file based mmap()?

Yes, it is.

--Stephen
