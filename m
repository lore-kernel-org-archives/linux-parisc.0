Return-Path: <bame@hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id D34FC484B
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  6 Feb 2004 11:06:16 -0700 (MST)
Received: from smtp2.fc.hp.com (smtp.fc.hp.com [15.15.136.253])
	by atlrel7.hp.com (Postfix) with ESMTP id 7B4071C02642
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  6 Feb 2004 13:06:16 -0500 (EST)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.11.146.30])
	by smtp2.fc.hp.com (Postfix) with ESMTP id 38B5A41E38A
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  6 Feb 2004 11:06:16 -0700 (MST)
Received: from fc.hp.com (paul.bame [10.66.2.7])
	by ldl.fc.hp.com (Postfix) with ESMTP id B52DB1340A2
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  6 Feb 2004 11:06:15 -0700 (MST)
Received: from paul.bame (localhost [127.0.0.1])
	by fc.hp.com (Postfix) with ESMTP id 8E4AC62C62
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  6 Feb 2004 11:06:15 -0700 (MST)
From: bame@hp.com
Errors-To: bame@hp.com
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] RE: [parisc-linux-cvs] linux-2.6 jejb 
In-Reply-To: Message from Grant Grundler <grundler@parisc-linux.org> of "Fri,
	06 Feb 2004 10:50:38 MST." <20040206175038.GC20990@colo.lackof.org>
References: <40218AE200000F67@ocpmta2.freegates.net>
	<20040206175038.GC20990@colo.lackof.org>
Date: Fri, 06 Feb 2004 11:06:14 -0700
Sender: bame@hp.com
Message-Id: <20040206180615.922C77381D@fc.hp.com>
Reply-To: bame@hp.com
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> 
> What does 00000000000600d0 point at?
> Is that the boot loader?

Yes, it's where the kernel would return to if it ever returned, so
probably palo's made the call to the kernel at that point.
