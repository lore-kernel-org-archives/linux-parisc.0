Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3539B482E
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Jun 2002 10:42:46 -0600 (MDT)
Message-Id: <200206071642.g57GgbbQ013056@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] kdb getting healthier? (PCI guru needed, that's you willy!)
To: carlos@baldric.uwo.ca (Carlos O'Donell Jr.)
Date: Fri, 7 Jun 2002 12:42:37 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: tausq@debian.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020607110820.C10576@systemhalted> from "Carlos O'Donell Jr." at Jun 7, 2002 11:08:20 am
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

> -       ldw -12(%r22),%r19
> -       extrs %r20,27,28,%r20
> +       ldo -16(%r20),%r20
> +       ldw 4(%r20),%r19

> Aside from some register juggling, the only difference is
> that we now use 'ldo,ldw,sub,extrs' instead of 'sub,ldw,extrs'.
> The question is: Can this do bad things?

The only possible difference is the space register selection could be
different for the ldw insns in the old code versus the new because the
pointer values in the base differ by 16.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
