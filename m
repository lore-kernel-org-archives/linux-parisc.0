Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 39ED14840
	for <parisc-linux@parisc-linux.org>; Sun, 23 Nov 2003 15:26:55 -0700 (MST)
Message-Id: <200311232226.hANMQr2p029128@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Tool chain pb
To: soete.joel@tiscali.be (Joel Soete)
Date: Sun, 23 Nov 2003 17:26:53 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, carlos@baldric.uwo.ca,
	parisc-linux@parisc-linux.org
In-Reply-To: <3FC12EA5.8040809@tiscali.be> from "Joel Soete" at Nov 23, 2003 10:03:17 pm
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

> Just to have an overview, is there another risc platform (sparc, ia64, 
> ...) on which it is already implemented?

Yes, I believe that it is implemented on sparc and ia64.  For further
info, consult

- Prelink on HPPA, requiring some binutils/glibc changes
        = http://freshmeat.net/projects/prelink/?topic_id=253
- NTPL on HPPA, requiring gcc/binutils/glibc changes
	= http://people.redhat.com/drepper/nptl-design.pdf
	= http://people.redhat.com/drepper/tls.pdf

There was some discussion of this on the list back in January.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
