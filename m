Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id A5E75482C
	for <parisc-linux@parisc-linux.org>; Tue, 31 Dec 2002 14:50:13 -0700 (MST)
Message-Id: <200212312150.gBVLo5Up007500@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] misaligned data
To: grundler@dsl2.external.hp.com (Grant Grundler)
Date: Tue, 31 Dec 2002 16:50:05 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20021230071541.GI30857@dsl2.external.hp.com> from "Grant Grundler" at Dec 30, 2002 00:15:41 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> > I'd wonder more about the packed attribute on sctp_init_chunk_t and
> > sctp_inithdr_t.
> 
> I think that's the problem.

I am not aware of any specific code in the backend related to the
handling of packed structures.  So, this is likely a generic problem,
maybe on big endian machines.

> > What version of gcc?
> 
> In reflecting on it a bit more, I'm pretty sure I tried gcc-3.2
> and came to the same result.
> ("gcc version 3.2.2 20021212 (Debian prerelease)")

There are some fixes in the passing of small structs in 3.3 (less
than 8 bytes).  This affects varargs and library functions that
pass small structs by value.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
