Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (unknown [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id D66A4482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Jan 2002 02:51:13 -0700 (MST)
To: joel.soete@freebel.net
Message-ID: <1011088264.3c43fb8884707@webmail.tiscali.be>
Date: Tue, 15 Jan 2002 10:51:04 +0100 (CET)
From: joel.soete@freebel.net
Cc: debian-hppa@lists.debian.org, debian-x@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
References: <1011035188.3c432c3424792@webmail.tiscalinet.be>
In-Reply-To: <1011035188.3c432c3424792@webmail.tiscalinet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Solved with kernel 2.4.17-pa11 (was Re: Xfce -3.8.12b error)
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

Hi all,

Quoting joel.soete@freebel.net:

> Hi all,
> 
> 
> xfwm message (type SessionInit):  X Session Manager not available
> Using builtin session management instead
> 
> aaaa: 1000 1000 1000
> Gdk-ERROR **: BadAccess (attempt to access private resource denied)
>   serial 320 error_code 10 request_code 129 minor_code 3
> Gdk-ERROR **: BadAccess (attempt to access private resource denied)
>   serial 321 error_code 10 request_code 129 minor_code 3
> 
> What ever the kernel I used (2.4.9 or 2.4.17-pa6).

Against all odds, the error is solved with kernel 2.4.17-pa11.

Have nice day too,
       Joel

> 
> I also notice that if I remove .xsession and .xfce then re-run
> xfce_setup, the
> .xsession is not recreated.
> 
> Thanks in advance for help,
>         Joel
> 
> 
> -------------------------------------------------
> This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
> 


-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
