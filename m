Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (unknown [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2FB56482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Jul 2002 08:52:34 -0600 (MDT)
To: Stephan Trajkoff <stephan@itp.bg>
Subject: Re: [parisc-linux] cannot make kernel
Message-ID: <1027435942.3d3d6da6ab4c6@webmail.tiscalinet.be>
Date: Tue, 23 Jul 2002 16:52:22 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <20020723065037.4D5D2482C@dsl2.external.hp.com> <1027414345.3d3d19494be24@webmail.tiscalinet.be> <3D3D2383.7070708@itp.bg>
In-Reply-To: <3D3D2383.7070708@itp.bg>
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

Quoting Stephan Trajkoff <stephan@itp.bg>:

> joel.soete@freebel.net wrote:
> 
> >Quoting Stephan Trajkoff <stephan@itp.bg>:
> >
> >  
> >
> >>-------------------------------------------------------------------
> >>-->> FREE Perl CGI scripts add WEB ACCESS to your POP email accounts!
> >>-->> Download today!! http://www.adjeweb.com
> >>-------------------------------------------------------------------
> >>
> >>`gcc -print-libgcc-file-name` /usr/src/linux/arch/parisc/lib/lib.a
> >>/usr/src/linux/lib/lib.a  \
> >>        --end-group \
> >>        -o vmlinux
> >>drivers/video/video.o: In function `.L1581':
> >>drivers/video/video.o(.init.text 0x23e8): undefined reference to
> >>`fbcon_sti'
> >>drivers/video/video.o: In function `.L1639':
> >>drivers/video/video.o(.init.text 0x25d0): undefined reference to
> >>`fbcon_sti'
> >>make: *** [vmlinux] Error 1
> >>
> >>I tried to compile pa56
> >>I made make oldconfig from pa54
> >>    
> >>
> >
> >Do you try make clean after make oldconfig and before make vmlinux?
> >
> >(I also do it yesterday evening and do not met any problem)
> >
> >Joel
> >
> >
> >-------------------------------------------------
> >This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
> >_______________________________________________
> >parisc-linux mailing list
> >parisc-linux@lists.parisc-linux.org
> >http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> >
> >Man I am not stupid, make oldconfig && make dep && make clean && make 
> >
> I working with UNIX(Linux, qnx) for 4 years...
> I made apt-get dist-upgrade
> very strange dude

Hey,

I just put a question?




-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
