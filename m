Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D1344883
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Aug 2003 10:13:41 -0600 (MDT)
Date: Fri, 22 Aug 2003 09:16:59 -0700
From: Randolph Chung <randolph@tausq.org>
To: almetoil@tatneft.ru, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: palo
Message-ID: <20030822161659.GE21328@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <1245099799.20030822174107@tatneft.ru> <20030822160820.GA18112@ldl.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030822160820.GA18112@ldl.fc.hp.com>
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

> >   Please help me cvs download palo !
> >   Please sorry my english
> > 
> >   I am use this and read error messges:
> >     user@panda:~/palo$ cvs -d :pserver:guest@cvs.parisc-linux.org:/ checkout palo
> >     cvs checkout: warning: failed to open /home/user/.cvspass for reading: No such file or directory

touch ~/.cvspass
then follow the directions at http://www.parisc-linux.org/faq/cvs.html
for anonymous CVS access.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
