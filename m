Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 37B6B48C0
	for <parisc-linux@parisc-linux.org>; Tue, 16 Jul 2002 11:01:17 -0600 (MDT)
Message-Id: <200207161701.g6GH1D03023385@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-3.[02] alignment problem
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Tue, 16 Jul 2002 13:01:13 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, parisc-linux@parisc-linux.org,
	gcc@gcc.gnu.org
In-Reply-To: <no.id> from "John David Anglin" at Jul 16, 2002 12:55:59 pm
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

> These messages are coming from the assembler (remove "-pipe").  The
> first is from "std %r4,44(%r3)".  The offset "44" is not correct for
> a store double.  This is probably a problem with pointer arithmetic
> in the source.

Check the definition of RTA_ALIGNTO in linux/rtnetlink.h.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
