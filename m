Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 95D174833
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Jun 2002 19:39:07 -0600 (MDT)
Message-Id: <200206220139.g5M1d6PS029066@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] PA8000 modutils problems
To: xam@cs.ucc.ie (M. Grabert)
Date: Fri, 21 Jun 2002 21:39:05 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.44.0206212339430.5644-100000@sal.ucc.ie> from "M. Grabert" at Jun 21, 2002 11:51:01 pm
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

> So what is the point in choosing the PA8000 anyway ? ;)

It affects the ordering of insns but not the insn set (PA1.0, 1.1
or 2.0).  The PA8000 ordering should work better on a PA8000
or later processor.  The ordering takes into account the number
of insn pipelines, the timing of insns, etc.  On older PA1.1
machines, the PA7100LC model should be better.

PA8000 machines all use the PA2.0 architecture but are backwards
compatible with PA1.1, etc.  There is still more work to be done
in the compiler to take full advantage of the PA2.0 architecture,
particularly in 32-bit mode.  For example, we are not taking
advantage of the fact that the general registers are actually 64
bits wide.  Thus, long long support could be better.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
