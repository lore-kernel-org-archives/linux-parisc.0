Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 69512485E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 27 Apr 2003 17:28:35 -0600 (MDT)
Date: Sun, 27 Apr 2003 15:34:55 -0700
From: Randolph Chung <randolph@tausq.org>
To: Alexander Gabert <pappy@nikita.ath.cx>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] -fPIC position independent code on parisc
Message-ID: <20030427223455.GF25257@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030427200418.GA30929@nikita.ath.cx> <20030427201219.GE25257@tausq.org> <20030427231210.GA31520@nikita.ath.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030427231210.GA31520@nikita.ath.cx>
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

(Please reply on list and not via private mail)

> i do not understand the "LR'" syntax
[etc]

Try
http://docs.hp.com/cgi-bin/onlinedocs.py?mpn=92432-90012&service=hpux&path=00/00/19&title=HP%20Assembler%20Reference%20Manual

> it has been linked already, how do i find out, where it is resolved?

After you link an application, you can disassmble the executable.

> but what with those LR' RR' LT' RT'

They are all part of the assembler operators for field selection.

> linkage table pointer?
> what is this? (i am new)

There are several documents that describe the PA runtime linked on the
parisc-linux website. You might want to check them out. The ELF
specification, together with the related architecture supplements, 
describe how relocations work.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
