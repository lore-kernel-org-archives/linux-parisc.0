Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id B99654835
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Jun 2002 08:58:20 -0600 (MDT)
Message-Id: <200206271458.g5REw9Tr015373@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-3.2 failed to compile kernel
To: joel.soete@freebel.net
Date: Thu, 27 Jun 2002 10:58:08 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@dsl2.external.hp.com,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <1025159126.3d1aafd6bb544@webmail.tiscalinet.be> from "joel.soete@freebel.net" at Jun 27, 2002 08:25:26 am
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

> Oops,  gcc -E ... works well and give the expect results (if I do a link
> 1->linux) but gcc -dM -E ... SegFault :((
> 
> # gcc -dM -E -D__ASSEMBLY__ -traditional -D__KERNEL__
> -I/Develop/parisc-linux/src/linux/include  -c -o pacache.CPP pacache.S
> In file included from /Develop/parisc-linux/src/linux/include/asm/assembly.h:31,
>                  from pacache.S:44:
> /Develop/parisc-linux/src/linux/include/asm/offset.h:3: unterminated #ifndef
> cc1: internal compiler error: internal error: Segmentation fault

The '-c' shouldn't be there but cc1 shouldn't ICE on an unterminated #ifdef.
Is the #ifdef actually unterminated?  Would you file a PR on this one as
well?

I'm also seeing a problem with the preprocessor on the vax :(

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
