Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7357C48C1
	for <parisc-linux@parisc-linux.org>; Sun, 12 Oct 2003 05:48:36 -0600 (MDT)
Message-ID: <3F893F92.4060606@tiscali.be>
Date: Sun, 12 Oct 2003 11:48:34 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: parisc-linux@parisc-linux.org
References: <3F8739E2.2050205@tiscali.be>
In-Reply-To: <3F8739E2.2050205@tiscali.be>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Re: k-2.6.0-test7-pa5: failled 2 pass
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


Joel Soete wrote:
> Hi pa,
> 
> I 'make defconfig' then 'make vmlinux' on a fresh cvs tree and obtain a 
> vmlinux :)
> 
> As working on a c110 I just forget to change ccio-dma.c parameter and so 
> just do this change and 'make vmlinux'.
> This failled:
> hpalin:/Debian-apt/SRC/linux-2.6.0-test7-pa5# make vmlinux
> Making user->usr/include/linux 
> symlink
> ln: `include/user': File exists
> make: *** [include/user] Error 1
> 
> thanks in advance,
>    joel
> 
hmm

Even after a distclean, I got same message when I retry 'make vmlinux'?

Finaly, just remove manually include/user and include/user-asm help.

Cheers,
	Joel
