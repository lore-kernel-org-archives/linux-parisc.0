Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (unknown [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id BE81B482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Dec 2001 11:01:55 -0700 (MST)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 16DUkS-0000Aj-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Dec 2001 19:01:52 +0100
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1008007312.3c14f890e4d33@webmail.tiscalinet.be>
Date: Mon, 10 Dec 2001 19:01:52 +0100 (CET)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] telnetd on hppa: strange behaviour?
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

Hi all,

I use to work with a telnet connection to my hppa linux box.
And I just notice that if I do a ls -al in a directory containing many soft
links the telnet session stop with "connection close by foreign hosts" (and not
with a simple ls)?

(I just do a apt-get dist-uprade but nothing has to be done. Also I assume to be
up-to-date)

Thanks in advance for advice,
        Joel

-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
