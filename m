Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CFA164829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 22:14:22 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17sber-0007ga-00; Sat, 21 Sep 2002 05:14:17 +0100
Date: Sat, 21 Sep 2002 05:14:17 +0100
From: Matthew Wilcox <willy@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] malloc limits
Message-ID: <20020921051417.P10583@parcelfarce.linux.theplanet.co.uk>
References: <20020920203724.GD24622@systemhalted> <200209210338.g8L3ccnN005029@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200209210338.g8L3ccnN005029@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Fri, Sep 20, 2002 at 11:38:37PM -0400
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

On Fri, Sep 20, 2002 at 11:38:37PM -0400, John David Anglin wrote:
> I thought there was a flat memory model.  If so, shouldn't it be possible
> for the data section to expand past 0x80000000?

There is a flat memory model... libs are mapped at 0x4000'0000 so that's
not it.  worth looking at /proc/$pid/maps for that process, maybe?

-- 
Revolutions do not require corporate support.
