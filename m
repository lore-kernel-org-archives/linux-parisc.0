Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id BC1F54829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 05:59:53 -0700 (MST)
Date: Fri, 10 Jan 2003 13:52:16 +0100
To: jsoe0708@tiscali.be
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] unaligned accesses
Message-ID: <20030110125216.GA3358@esiee.fr>
References: <20030110073659.GC31470@tausq.org> <3E1AA8D500000877@ocpmta8.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E1AA8D500000877@ocpmta8.freegates.net>
From: m.delahaye@esiee.fr (Matthieu Delahaye)
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

> >
> well I will try to find back the example I encounter (somewhere in jfs-1.0.23
> IIRC)
> 
> Cheers,
>     Joel

I remind a word access on a table of char at an odd index. Thought it
was reiserFS code.

Matthieu
