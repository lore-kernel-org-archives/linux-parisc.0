Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-2.cisco.com (sj-msg-core-2.cisco.com [171.70.145.30])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8DD904829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 Jan 2003 00:07:13 -0700 (MST)
Received: from mira-sjc5-9.cisco.com (IDENT:mirapoint@mira-sjc5-9.cisco.com [171.71.163.32])
	by sj-msg-core-2.cisco.com (8.12.2/8.12.2) with ESMTP id h0377Cfm004054
	for <parisc-linux@lists.parisc-linux.org>; Thu, 2 Jan 2003 23:07:12 -0800 (PST)
Date: Thu, 2 Jan 2003 23:07:05 -0800
From: Christian Suder <csuder@cisco.com>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20030102230705.0cdd05d6.csuder@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] New year, new try : Mozilla & friends...
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

Hello everybody,

I apologize in advance for bringing up this topic again, I'm just a user
who wants a good web browser... ;-) 

Mozilla/skipstone/galeon are part of the distribution (even in 'stable')
for a while now, but crash straightaway with page faults. 

Has anybody ever looked into where the problems here are ? There is a
couple of other applications that have issues too, that may or may not be
related. Dillo e.g. (which by far is not as feature rich as the others)
needs to be started a number of times until the DNS thread works. Sylpheed
and pan start on a local display, but not on a remote display (strace
shows it loops forever somewhere). 

The browser situation is quite a bummer, I think, because the machines
would be much more useable for "general use". Otherwise the port is
excellent in terms of stability and hardware support achieved so far.
Great work !

Thx,
	Christian 
