Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel13.hp.com (palrel13.hp.com [156.153.255.238])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4CE6B4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 11:43:52 -0700 (MST)
Reply-To: <jim_hull@hp.com>
From: "Jim Hull" <jim_hull@hp.com>
To: "'John David Anglin'" <dave@hiauly1.hia.nrc.ca>
Cc: <carlos@baldric.uwo.ca>, <parisc-linux@lists.parisc-linux.org>,
	<tausq@debian.org>
Subject: RE: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Date: Tue, 12 Nov 2002 10:43:43 -0800
Message-ID: <012101c28a7b$6d84b7a0$6763f40f@cup.hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <200211121753.gACHroK0005228@hiauly1.hia.nrc.ca>
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

Dave:

> What about "The current instruction is a load or store of the
destination
> register of a pending trapping instruction or an operation which
depends
> on a pending trapping instruction"?
> 
> I think the latter part of the sentence would apply to a fcpy of the
> destination register of a pending trapping instruction.

I thought that might be the item you were thinking of.  Sometimes, in
our effort to be as concise as possible, we went too far in the PA-RISC
book.

The correct interpretation of that sentence is:

  The current instruction is a load or store of the destination register
  of a pending trapping instruction,

  or

  the current instruction is a load or store of the destination register
  of an operation which depends on a pending trapping instruction.

In other words, it must be a load or store of a destination register,
either of the pending trapping instruction itself, or of any subsequent
instruction which depends on that pending trapping instruction.

Hope this helps.

 -- Jim
