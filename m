Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from inca.herrera.edu (pool-151-201-225-44.pitt.east.verizon.net [151.201.225.44])
	by dsl2.external.hp.com (Postfix) with ESMTP id DC80E482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Jan 2002 19:35:57 -0700 (MST)
Received: from neuronet.pitt.edu (localhost [127.0.0.1])
	by inca.herrera.edu (8.11.6/8.11.6/SuSE Linux 0.5) with ESMTP id g0L2SPj04296
	for <parisc-linux@lists.parisc-linux.org>; Sun, 20 Jan 2002 21:28:25 -0500
Message-ID: <3C4B7CC8.1000300@neuronet.pitt.edu>
Date: Sun, 20 Jan 2002 21:28:24 -0500
From: Rafael Herrera <raffo@neuronet.pitt.edu>
Reply-To: raffo@neuronet.pitt.edu
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Appropriate entries for apt sources.list
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

I just finished a test install of CD 0.9.3 on a B132L workstation. 
Comparing this with a couple of 715/75, 715/80 installs I made before, I 
noticed a difference in the sources.list files.

My last installation contains:

deb ftp://ftp.us.debian.org/debian/ testing main non-free contrib
deb-src ftp://ftp.us.debian.org/debian/ testing main non-free contrib
deb http://non-us.debian.org/debian-non-US testing/non-US main contrib 
non-free
deb-src http://non-us.debian.org/debian-non-US testing/non-US main 
contrib non-free

Whereas the old installs have:

deb ftp://ftp.us.debian.org/debian/ unstable main non-free contrib
deb-src ftp://ftp.us.debian.org/debian/ unstable main non-free contrib
deb http://non-us.debian.org/debian-non-US unstable/non-US main contrib 
non-free
deb-src http://non-us.debian.org/debian-non-US unstable/non-US main 
contrib non-free

What would be the most appropriate setting at this point (in order to 
get the most usability in the system)? If "testing" is preferable, how 
can one revert the packages from "stable" to "testing" version using 
apt-get commands?

Thanks.

-- 
      Rafael
