Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id E5D5B482E
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Aug 2003 22:02:23 -0600 (MDT)
Received: from hrzpub.tu-darmstadt.de (IP-213157027062.dialin.heagmedianet.de [213.157.27.62])
	(authenticated bits=0)
	by mailserver3.hrz.tu-darmstadt.de (8.12.9/8.12.7) with ESMTP id h7741jir025552
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <parisc-linux@lists.parisc-linux.org>; Thu, 7 Aug 2003 06:02:10 +0200
Message-ID: <3F31CF22.9080706@hrzpub.tu-darmstadt.de>
Date: Thu, 07 Aug 2003 06:01:38 +0200
From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Problem: linux-2.6.0-test-pa6 and ssh
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

booting the 2.6.0-test2-pa6 kernel works quite right, but when I try to 
login via ssh I get the following error after entering the password: 
"Server refused to allocate pty".
With a 2.4-kernel and latest 2.5-kernel it worked alright.
I using devfs and debian unstable on my 715/100.
Has anyone an idea how to get ssh to work?

Ruediger
