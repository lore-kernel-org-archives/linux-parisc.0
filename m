Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 79A5B482E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Nov 2002 15:18:33 -0700 (MST)
Message-Id: <200211172154.gAHLseba018429@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.3.1 - It's alive! - patches
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Sun, 17 Nov 2002 16:54:40 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, tausq@debian.org
In-Reply-To: <20021111211624.GC9704@systemhalted> from "Carlos O'Donell" at Nov 11, 2002 04:16:24 pm
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

> testing double (without inline functions)
> Failure: Real part of: cacos (inf + NaN i) == NaN + inf i plus sign of zero/inf not specified: Exception "Invalid operation" set

It occurred to me these might be a gcc problem on PA1 machines.  These
machines don't have fneg and negation is currently implemented as the
product with -1.  This may cause invalid operation to be set if the
value is a signaling NaN.

A better way to do the negation is to toggle the sign bit but this is
inefficient as the value needs to be copied from a FPR to a GPR and
back again.

A quick check would be to run the tests with "-mpa-risc-2-0" and see
if this makes any difference.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
