Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A7AA4830
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Sep 2003 13:40:04 -0600 (MDT)
Received: from hrzpub.tu-darmstadt.de (IP-213157024128.dialin.heagmedianet.de [213.157.24.128])
	(authenticated bits=0)
	by mailserver3.hrz.tu-darmstadt.de (8.12.9/8.12.7) with ESMTP id h84JdUIb032264
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <parisc-linux@lists.parisc-linux.org>; Thu, 4 Sep 2003 21:39:52 +0200
Message-ID: <3F5794F3.4020507@hrzpub.tu-darmstadt.de>
Date: Thu, 04 Sep 2003 21:39:31 +0200
From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] ksoftirqd is using over 90% CPU (?!)
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

Hi there,

just another question: I just ran top to look what processe are running 
and noticed that ksoftirqd is up to 98% CPU time. I remember that there 
was a problem that s.th in the kernel eats up a lot oft CPU time. Wasn't 
it solved?

Ruediger
