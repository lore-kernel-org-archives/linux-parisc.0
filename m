Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id AC4C2482B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jul 2003 14:24:33 -0600 (MDT)
Message-ID: <3F19A776.2040001@hrzpub.tu-darmstadt.de>
Date: Sat, 19 Jul 2003 22:17:58 +0200
From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.6.0-test1-pa1 crashes on 715/100
References: <200307192012.h6JKCqCd002021@hiauly1.hia.nrc.ca>
In-Reply-To: <200307192012.h6JKCqCd002021@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

John David Anglin schrieb:

>Check the list for a kernel patch to avoid this.  The 3.2 branch has
>canonicalize_funcptr_for_compare.  Debian 3.0.4 doesn't.
>
But it was accidently compiled with gcc-3.3.1. Is this kernelpatch also 
for gcc-3.3?

>
>Dave
>  
>
