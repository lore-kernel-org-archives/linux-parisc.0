Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F0254851
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Jun 2002 10:29:54 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17MtCQ-0004cT-00; Tue, 25 Jun 2002 17:29:50 +0100
Date: Tue, 25 Jun 2002 17:29:50 +0100
From: Matthew Wilcox <willy@debian.org>
To: Jes Sorensen <jes@trained-monkey.org>
Cc: Randolph Chung <tausq@debian.org>,
	Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sys/io.h
Message-ID: <20020625172950.B32282@parcelfarce.linux.theplanet.co.uk>
References: <20020624150031.4DA034837@dsl2.external.hp.com> <20020624153959.GH812@tausq.org> <m3fzzbmiw8.fsf@trained-monkey.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <m3fzzbmiw8.fsf@trained-monkey.org>; from jes@trained-monkey.org on Tue, Jun 25, 2002 at 12:18:31PM -0400
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

On Tue, Jun 25, 2002 at 12:18:31PM -0400, Jes Sorensen wrote:
> You really should support it similar to what we do on
> ia64. Ie. there's a Linux API here that allows you to map 'I/O' ports
> and access them. Basing the code on what's in the ia64 glibc tree
> would make it quite easy to get it up and running.

Um, we can't.  To do a port space access on Dino is:

acquire spin lock
write address to register
perform read or write access to a different register
release spin lock

i do hope you're not about to suggest emulating the proposed interface
by unmapping an address range and handling this in the fault handler

-- 
Revolutions do not require corporate support.
