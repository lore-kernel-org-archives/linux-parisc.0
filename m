Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 28496482A
	for <parisc-linux@parisc-linux.org>; Thu, 17 Jan 2002 20:48:32 -0700 (MST)
Message-Id: <200201180320.g0I3K5ko003382@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] long double
To: willy@debian.org (Matthew Wilcox)
Date: Thu, 17 Jan 2002 22:20:05 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20020118003542.F9221@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Jan 18, 2002 00:35:42 am
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

> gcc currently thinks that `long double' is 64-bits (the same size
> as double).  This is perfectly legitimate, but...

This is only hppa64.  Clearly, this should be 128 bits.  However,
somebody needs to work out the ABI issues and provide a patch to
gcc to support 128 bit long doubles.  At the moment, hppa64 doesn't
even build on the gcc main branch.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
