Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 742B24864
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Jun 2002 09:24:59 -0600 (MDT)
To: =?ISO-8859-1?Q?Bruno_L=E9on?= <nonolemono@yahoo.fr>
Subject: Re: [parisc-linux] Only serial console for B1000 (64bits) ?
Message-ID: <1024586636.3d11f38c3d119@webmail.tiscalinet.be>
Date: Thu, 20 Jun 2002 17:23:56 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <200206191410.g5JEAMS03029@iut-lannion.fr> <200206190826.g5J8QYS31181@iut-lannion.fr> <200206190826.g5J8QYS31181@iut-lannion.fr> <200206191410.g5JEAMS03029@iut-lannion.fr> <200206201342.g5KDgpS12269@iut-lannion.fr>
In-Reply-To: <200206201342.g5KDgpS12269@iut-lannion.fr>
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

Quoting Bruno Léon <nonolemono@yahoo.fr>:

> >But now an easiest way for you would certainly be to download a more
> recent
> >cd-image into: http://pateam.esiee.fr/cd-images/testing/
> >(see also explanation on http://pateam.esiee.fr/download.html#deb
> page)
> 
> >I am confident that this solution will help you successfully,
> 
> Thanks for that Joel, after downloading this cd-image, I managed to
> install
> the debian system on the B1000 workstation.
> 
> However, I'm trying to install packages using apt-get and dselect, but
> none
> of the website seems to reply, or they do not accept me.
> Which url did you use to install additionnal packeges ?
>  
For my part I could not made a complete install from apt-get because I did have
connection to internet. So I used the shell to copy my b180 with nfs.

Never the less I do frequently apt-get update via following url:

deb http://ftp.de.debian.org/debian unstable main contrib non-free
deb http://ftp.de.debian.org/debian-non-US unstable/non-US main contrib non-free

Happy to help you,
	Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
