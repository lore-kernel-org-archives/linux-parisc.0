Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtppop3pub.verizon.net (smtppop3pub.gte.net [206.46.170.22])
	by dsl2.external.hp.com (Postfix) with ESMTP id C87F3482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 Nov 2001 18:38:23 -0700 (MST)
Message-ID: <3BF31CD7.3080405@verizon.net>
Date: Wed, 14 Nov 2001 20:39:35 -0500
From: Rafael Herrera <vze26vn8@verizon.net>
Reply-To: raffo@neuronet.pitt.edu
MIME-Version: 1.0
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: rsync for CVS repository
References: <200111150105.SAA09926@puffin.external.hp.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

I set up my home computer as an rsync server to mirror some stuff to 
school. This is a PC running suse 7.2. If i remember correctly, the 
steps were:

1. Install it, of course.
2. Enable the server in /etc/inetd.conf

rsync   stream  tcp     nowait  root    /usr/sbin/tcpd  /usr/sbin/rsyncd 
--daemon

3. Edit the configuration file, /etc/rsync.conf. Here is an example of 
an anonymous setting:

gid = users
uid = nobody
read only = true
use chroot = true
transfer logging = true
log format = %h %o %f %l %b
log file = /var/log/rsyncd.log

[Example]
        path = /home/Example
        comment = An Example

-- 
      Rafael
