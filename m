Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4BA0B486E
	for <parisc-linux@parisc-linux.org>; Fri, 12 Jul 2002 03:49:52 -0600 (MDT)
To: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] compiling kernels with gcc-3.1
Message-ID: <1026467388.3d2ea63c0ac65@webmail.tiscalinet.be>
Date: Fri, 12 Jul 2002 11:49:48 +0200 (CEST)
From: joel.soete@freebel.net
Cc: parisc-linux@parisc-linux.org
References: <20020712073628.GB8838@tausq.org>
In-Reply-To: <20020712073628.GB8838@tausq.org>
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

Hi Randolph,

I am on going to build mirroring on my test server.
But I will test it asap (as I already cvs update gcc-3.1.. ) and let you inform.

Thanks a lot for info,
Joel 

PS: Can you do a telnet or an ssh connection when this kernel is running? IIRC
as well as gcc-3.1 as gcc-3.2, I always reach well to build and boot kernels
(without kdb) but the system crashes as soon as you try to connect it via the
network.

Quoting Randolph Chung <randolph@tausq.org>:

> I seem to recall some reports that you cannot build a working kernel
> with gcc-3.1....
> 
> Well, maybe they've changed things upstream, but I just tried with
> gcc-3.1.1 (3.1.1 20020708 snapshot) and it seems to work well, at least
> with my limited testing... this is with the debian default 64-bit smp
> .config.
> 
> I did have to hack up a bunch of code... it seems like gcc-3.1.1
> doesn't
> like this construct:
> 
> typedef struct {
>         volatile unsigned int __attribute__((aligned(16))) lock;
> } spinlock_t;
> 
> typedef struct {
>         spinlock_t lock;
>         volatile unsigned int count;
> } rwlock_t;
> 
> rwlock_t foo = (rwlock_t) { (spinlock_t) { 1 }, 0 };
> 
> it complains that the initializer is not constant in this case. 
> removing the (rwlock_t) cast fixed that....
> 
> also it doesn't like it when you have a variable and you initialize it
> after declaration with the { (spinlock_t) { 1 }, 0 } stuff...
> 
> (e.g. 
> rwlock_t foo;
> 
> foo = { (spinlock_t) { 1 }, 0 };
> 
> gives a "parse error at {" message)
> 
> after working through these problems i got a working kernel...
> 
> randolph
> --  
> Randolph Chung
> Debian GNU/Linux Developer, hppa/ia64 ports
> http://www.tausq.org/
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
