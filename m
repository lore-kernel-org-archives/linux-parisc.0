Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lefou.zayda.com (unknown [204.99.158.177])
	by dsl2.external.hp.com (Postfix) with ESMTP id 688E7482C
	for <parisc-linux@parisc-linux.org>; Sat, 17 Nov 2001 00:23:37 -0700 (MST)
Received: from localhost (sonny@localhost)
	by lefou.zayda.com (8.9.3/8.9.3) with ESMTP id HAA09294
	for <parisc-linux@parisc-linux.org>; Sat, 17 Nov 2001 07:23:35 GMT
Date: Sat, 17 Nov 2001 07:23:35 +0000 (UTC)
From: Sonny Cook <sonny@aspersion.org>
To: <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0111170713360.4966-100000@lefou.zayda.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] pam/ssh seems to be whacked
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

Hi,
When attempting to install gkrellm on my b132l, apt-get upgraded a number
of other packaged including (the suspect) libc6-2.2.4-6.  Now when I
attempt to ssh into the box, I get the following error in my logs:

Nov 13 00:20:52 angstrom sshd[14365]: PAM pam_set_item: NULL pam handle
passed
Nov 13 00:20:52 angstrom sshd[14365]: Failed rsa for illegal user sonny
from 192.168.1.128 port 34113
Nov 13 00:21:07 angstrom sshd[14365]: PAM pam_set_item: NULL pam handle
passed
Nov 13 00:21:07 angstrom sshd[14365]: Failed password for illegal user
sonny from 192.168.1.128 port 34113

I upgraded to the latest version of libpam0g, libpam-runtime, and
libpam-modules, to no avail.  Needless to say, I cannot log in.

I suspect that the libc6 upgrage goofed me up somehow.  Does anybody have
an idea, or place to start debugging?

Thanks
Sonny
