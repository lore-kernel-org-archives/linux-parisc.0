Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 920AD483E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 19 Oct 2003 17:16:06 -0600 (MDT)
Message-Id: <200310192316.h9JNG3At027825@hiauly1.hia.nrc.ca>
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Sun, 19 Oct 2003 19:16:03 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20031019215130.GG8642@systemhalted> from "Carlos O'Donell" at Oct 19, 2003 05:51:30 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: HPPA FPU Specification? (FE_INEXACT raised by accident)
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

> I've noticed that I cannot generate an underflow or overflow exception
> without also forcing an inexact exception on my PA 2.0 system. Are you
> familiar with this behaviour at all? I'm trying to straighten our fenv
> setup, and this is really the last crinkle.

I suggest looking at page 10-7.  It describes the PA 2.0 behavior
for this situation.  I'm not an IEEE so I don't know offhand what it
mandates.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
