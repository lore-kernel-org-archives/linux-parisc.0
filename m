Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id DA9594829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 28 Sep 2002 11:04:25 -0600 (MDT)
Message-Id: <200209281702.g8SH2ND4019187@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] How to obtain a core dump
To: joel.soete@freebel.net (Joel Soete)
Date: Sat, 28 Sep 2002 13:02:23 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3D95E9B7.2080209@freebel.net> from "Joel Soete" at Sep 28, 2002 05:41:11 pm
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

> Is someonr can explain me what should I do to obtain a core dump when 
> this kind of problem occurs?

Type "ulimit -a" to see your current limit settings.  The core size
limit can be changed with "ulimit -c".  Your current core size limit
is probably too small.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
