Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-2.cisco.com (sj-msg-core-2.cisco.com [171.69.24.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 56581482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Dec 2001 02:25:14 -0700 (MST)
Received: from mira-sjc5-9.cisco.com (mira-sjc5-9.cisco.com [171.71.163.32])
	by sj-msg-core-2.cisco.com (8.11.3/8.9.1) with ESMTP id fBT9PDD07636
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Dec 2001 01:25:13 -0800 (PST)
Date: Sat, 29 Dec 2001 01:24:36 -0800
From: Christian Suder <csuder@cisco.com>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20011229012436.4586cb54.csuder@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Problem with threads..
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

Hello,

the pan newsreader does not want to work on parisc platforms (neither the ones from the debian archive nor a version compiled from scratch). Digging a little bit I found the application hangs at pthread_mutex_lock and similar calls. Tried with various kernel versions over the last couple of months, never worked. Known issue ?

Thanks,
	Christian 
