Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 374DD482C
	for <parisc-linux@parisc-linux.org>; Tue, 26 Mar 2002 23:08:30 -0700 (MST)
Subject: Re: [parisc-linux] X on J5000
From: Ryan Bradetich <rbradetich@uswest.net>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: 
	<Pine.LNX.4.33L2.0203262045310.13376-100000@eiger.apptechsys.com>
References: 
	<Pine.LNX.4.33L2.0203262045310.13376-100000@eiger.apptechsys.com>
Content-Type: text/plain
Date: 26 Mar 2002 23:08:27 -0700
Message-Id: <1017209307.24441.31.camel@beavis>
Mime-Version: 1.0
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

Jeremy,

> STI device: HPA4982A

This device does not appear to be support in the
drivers/video/sti/stifb.c.  A quick google search
didn't tell me which family this card belong to,
so I can't even give you a suggestion to try an 
add it to one of the supported groups to see if
that works.  Maybe one of the STI/fb hackers on
this list will have more info for you.

sorry :(

- Ryan
