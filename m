Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id A2F194829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 08:11:32 -0600 (MDT)
Message-Id: <200208291411.g7TEBSpG023843@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb
To: jsoe0708@tiscali.be
Date: Thu, 29 Aug 2002 10:11:28 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3D53B3B700008549@ocpmta1.be.tiscali.com> from "jsoe0708@tiscali.be" at Aug 29, 2002 11:22:45 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> So I put a break early in main (Ok), relaunch run and try now to insert
> a breack in gdb window:
> b *0x4020a0e3
> 
> Accepted but when 'continue' is launch:
> warning: Cannot insert breakpoint 2:
> Cannot access memory at address 0x4020a0e3
> 
> What do I wrong or what should I better do?

Nothing.  You tried to set a break in a share library that hasn't been
loaded.  I don't have a great solution but the following should work.
Export LD_BIND_NOW so that ld.so binds symbols at program startup.  Then,
put a break on main and start the program.  You should then be able to
set a break in a shared library or enable it if the above error occurred.
For example, when you hit the break at main,

  enable 2

should insert the above.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
