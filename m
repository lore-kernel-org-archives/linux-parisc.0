Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id B1B0A483B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Jul 2003 09:13:26 -0600 (MDT)
Message-Id: <200307071513.h67FDLjM000719@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Differences PA8500/PA8600
To: paul@doorslam.net
Date: Mon, 7 Jul 2003 11:13:21 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030706173854.GC8562@blinder.doorslam.net> from "Paul Weissmann" at Jul 6, 2003 07:38:54 pm
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

>   Could someone here on this list might shed some led on where the
> differences between these CPUs are?

Don't know.  As far as GCC goes, we treat all 8000 processors the same.
Jeff Law had access to some proprietory information when he did the
DFA scheduling model.  However, that predates the 8600.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
