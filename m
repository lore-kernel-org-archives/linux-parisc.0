Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from guinness.internal.neep.com.au (090.v90.ppp.reynolds.net.au [203.13.164.90])
	by dsl2.external.hp.com (Postfix) with ESMTP id EC7F24852
	for <parisc-linux@lists.parisc-linux.org>; Wed, 20 Feb 2002 22:15:39 -0700 (MST)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id NAA17908
	for parisc-linux@lists.parisc-linux.org; Thu, 21 Feb 2002 13:15:18 +0800
Date: Thu, 21 Feb 2002 13:15:11 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] MySQL
Message-ID: <20020221131507.E611@neep.com.au>
References: <5.0.2.1.2.20020218115723.00ad0e80@pop.puretec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5.0.2.1.2.20020218115723.00ad0e80@pop.puretec.de>; from tilo@jandt-online.net on Mon, Feb 18, 2002 at 12:03:11PM +0100
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

Quoth Tilo Jandt:
> 020218 11:57:49  mysqld started
> Cannot initialize InnoDB as 'innodb_data_file_path' is not set.
> If you do not want to use transactional InnoDB tables, add a line
> skip-innodb
> to the [mysqld] section of init parameters in your my.cnf
> or my.ini. If you want to use InnoDB tables, add for example,
> innodb_data_file_path = ibdata1:30M
> But to get good performance you should adjust for your hardware
> the InnoDB startup options listed in section 2 at
> http://www.innodb.com/ibman.html
> 020218 11:57:51  /usr/sbin/mysqld: Can't find file: './mysql/host.frm' 
> (errno: 13)
> 020218 11:57:51  mysqld ended

The innodb warning you can easily fix by adding the 'skip-innodb' line
as the text there suggests.

> Preparing db table
> Preparing host table
> Preparing user table
> Preparing func table
> Preparing tables_priv table
> Preparing columns_priv table
> Installing all prepared tables
> 020218 11:57:41  /usr/sbin/mysqld: Shutdown Complete
> 
> 
> PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
> This is done with:
> /usr/bin/mysqladmin -u root -p password 'new-password'
> /usr/bin/mysqladmin -u root -h beta -p password 'new-password'
> See the manual for more instructions.
> 
> Please report any problems with the /usr/bin/mysqlbug script!
> 
> The latest information about MySQL is available on the web at
> http://www.mysql.com
> Support MySQL by buying support/licenses at https://order.mysql.com
> 
> ERROR: 1017  Can't find file: './mysql/user.frm' (errno: 13)
> 020218 11:57:42  /usr/sbin/mysqld: Shutdown Complete
> 
> ERROR: 1017  Can't find file: './mysql/db.frm' (errno: 13)
> ERROR: 1017  Can't find file: './mysql/db.frm' (errno: 13)
> 020218 11:57:44  /usr/sbin/mysqld: Shutdown Complete
> 
> But these files (db.frm and user.frm) exists in /var/lib/mysql.
> 
> Does anyone have an idea how to get mysql work?

This probably isn't a linux-hppa problem.  Check:

  - does /etc/mysql/my.cnf have the line "datadir = /var/lib/mysql"?
  - are /var/lib/mysql and /var/lib/mysql/mysql owned by "mysql.mysql"?
  - are the files in /var/lib/mysql/mysql mode 0660?  (-rw-rw----)

If your mysqld is telling us the truth, then it's just having trouble
getting to the files, either because it doesn't know where they are, it
doesn't have permission to read them, or because on of the directories
higher up the tree (eg /var/lib or /var/lib/mysql) is not accessable
for the mysql user (+x).

Try this if you have sudo installed:

beta# sudo -u mysql ls -laR /var/lib/mysql

If the output all looks kosher then it's not an access and permissions
problem, and you'll have to think of something else ...

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
