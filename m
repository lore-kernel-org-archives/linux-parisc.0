Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id CCADB48D7
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Mar 2003 11:23:30 -0700 (MST)
Message-Id: <200303201823.h2KINN1w007420@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Thu, 20 Mar 2003 13:23:23 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jsoe0708@tiscali.be, tausq@debian.org, b.gunreben@web.de,
	willy@debian.org, doko@cs.tu-berlin.de, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org, parisc-linux@lists.parisc-linux.org,
	kuznet@ms2.inr.ac.ru, linux-net@vger.kernel.org
In-Reply-To: <200303201813.h2KIDn3P007214@hiauly1.hia.nrc.ca> from "John David Anglin" at Mar 20, 2003 01:13:49 pm
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

> No, don't do that.  SIG_DFL, SIG_IGN and SIG_ERR expand to compound
> literals.

Sorry, that part is wrong.  Anyway, just leave the macro defines as
is and cast them where used to void *.  This causes the conversion
of the other operand to void * and function pointer conicalization
won't be done (6.5.9, paragraph 5).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
