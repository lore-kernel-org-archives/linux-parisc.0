Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 64ADB4835
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Mar 2002 07:55:38 -0700 (MST)
Message-Id: <200203141455.g2EEtZ52019381@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] evms-0.9.2 build utilities problem
To: randolph@tausq.org
Date: Thu, 14 Mar 2002 09:55:35 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020314071822.GR730@tausq.org> from "Randolph Chung" at Mar 13, 2002 11:18:22 pm
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

> <sigh> yup... looks like a compiler (linker?) bug...
> 
> gcc -fPIC -o test test.c          -> works
> gcc -fPIC -static -o test test.c  -> segfaults

I don't think so.  I did a little test and found r19 has the value 4
when main is called.  There must be a problem with the startup code.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
