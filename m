Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id 894004829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Nov 2002 12:31:37 -0700 (MST)
Reply-To: <jim_hull@hp.com>
From: "Jim Hull" <jim_hull@hp.com>
To: "'John David Anglin'" <dave@hiauly1.hia.nrc.ca>
Cc: <carlos@baldric.uwo.ca>, <parisc-linux@lists.parisc-linux.org>,
	<tausq@debian.org>
Subject: RE: [parisc-linux] glibc 2.3.1 - It's alive! - patches
Date: Tue, 12 Nov 2002 11:31:32 -0800
Message-ID: <012c01c28a82$1b5c71a0$6763f40f@cup.hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <200211121902.gACJ22tw005444@hiauly1.hia.nrc.ca>
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

> Another issue that was somewhat vague was whether the state could be
saved
> without triggering pending traps.  Page 10-13 discusses special
treatment
> of a double word store of register 0 and states that it cancels all
> pending traps.  On the otherhand, item 3 in the hit list and the
instruction
> description don't mention this treatment.

Yes, you can save state without "triggering pending traps", if what you
mean by "triggering" is that you end up at the assist exception trap
handler.

This is described in step 5 of the numbered list on p. 10-6, which
describes what happens when a delayed trap occurs.

 -- Jim
