Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from iut-lannion.fr (alba.iut-lannion.fr [192.70.33.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1AE46485E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 08:10:42 -0600 (MDT)
Message-Id: <200206191410.g5JEAMS03029@iut-lannion.fr>
Date: Wed, 19 Jun 2002 16:08:32 +0200
To: joel.soete@freebel.net
From: Bruno =?iso-8859-1?Q?L=E9on?= <nonolemono@yahoo.fr>
Subject: Re: [parisc-linux] Only serial console for B1000 (64bits) ?
Cc: parisc-linux@lists.parisc-linux.org
References: <200206190826.g5J8QYS31181@iut-lannion.fr>
 <200206190826.g5J8QYS31181@iut-lannion.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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

>>Which CD?
The 0.9.3 iso cd downloaded from the Esiee team Website.

>Try first 32bits kernel (till now I am running successfuly a 32bits pa37 on a
b2000) with a serial console.
I tried both kernels in fact, but none of them seem to work.

>Then may be you would like to get a more recent kernel in 64bits (see
>ftp://ftp.parisc-linux.org/kernels/).
I will change the kernel hopefuly, but I need to install a first one... ;-)

Here is the error I get on the LCD of the B1000 :
FLT CBF4: SYS BD
bad OS HPMC cksm 
FLT CBFC: SYS BD 
OS HPMC br err 
FLT 500B: SYS BD 
bus timeout 

Another guy named "Yasholomew Yashinski" report the same error in february,
but 
I didn't understand how he solved his problem.

I will look into netbooting perhaps.

Thanks for help,
Bruno.
