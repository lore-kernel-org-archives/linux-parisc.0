Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 20C4E483D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Apr 2003 10:20:15 -0600 (MDT)
Message-Id: <200304201620.h3KGKD77005253@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] floating point calling convention on pa
To: randolph@tausq.org
Date: Sun, 20 Apr 2003 12:20:12 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030420064031.GD25257@tausq.org> from "Randolph Chung" at Apr 19, 2003 11:40:31 pm
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

> I thought I understood it, but this one baffles me:
> 
> static int floating(int a, float b, double c, long double d, int e)
> 
> i would have guessed this mapped to:
> 
> a -> gr26   (sp-36)
> b -> fr4L   (sp-40)
> c -> fr7    (sp-48)
> d -> sp-56
> e -> sp-64
> 
> but according to gcc, e is at sp-60.

int arguments only need word alignment. 'd' occupies bytes sp-56 to sp-49.

A long double is the same as a double (64-bits) on hppa-linux.  I'd hoped
that HP would make their quad library available but so far it hasn't
happened.  As far as I know, quad precision has never been implemented
in hardware.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
