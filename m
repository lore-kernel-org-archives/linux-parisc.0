Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 2E03A4883
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Feb 2002 17:16:46 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: "Tilo Jandt" <tilo@jandt-online.net>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] MySQL Server
Date: Sat, 16 Feb 2002 01:13:09 +0100
References: <002101c1b5ee$b5f8a620$02c1a8c0@james.co.uk> <3C6D8F88.D77A6622@gmx.at> <000b01c1b679$53e96fb0$0801a8c0@epsilon>
In-Reply-To: <000b01c1b679$53e96fb0$0801a8c0@epsilon>
MIME-Version: 1.0
Message-Id: <200202160111.13331.deller@gmx.de>
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

In case you have libc6-2.2.5 installed you might try
to downgrade to libc6-2.2.4-7 again. 
Could be worth a try...

Helge

On Saturday 16 February 2002 00:34, Tilo Jandt wrote:
> Hi,
>
> I've got a problem whe installing the MySQL-server.
> Last time when I updated my system with apt-get the MySQL Server should
> also be updated but after downloading the File, extracting and
> preconfigurating the update proces stopped after "Stopping Mysql-server".
> I waited 2 hours but nothing happend. The MySQL couldn't be started and if
> I remove the new mysql-server and install the old one with dpkg the same
> procedure happens.
> Every time after the preconfiguration the install hangs.
>
> I don't know what to do. I cleaned up my system and wan't to new install
> MySQL, but everytime the same procedure. Does anyone solved this problem or
> does anyone have any idea?
>
> Thanx,
> Tilo
