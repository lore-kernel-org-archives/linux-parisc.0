Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id ABEF7482A
	for <parisc-linux@parisc-linux.org>; Thu, 11 Apr 2002 21:07:42 -0600 (MDT)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g3C37eFN002081
	for <parisc-linux@parisc-linux.org>; Thu, 11 Apr 2002 23:07:40 -0400 (EDT)
Message-Id: <200204120307.g3C37cGs002079@hiauly1.hia.nrc.ca>
To: randolph@tausq.org
Date: Thu, 11 Apr 2002 23:07:38 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20020305194640.GC26587@tausq.org> from "Randolph Chung" at Mar 5, 2002 11:46:40 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: Problems with hppa-gcc (again)
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

Randolph,

> The error is:
> /usr/bin/ld: layers.o(.text+0x41a28): cannot reach 0000007d_get_all_args+0, recompile with -ffunction-sections
> /usr/bin/ld: layers.o(.text+0x41a28): cannot handle R_PARISC_PCREL17F for get_all_args
> /usr/bin/ld: final link failed: Bad value

I have applied a patch to the gcc 3.2 (experimental) trunk which I believed
fixes the above problem.  It is now possible to compile large objects.
Long calls still may not be optimal but the code should work.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
