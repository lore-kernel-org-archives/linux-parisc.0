Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id DBF4E48A8
	for <parisc-linux@parisc-linux.org>; Mon, 15 Jul 2002 11:21:11 -0600 (MDT)
Message-Id: <200207151721.g6FHL72e024968@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] compiling kernels with gcc-3.1
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Mon, 15 Jul 2002 13:21:07 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: tausq@debian.org, joel.soete@freebel.net,
	parisc-linux@parisc-linux.org
In-Reply-To: <no.id> from "John David Anglin" at Jul 15, 2002 01:13:27 pm
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

> Is --disable-indexing used in kernel builds?  This should stop gcc
> from generating the above.

Oops, that should be "-mdisable-indexing".

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
