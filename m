Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id B02C94829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 10 Nov 2002 18:32:25 -0700 (MST)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id gAB1WLSf004704
	for <parisc-linux@lists.parisc-linux.org>; Sun, 10 Nov 2002 20:32:21 -0500 (EST)
Message-Id: <200211110132.gAB1WK8T004703@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
To: willy@debian.org (Matthew Wilcox)
Date: Sun, 10 Nov 2002 20:32:20 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org,
	tausq@debian.org, jbailey@nisa.net
In-Reply-To: <20021111012129.A29998@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Nov 11, 2002 01:21:29 am
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

> In case anyone's wondering, the architecture specifies 32-bit, 64-bit and
> 128-bit floating point registers as being available.  My understanding is
> that no processor has actually implemented the 128-bit floating point ops
> (except maybe load and store) and they always trap to the FP emulation
> code (which we copied from HPUX).

Paul Bame was working on getting HP to release their long double library
code.  I haven't heard what the status is.  If he gets the code, then it
should be relatively straight forward to integrate into libgcc and use
the same code as for hpux.  Can glibc handle 128-bit long doubles as
that's the size long doubles will be if we get the code?

There are two tests in the libstdc++-v3 suite that fail because of this.
However, there can't be much in the way of real world code that actually
uses long doubles.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
