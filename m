Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE01A485F
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Jun 2002 11:04:36 -0600 (MDT)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g5DH4AFN002073
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Jun 2002 13:04:11 -0400 (EDT)
Message-Id: <200206131704.g5DH49TT002072@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Glibc cvs: ld segmentation fault
To: joel.soete@freebel.net
Date: Thu, 13 Jun 2002 13:04:09 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <1023962027.3d086babb213a@webmail.tiscalinet.be> from "joel.soete@freebel.net" at Jun 13, 2002 11:53:47 am
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

> Don't you have additional advice?

Did you start with the debian version of glibc?  I have built 2.2.5-6
with 3.2 and am using it.  It's possible you need to update binutils.
Some linux versions also seem to have a tendency to cause random
segfaults.

Since I don't think I can duplicate your environment, you will have
to run ld under gdb to find out where it's segfaulting and get some
sense as to what's causing the problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
