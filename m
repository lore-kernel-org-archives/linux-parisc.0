Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9C79D4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Sep 2002 13:59:34 -0600 (MDT)
Message-Id: <200209041959.g84JxRRH011794@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] GCC and quad-precision floating point
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Wed, 4 Sep 2002 15:59:27 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, grundler@dsl2.external.hp.com,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020904191517.GB6702@systemhalted> from "Carlos O'Donell" at Sep 4, 2002 03:15:17 pm
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

> Randolph and I were discussing borrowing from gmp to implement some of 
> these for the earlier 32-bit processors. Thought it seems that this may
> break the HPUX compatibility? 

I would guess that that the best compatibility would be obtained with
the HP functions.  As far as I can tell, gmp does not use IEEE standard
data types.  Thus, concepts of nans, snans, unordered if present at
all in gmp would differ.

GCC can only deal with floating data in IEEE format.  So, conversion
would have to be done for all operations.

I presume that the HPUX compatibility is just for static binaries
(i.e., there is no shared library support).  In this case, the routines
would be compiled into hpux binaries.  So, I don't think much additional
would be needed at an os level.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
