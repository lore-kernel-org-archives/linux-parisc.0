Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtppop3pub.verizon.net (smtppop3pub.gte.net [206.46.170.22])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7E03B482C
	for <parisc-linux@lists.parisc-linux.org>; Sun, 11 Nov 2001 18:39:24 -0700 (MST)
Received: from verizon.net ([151.201.37.152])
	by smtppop3pub.verizon.net  with ESMTP
	for <parisc-linux@lists.parisc-linux.org>; id TAA51065260
	Sun, 11 Nov 2001 19:39:03 -0600 (CST)
Message-ID: <3BEF289C.1020205@verizon.net>
Date: Sun, 11 Nov 2001 20:40:44 -0500
From: Rafael Herrera <vze26vn8@verizon.net>
Reply-To: raffo@neuronet.pitt.edu
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Current kernel from CVS does not build.
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

After intalling the most recent kernel snapshot 
ftp://ftp.parisc-linux.org/cvs/linux-20011108.tar.gz (2.4.9-pa79) and 
Randolph Chung's gcc, my 715/75 has been very stable.

I tried to update the sources with the latest CVS version, but the 
compilation failed. The file */arch/parisc/kernel/pdc_cons.c and 
*/kernel/printk.c have a conflict. The variable log_size used in 
pdc_cons.c is not defined in printk.c. The kernel does not build.

P.S. I successfully built linux-20011108.tar.gz with Randolf's gcc 
package. It took an hour.
-- 
      Rafael
