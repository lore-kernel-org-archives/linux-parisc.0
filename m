Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 682F24839
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Jul 2003 14:19:15 -0600 (MDT)
Message-Id: <200307072019.h67KJDMa002052@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] warning: minor abi change
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Date: Mon, 7 Jul 2003 16:19:12 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@parisc-linux.org, jsoe0708@tiscali.be,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030707200240.GN30341@systemhalted> from "Carlos O'Donell" at Jul 7, 2003 04:02:40 pm
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

> I can't really come up with a scenario where userspace passes a function
> pointer to the kernel and has the kernel call or compare the function
> pointer?

One example is sigaction.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
