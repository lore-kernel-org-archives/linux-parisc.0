Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id B04D04830
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Jun 2002 00:26:08 -0600 (MDT)
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-3.2 failed to compile kernel
Message-ID: <1025159126.3d1aafd6bb544@webmail.tiscalinet.be>
Date: Thu, 27 Jun 2002 08:25:26 +0200 (CEST)
From: joel.soete@freebel.net
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <200206261621.g5QGLPH2012238@hiauly1.hia.nrc.ca>
In-Reply-To: <200206261621.g5QGLPH2012238@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Quoting John David Anglin <dave@hiauly1.hia.nrc.ca>:

> > joel.soete@freebel.net wrote:
> > > In file included from pacache.S:44:
> > > /Develop/parisc-linux/src/linux-2.4.18-pa40/include/asm/cache.h:9:
> 1/config.h
> > >   :
> > > No such file or directory
> > 
> > The offending line is:
> >       8 #include <linux/config.h>
> > 
> > I'll assume "linux" being #define'd to 1.
> > gcc predefines perhaps?
> 
> Yes, the predefine is standard and is present in gcc 3.0.4, etc.  You
> can
> see macro defines using the "-dM -E" option.

Oops,  gcc -E ... works well and give the expect results (if I do a link
1->linux) but gcc -dM -E ... SegFault :((

# gcc -dM -E -D__ASSEMBLY__ -traditional -D__KERNEL__
-I/Develop/parisc-linux/src/linux/include  -c -o pacache.CPP pacache.S
In file included from /Develop/parisc-linux/src/linux/include/asm/assembly.h:31,
                 from pacache.S:44:
/Develop/parisc-linux/src/linux/include/asm/offset.h:3: unterminated #ifndef
cc1: internal compiler error: internal error: Segmentation fault

> 
> However, the macro should not be expanded inside <> or "".  Joel, can
> you
> file a PR <http://gcc.gnu.org/cgi-bin/gnatsweb.pl>?
> 

For the first problem ("linux" #define 1) here is the references:
----- Forwarded message from gcc-gnats@gcc.gnu.org -----
Date: 27 Jun 2002 06:16:00 -0000
From: gcc-gnats@gcc.gnu.org
Reply-To: gcc-gnats@gcc.gnu.org,nobody@gcc.gnu.org
Subject: Re: c/7138: gcc-3.2 failed to compile kernel
To: joel.soete@freebel.net

Thank you very much for your problem report.
It has the internal identification `c/7138'.
The individual assigned to look at your
report is: unassigned.

>Category:       c
>Responsible:    unassigned
>Synopsis:       gcc-3.2 failed to compile kernel
>Arrival-Date:   Wed Jun 26 23:16:00 PDT 2002


----- End forwarded message -----

Would I have to assign it to you?
Thanks for all,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
