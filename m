Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx.rollanet.org (mailsrv.rollanet.org [192.55.114.7])
	by dsl2.external.hp.com (Postfix) with SMTP id 8F54F482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Dec 2001 11:35:13 -0700 (MST)
Message-ID: <3C15005D.4884E0C5@umr.edu>
Date: Mon, 10 Dec 2001 12:35:09 -0600
From: Nathan Neulinger <nneul@umr.edu>
MIME-Version: 1.0
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] telnetd on hppa: strange behaviour?
References: <1008007312.3c14f890e4d33@webmail.tiscalinet.be>
Content-Type: text/plain; charset=us-ascii
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

joel.soete@freebel.net wrote:
> 
> Hi all,
> 
> I use to work with a telnet connection to my hppa linux box.
> And I just notice that if I do a ls -al in a directory containing many soft
> links the telnet session stop with "connection close by foreign hosts" (and not
> with a simple ls)?
> 
> (I just do a apt-get dist-uprade but nothing has to be done. Also I assume to be
> up-to-date)
> 
> Thanks in advance for advice,
>         Joel

Get yourself a more recent kernel. That's a known problem with the
kernel on the 0.9.2 media.

-- Nathan

------------------------------------------------------------
Nathan Neulinger                       EMail:  nneul@umr.edu
University of Missouri - Rolla         Phone: (573) 341-4841
Computing Services                       Fax: (573) 341-4216
