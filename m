Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id BBC864837
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jun 2003 10:22:08 -0600 (MDT)
Message-Id: <200306171622.h5HGM5QJ010581@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Some 2.5-testing
To: r.scholz@bluehash.de (=?ISO-8859-15?Q?R=FCdiger_Scholz?=)
Date: Tue, 17 Jun 2003 12:22:04 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3EEF3C94.3080300@bluehash.de> from "=?ISO-8859-15?Q?R=FCdiger_Scholz?=" at Jun 17, 2003 06:06:44 pm
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

> I tried to get a running 2.5.70 kernel on my 715/100, but booting 
> results in an endless loop with the following error:

Until issues related to the canonicalization of function pointers
and the alignment of stack locals are resolved, it is best to stick
with debian gcc-3.0.4 for kernel building.  Loops of this kind can
happen when lock structures are misaligned on PA 1.1 machines.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
