Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtppop3pub.verizon.net (smtppop3pub.gte.net [206.46.170.22])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0DC9B482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 Nov 2001 21:18:13 -0700 (MST)
Received: from verizon.net (pool-151-201-224-254.pitt.east.verizon.net [151.201.224.254])
	by smtppop3pub.verizon.net  with ESMTP
	for <parisc-linux@lists.parisc-linux.org>; id WAA56850923
	Wed, 14 Nov 2001 22:17:51 -0600 (CST)
Message-ID: <3BF3427D.3060304@verizon.net>
Date: Wed, 14 Nov 2001 23:20:13 -0500
From: Rafael Herrera <vze26vn8@verizon.net>
Reply-To: raffo@neuronet.pitt.edu
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: rsync for CVS repository
References: <200111150105.SAA09926@puffin.external.hp.com>  <3BF31CD7.3080405@verizon.net> <m164CYT-000PwuC@bame.riverrock.org>
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

Paul Bame wrote:

> 6. Answer questions from people who don't know how to use rsync or
>    who have problems.  Some people will try it because it's there, not
>    because it is useful for them.


I use this command:

cd /your/localCVScopy/      
rsync -avzc --progress --stats thepalinux.host.com::Example .


will retrieve the Example directory in archive and compressed mode, a 
little verbose too. Note that this will overwrite any modified file you 
have in your tree.

-- 
      Rafael
