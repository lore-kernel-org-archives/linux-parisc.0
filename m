Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E45CE48BE
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 16 Dec 2003 18:46:34 -0700 (MST)
Message-Id: <200312170146.hBH1kXO5012084@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Question about cache flushing and fork
To: lamont@debian.org (LaMont Jones)
Date: Tue, 16 Dec 2003 20:46:32 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20031217011643.GH25535@mmjgroup.com> from "LaMont Jones" at Dec
	16, 2003 06:16:43 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@steeleye.com, randolph@tausq.org,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> OK.  Note also that the sp is supposed to always be 64-byte aligned...

That's not correct for 64 bits.  See page 15 of the "64-Bit Runtime
Architecture for PA-RISIC 2.0, Version 3.3".  The alignment specified
is 16 bytes.  This is also the case for the HP compilers that I have.
Thus, you can't assume that a stack frame starts at the beginning of
a cacheline in the 64-bit runtime.

Regarding the frame marker, there is a discrepancy between the size
of the frame marker mentioned in this document and that which HP
compilers generate (16 versus 48 bytes).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
