Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2F026482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Jul 2003 13:40:16 -0600 (MDT)
Received: from hrzpub.tu-darmstadt.de (IP-213157027204.dialin.heagmedianet.de [213.157.27.204])
	(authenticated bits=0)
	by mailserver3.hrz.tu-darmstadt.de (8.12.9/8.12.7) with ESMTP id h6FJe8l6021864
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Jul 2003 21:40:11 +0200
Message-ID: <3F145714.9020709@hrzpub.tu-darmstadt.de>
Date: Tue, 15 Jul 2003 21:33:40 +0200
From: =?ISO-8859-15?Q?R=FCdiger_Scholz?= <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Subject: [parisc-linux] Kernel 2.6.0-test1-pa0 crashes
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

yesterday I compiled the shiny new 2.6.0-kernel and tried to boot it on 
my 715/100. But it crashed right after the message "Freeing memory..."
Kernel was compiled with gcc-3.3.

Has anyone an idea why it crashed? Full System.map and Config-File is 
there: http://rscholz.bluehash.de/parisc .

TIA,
    Rüdiger Scholz
