Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 42DB4482A
	for <parisc-linux@parisc-linux.org>; Sat, 30 Mar 2002 14:56:52 -0700 (MST)
Message-Id: <200203302156.g2ULunaP028620@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Fwd: Re: Any hppa gurus?
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Sat, 30 Mar 2002 16:56:49 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@parisc-linux.org,
	will@misconception.org.uk
In-Reply-To: <200203302132.g2ULWNcp028559@hiauly1.hia.nrc.ca> from "John David Anglin" at Mar 30, 2002 04:32:23 pm
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

> You've got the order of the float registers reversed.  They are allocated
> in order of increasing number starting with fr4.

I should add that the numbering of the floating registers depends on
processor variant.  PA 1.0 had 16 floating registers holding word or
double word values.  PA 1.1 has 32 floating registers and each half
are separately addressable.  See pa32-regs.h for more details.  The
ABI was designed for the base 1.0 processor.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
