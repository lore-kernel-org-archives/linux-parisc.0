Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 10FA64829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Nov 2002 11:56:18 -0700 (MST)
Message-Id: <200211261856.gAQIuAUO022318@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: uaccess ya patch
To: randolph@tausq.org
Date: Tue, 26 Nov 2002 13:56:10 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jsoe0708@tiscali.be, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021126184455.GK19331@tausq.org> from "Randolph Chung" at Nov 26, 2002 10:44:55 am
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

> i guess if a 64-bit number is always passed in a way that we can access
> the first half as %1 and the second half as %1R then we can do away with
> the masking.... 

That should be %R1.  The form %1R is what you might use to select the
right half of a floating point register.  In this, the R is just a
regular character.  When the R follows the % character, it is an
operand modifier.

GCC always uses consecutive registers for objects larger than a word,
at least in the initial rtl generation.  It is possible to split large
modes after reload for better register utilization but we don't
currently do it on the PA.

I have been working in the last few days on improving support for
non-consecutive groups of registers.  At the moment, they are just
used for function arguments and return values.  The hppa64 port
currently returns incorrectly justified small structures and we need
some enhancement to the current register group support to fix this..

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
