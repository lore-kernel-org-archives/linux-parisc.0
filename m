Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-2.cisco.com (sj-msg-core-2.cisco.com [171.69.24.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8F9FD482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Dec 2001 02:19:53 -0700 (MST)
Received: from mira-sjc5-9.cisco.com (mira-sjc5-9.cisco.com [171.71.163.32])
	by sj-msg-core-2.cisco.com (8.11.3/8.9.1) with ESMTP id fBT9JqD06807
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Dec 2001 01:19:52 -0800 (PST)
Date: Sat, 29 Dec 2001 01:19:15 -0800
From: Christian Suder <csuder@cisco.com>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20011229011915.2fc7aa82.csuder@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Update on [Q] on EISA
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

Ok,

I figured out my (self-inflicted) problems with X and newer kernel versions and I now have a -23 kernel running with an ISA NE1000 (in fact this email leaves via it). 

However with recent versions (-27, -28) no joy:
Dec 28 22:07:51 c110 kernel: Warning : device (11, 0x1e, 0x0, 0x90) NOT claimed by EISA Bus Adapter

and subsequent messages that the PCI or EISA device would not be registered when the driver tries to access it. 



On the Q how to get an EISA card going it turned out HP/UX has the necessary eisa_config utility. Unfortunately there is no equivalent Linux utility (yet...) as the other EISA platforms (i386 and alpha) can be configured by booting from diskette.


	Christian 
