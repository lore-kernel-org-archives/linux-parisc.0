Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id C1897482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jul 2003 09:15:06 -0600 (MDT)
Received: from hrzpub.tu-darmstadt.de (IP-213157001062.dialin.heagmedianet.de [213.157.1.62])
	(authenticated bits=0)
	by mailserver3.hrz.tu-darmstadt.de (8.12.9/8.12.7) with ESMTP id h6EFEmnf007748
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jul 2003 17:14:52 +0200
Message-ID: <3F12C763.7010305@hrzpub.tu-darmstadt.de>
Date: Mon, 14 Jul 2003 17:08:19 +0200
From: =?ISO-8859-15?Q?R=FCdiger_Scholz?= <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Subject: [parisc-linux] real2.S in linux-2.5
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

can someone please delete the whitespaces from line 126 in real2.S from 
linux-2.5, else gcc-3.3 will throw an error . J.David Anglin explained 
in 
http://lists.parisc-linux.org/pipermail/parisc-linux/2003-June/020137.html 
why.

TIA,
    Rüdiger
