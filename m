Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from zayda.com (celery.zayda.com [208.186.180.200])
	by dsl2.external.hp.com (Postfix) with ESMTP id A915B482A
	for <parisc-linux@parisc-linux.org>; Thu, 13 Dec 2001 13:59:44 -0700 (MST)
Received: from localhost (sonny@localhost)
	by zayda.com (8.11.6/8.11.6) with ESMTP id fBDKxjq11806
	for <parisc-linux@parisc-linux.org>; Thu, 13 Dec 2001 20:59:45 GMT
Date: Thu, 13 Dec 2001 20:59:45 +0000 (UTC)
From: Sonny Cook <sonny@aspersion.org>
To: <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0112132057310.18883-100000@zayda.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] anon cvs
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

Is something up with anonamous cvs access?  I get the following error when 
attempting to update my kernel tree:

angstrom:/usr/src/linux-2.4.16-pa16# cvs update -dP .
cvs [update aborted]: recv() from server cvs.parisc-linux.org: Connection 
reset by peer

I also noticed that the nightly snapshots are about 45 bytes long.

Thanks,
Sonny
