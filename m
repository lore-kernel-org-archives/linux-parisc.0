Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id A090D4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Oct 2002 09:29:13 -0600 (MDT)
Date: Tue, 22 Oct 2002 08:32:15 -0700
From: Randolph Chung <randolph@tausq.org>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] EWOULDBLOCK vs. EAGAIN
Message-ID: <20021022153215.GD22052@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <200210221524.JAA28153@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200210221524.JAA28153@udlkern.fc.hp.com>
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

> I found a bug last night where a program was expecting EWOULDBLOCK, but
> we were returning EAGAIN. The kernel returns EAGAIN, which is correct.
> However, the Gnu C library says that EWOULDBLOCK should be defined as the
> same thing. We didn't do that on parisc linux. Probably because we
> borrowed our errno's from HP-UX. But that is wrong.

jsm,

this was discussed briefly before, but no one has fixed it yet ... 
see Carlos' post on this subject:
http://lists.parisc-linux.org/hypermail/parisc-linux/9895.html

if people think that is a good solution, we can try to do it.

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
