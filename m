Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id D46E04857
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 10:05:07 -0600 (MDT)
To: =?ISO-8859-1?Q?Bruno_L=E9on?= <nonolemono@yahoo.fr>
Subject: Re: [parisc-linux] Only serial console for B1000 (64bits) ?
Message-ID: <1024502664.3d10ab88beda0@webmail.tiscalinet.be>
Date: Wed, 19 Jun 2002 18:04:24 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <200206190826.g5J8QYS31181@iut-lannion.fr> <200206190826.g5J8QYS31181@iut-lannion.fr> <200206191410.g5JEAMS03029@iut-lannion.fr>
In-Reply-To: <200206191410.g5JEAMS03029@iut-lannion.fr>
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

> 
> >>Which CD?
> The 0.9.3 iso cd downloaded from the Esiee team Website.
Well ...
> 
> >Try first 32bits kernel (till now I am running successfuly a 32bits
> pa37 on a
> b2000) with a serial console.
> I tried both kernels in fact, but none of them seem to work.
> 
> >Then may be you would like to get a more recent kernel in 64bits (see
> >ftp://ftp.parisc-linux.org/kernels/).
> I will change the kernel hopefuly, but I need to install a first one...
> ;-)
> 
> Here is the error I get on the LCD of the B1000 :
> FLT CBF4: SYS BD
> bad OS HPMC cksm 
> FLT CBFC: SYS BD 
> OS HPMC br err 
> FLT 500B: SYS BD 
> bus timeout 
> 

I could not help here (I suspect the problem of ide CD-Rom solved now)

> Another guy named "Yasholomew Yashinski" report the same error in
> february,
> but 
> I didn't understand how he solved his problem.

Do not remember but ...

> 
> I will look into netbooting perhaps.
> 

Yes, that is what I do to install my b2000 (as a copy of my b180).

But now an easiest way for you would certainly be to download a more recent
cd-image into: http://pateam.esiee.fr/cd-images/testing/
(see also explanation on http://pateam.esiee.fr/download.html#deb page)

Many progress where made since my test (about a month ago).
At least it would help you to format your disk and (if as I you do not access
internet from your b1000) a shell which would allow you to copy your b180 on
your  b1000.

I am confident that this solution will help you successfully,

Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
