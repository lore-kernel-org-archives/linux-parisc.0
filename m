Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 501184856
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 Aug 2002 19:12:33 -0600 (MDT)
Message-Id: <200208310112.g7V1CVbJ001369@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] 64 byte alignment
To: randolph@tausq.org
Date: Fri, 30 Aug 2002 21:12:31 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: will@misconception.org.uk, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020830235705.GD14634@tausq.org> from "Randolph Chung" at Aug 30, 2002 04:57:06 pm
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

> another good way to do this is to write what you want in C, and tell gcc
> to tell you what you want :-)

GCC aligns its stacks to 64 and 128 byte boundaries for the 32 and 64
bit ports, respectively.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
