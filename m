Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rotapile (CPE-203-45-167-61.qld.bigpond.net.au [203.45.167.61])
	by dsl2.external.hp.com (Postfix) with ESMTP id F0E76482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 02:27:29 -0600 (MDT)
Subject: Re: [parisc-linux] 2.4.18-pa29 problem
From: Robert Stanford <rob@rotapile.com>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <A82E4B62-72DC-11D6-8311-0030656F07A2@esiee.fr>
References: <A82E4B62-72DC-11D6-8311-0030656F07A2@esiee.fr>
Content-Type: text/plain
Date: 29 May 2002 18:26:50 +1000
Message-Id: <1022660810.4015.7.camel@rotapile>
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

> We also discovered that adding a init=/bin/sh param to the linux kernel 
> did the trick and let the machine boot.
> 
> We suspect an INIT problem.
> 
> Hope this might help.
> 

When we did LTSP for sparc it was based it off the woody binaries, we
had the same problem and yes could also do init=/bin/bash. We ended up
using init from slackware resulting in a slightly bastardised but
working distribution.

Robert Stanford
