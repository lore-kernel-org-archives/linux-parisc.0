Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5DC4C482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Jul 2003 08:44:28 -0600 (MDT)
Received: from smtp2.fc.hp.com (smtp.fc.hp.com [15.15.136.253])
	by atlrel6.hp.com (Postfix) with ESMTP id 17B8F1C011D6
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Jul 2003 10:44:28 -0400 (EDT)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.11.146.30])
	by smtp2.fc.hp.com (Postfix) with ESMTP id A8B2D23F5F
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Jul 2003 08:44:27 -0600 (MDT)
Received: from fc.hp.com (paul.bame [10.66.2.7])
	by ldl.fc.hp.com (Postfix) with ESMTP id 5AA4346BD
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Jul 2003 08:44:27 -0600 (MDT)
Received: from paul.bame (localhost [127.0.0.1])
	by fc.hp.com (Postfix) with ESMTP id 48A9A62C78
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 Jul 2003 08:44:27 -0600 (MDT)
From: bame@hp.com
Reply-To: bame@hp.com
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] cvs [login aborted]? 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Fri, 18 Jul 2003 12:21:33 BST." <20030718112133.GO23808@parcelfarce.linux.theplanet.co.uk>
References: <3F056E95000037F7@ocpmta4.freegates.net>  <20030718112133.GO23808@parcelfarce.linux.theplanet.co.uk> 
Date: Fri, 18 Jul 2003 08:44:26 -0600
Message-Id: <20030718144427.4D0F272C5D@fc.hp.com>
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

> I think someone must have changed the firewall config because I can
> reach port 2401 from localhost, but not from any other machine.

I don't know how that happened, but I reopened the port and anon
CVS should work now.

	-P
