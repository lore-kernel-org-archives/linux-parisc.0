Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tom.hrz.tu-chemnitz.de (tom.hrz.tu-chemnitz.de [134.109.132.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id B30914836
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Feb 2002 04:05:06 -0700 (MST)
Received: from pat.hrz.tu-chemnitz.de ([134.109.132.143] ident=mail)
	by tom.hrz.tu-chemnitz.de with esmtp (Exim 3.32 #3)
	id 16clbQ-0000Pa-00
	for parisc-linux@lists.parisc-linux.org; Mon, 18 Feb 2002 12:05:00 +0100
Received: from gerd.csn.tu-chemnitz.de ([134.109.88.146] helo=gerd.jandt-online.net)
	by pat.hrz.tu-chemnitz.de with esmtp (Exim 3.32 #2)
	id 16clbQ-0002jr-00
	for parisc-linux@lists.parisc-linux.org; Mon, 18 Feb 2002 12:05:00 +0100
Message-Id: <5.0.2.1.2.20020218115723.00ad0e80@pop.puretec.de>
Date: Mon, 18 Feb 2002 12:03:11 +0100
To: parisc-linux@lists.parisc-linux.org
From: Tilo Jandt <tilo@jandt-online.net>
Subject: [parisc-linux] MySQL
In-Reply-To: <OF5687265E.42AF0F56-ONC1256B64.00367C5C@com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
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

I've got a problem running MySQL.
After a complete new installation of Debian HPPA 0.9.3 I installed=20
Mysql-server with apt-get an it works fine.
After an update to libc6_2.2.5-3 and an mysql-sever upgrade the=20
configuration of mysql hangs.
I downgraded to libc6_2.2.4-7 an then the installation passed but I can't=20
start mysql server

I get the following log files:

beta:/var/lib/mysql# vim beta.err

020218 11:57:49  mysqld started
Cannot initialize InnoDB as 'innodb_data_file_path' is not set.
If you do not want to use transactional InnoDB tables, add a line
skip-innodb
to the [mysqld] section of init parameters in your my.cnf
or my.ini. If you want to use InnoDB tables, add for example,
innodb_data_file_path =3D ibdata1:30M
But to get good performance you should adjust for your hardware
the InnoDB startup options listed in section 2 at
http://www.innodb.com/ibman.html
020218 11:57:51  /usr/sbin/mysqld: Can't find file: './mysql/host.frm'=20
(errno: 13)
020218 11:57:51  mysqld ended

and:

beta:/var/log# vim mysql.err

Preparing db table
Preparing host table
Preparing user table
Preparing func table
Preparing tables_priv table
Preparing columns_priv table
Installing all prepared tables
020218 11:57:41  /usr/sbin/mysqld: Shutdown Complete


PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
This is done with:
/usr/bin/mysqladmin -u root -p password 'new-password'
/usr/bin/mysqladmin -u root -h beta -p password 'new-password'
See the manual for more instructions.

Please report any problems with the /usr/bin/mysqlbug script!

The latest information about MySQL is available on the web at
http://www.mysql.com
Support MySQL by buying support/licenses at https://order.mysql.com

ERROR: 1017  Can't find file: './mysql/user.frm' (errno: 13)
020218 11:57:42  /usr/sbin/mysqld: Shutdown Complete

ERROR: 1017  Can't find file: './mysql/db.frm' (errno: 13)
ERROR: 1017  Can't find file: './mysql/db.frm' (errno: 13)
020218 11:57:44  /usr/sbin/mysqld: Shutdown Complete

But these files (db.frm and user.frm) exists in /var/lib/mysql.

Does anyone have an idea how to get mysql work?

cya,
Tilo


Student of Computer Science at Chemnitz University of Technology
|[ Tilo Jandt, Vetterstra=DFe 70, Zi. 330, D-09126 Chemnitz        ]|
|[ mailto:tija@hrz.tu-chemnitz.de ]  [ ICQ: 73832493               ]|
|[ Phone: +49 179 5333 255        ]  [ Fax: +49 89 2443 25531 ]|
