Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from moutvdom00.kundenserver.de (moutvdom00.kundenserver.de [195.20.224.149])
	by dsl2.external.hp.com (Postfix) with ESMTP id AF32A4881
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Feb 2002 16:34:14 -0700 (MST)
Received: from [172.19.20.61] (helo=mrvdomng0.kundenserver.de)
	by moutvdom00.kundenserver.de with esmtp (Exim 2.12 #2)
	id 16brri-000396-00
	for parisc-linux@lists.parisc-linux.org; Sat, 16 Feb 2002 00:34:06 +0100
Received: from [80.136.166.44] (helo=epsilon)
	by mrvdomng0.kundenserver.de with smtp (Exim 3.22 #2)
	id 16brrh-0004uN-00
	for parisc-linux@lists.parisc-linux.org; Sat, 16 Feb 2002 00:34:05 +0100
Message-ID: <000b01c1b679$53e96fb0$0801a8c0@epsilon>
From: "Tilo Jandt" <tilo@jandt-online.net>
To: <parisc-linux@lists.parisc-linux.org>
References: <002101c1b5ee$b5f8a620$02c1a8c0@james.co.uk> <20020214231312.37ca1c9e.csuder@cisco.com> <200202150826.29543.deller@gmx.de> <3C6D8F88.D77A6622@gmx.at>
Subject: [parisc-linux] MySQL Server
Date: Sat, 16 Feb 2002 00:34:32 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

I've got a problem whe installing the MySQL-server.
Last time when I updated my system with apt-get the MySQL Server should also
be updated but after downloading the File, extracting and preconfigurating
the update proces stopped after "Stopping Mysql-server".
I waited 2 hours but nothing happend. The MySQL couldn't be started and if I
remove the new mysql-server and install the old one with dpkg the same
procedure happens.
Every time after the preconfiguration the install hangs.

I don't know what to do. I cleaned up my system and wan't to new install
MySQL, but everytime the same procedure. Does anyone solved this problem or
does anyone have any idea?

Thanx,
Tilo
