Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0ABBD488A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Feb 2002 22:46:52 -0700 (MST)
Date: Sat, 16 Feb 2002 06:46:47 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Helge Deller <deller@gmx.de>
Cc: Tilo Jandt <tilo@jandt-online.net>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] MySQL Server
In-Reply-To: <200202160111.13331.deller@gmx.de>
Message-ID: <Pine.NEB.4.33.0202160643280.23380-100000@www2.scram.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi Helge,

> In case you have libc6-2.2.5 installed you might try
> to downgrade to libc6-2.2.4-7 again.
> Could be worth a try...

the MySQL server never worked for me. With the old libc6, one thread keeps
looping (100% CPU time) and with the new one it simply hangs.

> > Last time when I updated my system with apt-get the MySQL Server should
> > also be updated but after downloading the File, extracting and
> > preconfigurating the update proces stopped after "Stopping Mysql-server".
> > I waited 2 hours but nothing happend. The MySQL couldn't be started and if
> > I remove the new mysql-server and install the old one with dpkg the same
> > procedure happens.
> > Every time after the preconfiguration the install hangs.

rm /var/run/mysqld/mysqld.pid

Cheers,
--jochen
