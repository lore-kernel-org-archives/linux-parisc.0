Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0A18B4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Apr 2003 00:17:06 -0700 (MST)
Subject: Re: [parisc-linux] PDC console problem.
From: Ryan Bradetich <rbradetich@uswest.net>
To: knaresh@india.hp.com
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3E89DBF4.102AC68A@india.hp.com>
References: <3E89DBF4.102AC68A@india.hp.com>
Content-Type: text/plain
Message-Id: <1049181423.24319.17.camel@beavis.ybsoft.com>
Mime-Version: 1.0
Date: 01 Apr 2003 00:17:04 -0700
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

> I was going through some of the FAQ and the mailing list archive and
> understand that the PDC console is not a full blown console and can only
> display output. Is is true that the PDC console cannot accept keyboard
> input? Or am I missing something?

Hmm.. The pdc_console has both read and write capabilities.  We used the
PDC console for K/E class systems before the SerialMux driver was
written.  I am not familiar with the PDC simulator, but I would be
willing to test the pdc console again on K-Class.

Which kernel are you using?

Thanks,

- Ryan


-- 
Ryan Bradetich <rbradetich@uswest.net>
