Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA22754
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 21:02:33 -0700
Received: from hse-ottawa-ppp237516.sympatico.ca (HELO localhost.linuxcare.com) (64.230.77.77)
  by mailserv2.iuinc.com with SMTP; 26 Jan 2001 04:06:28 -0000
Received: by localhost.linuxcare.com (Postfix, from userid 501)
	id 4309F261; Fri, 26 Jan 2001 00:07:12 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by localhost.linuxcare.com (Postfix) with ESMTP
	id B1153AB70; Fri, 26 Jan 2001 00:07:12 -0800 (PST)
Date: Fri, 26 Jan 2001 00:07:12 -0800 (PST)
From: dkennedy <dkennedy@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] CPU detection wrong 
In-Reply-To: <200101260024.QAA22790@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0101260002130.3746-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 25 Jan 2001, Grant Grundler wrote:

> Matthew Wilcox wrote:
> > we have the following entry in hardware.c:
> > 
> >         { 0x05c0, 0x0fc0, pcxw   },  /* 0x05c0 - 0x05ff */
> 
> David (Kennedy),
> You have time to fix the table based on the "Appendix B" data below?

Done.  I have committed it.  I don't have a PA box near me.  Can someone
check my change to:
	- ensure it compiles
	- it correctly detects all the machines old and new.

> In the long run, I don't want to be involved in maintaining this table.
> An easier way to determine processor type is based on CPU and FP-Coproc
> MODEL information. Our kernel queries for both now and it's just a
> matter of putting it to use.

I don't mind maintaining this table.  It would be goot to keep this table 
and the hardware database in sync.

I will make sure that the hardware database is updated accordingly.

-- 
David Kennedy, Technical Account Manager, Linuxcare, Inc.
613.562.9594 tel, 613.562.9304 fax
dkennedy@linuxcare.com, http://www.linuxcare.com/
Linuxcare.  Support for the revolution.
