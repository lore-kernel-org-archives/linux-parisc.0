Return-Path: <bame@ldl.fc.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [156.153.255.213])
	by dsl2.external.hp.com (Postfix) with ESMTP id 05AAB4842
	for <parisc-linux@parisc-linux.org>;
	Tue,  4 May 2004 16:11:28 -0600 (MDT)
Received: from smtp1.fc.hp.com (smtp.fc.hp.com [15.11.136.119])
	by atlrel7.hp.com (Postfix) with ESMTP id BBE561C00667
	for <parisc-linux@parisc-linux.org>;
	Tue,  4 May 2004 18:11:27 -0400 (EDT)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.11.146.30])
	by smtp1.fc.hp.com (Postfix) with ESMTP id 8FC41394BC
	for <parisc-linux@parisc-linux.org>;
	Tue,  4 May 2004 16:11:27 -0600 (MDT)
Received: from fc.hp.com (paul.bame [10.66.2.7])
	by ldl.fc.hp.com (Postfix) with ESMTP id 277E61340C2
	for <parisc-linux@parisc-linux.org>;
	Tue,  4 May 2004 16:11:27 -0600 (MDT)
Date: Tue, 4 May 2004 16:11:29 -0600
To: parisc-linux@parisc-linux.org
Message-ID: <20040504221129.GA28695@ldl.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: bame@ldl.fc.hp.com (Paul Bame)
Cc: 
Subject: [parisc-linux] machine migration, action required for some
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

We're moving most of the virtual host names which were aliases of
dsl2.external.hp.com to point at palinux.external.hp.com which until
now was only serving as cvs.parisc-linux.org.  Most people should not
experience any interruption in service but IF YOU HAVE AN ACCOUNT ON
DSL2 read on...

The host names which have moved or will soon move are:

parisc-linux.org
www.parisc-linux.org
ftp.parisc-linux.org
rsync.parisc-linux.org
register.parisc-linux.org
hwdb.parisc-linux.org
testhwdb.parisc-linux.org

We're not sure the best way and time to move the e-mail related ones yet
but that's coming too.

IF YOU HAVE AN ACCOUNT ON DSL2... and you use any *.parisc-linux.org
host names to refer to personal web pages (I do), move them to
palinux.external.hp.com.

Although we don't have a turn-off date for dsl2, now's a good time to
move those other things you depend upon to palinux.external just in
case...  things like e-mail forwarding and files you share with other
developers via ssh through dsl etc...

	-Paul
