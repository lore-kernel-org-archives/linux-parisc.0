Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-4.cisco.com (sj-msg-core-4.cisco.com [171.71.163.54])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B449482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Jan 2003 02:07:05 -0700 (MST)
Date: Tue, 28 Jan 2003 01:07:02 -0800
From: Christian Suder <csuder@cisco.com>
To: rbradetich@uswest.net, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] long booting kernels...
Message-Id: <20030128010702.27f05486.csuder@cisco.com>
Mime-Version: 1.0
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


Hi Ryan,

yes this solves the problem on the C180. It now takes around 15 seconds
after the first messages until it switches to framebuffer mode. 

Thanks,
	Christian 





Hello,

I finally found some time to test the updated bus walk code on a
parisc-2.4.20-pa22 system.  It works fine for me, but the C200 does not
exhibit the problems seen by others on this list.  I would appreciate if
someone with this problem could test this patch and see if it speeds the
boot time up.

This is the same patch I applied to the 2.5 tree several months ago.

Thanks,

- Ryan


 
