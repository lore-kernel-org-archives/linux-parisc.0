Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id AAB6C48CC
	for <parisc-linux@parisc-linux.org>; Wed, 17 Jul 2002 11:13:43 -0600 (MDT)
Message-Id: <200207171713.g6HHDT7h029204@hiauly1.hia.nrc.ca>
Subject: Re: gcc-3.2 Ok gcc-3.1.1 Ko (was Re: [parisc-linux] gcc-3.2 bootstrap?)
To: joel.soete@freebel.net (Joel Soete)
Date: Wed, 17 Jul 2002 13:13:28 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <1026925794.3d35a4e296ccf@webmail.tiscalinet.be> from "Joel Soete" at Jul 17, 2002 07:09:54 pm
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

> But with gcc-3.1.1 still crashing at the first remote connection?

If 64-bit, this could be the tcp header alignment problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
