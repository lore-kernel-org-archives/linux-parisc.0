Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] B132L+ crash with mpg123 
In-Reply-To: Message from Thibaut VARENE <varenet@esiee.fr>
   of "Tue, 17 Sep 2002 12:19:22 +0200." <3D8701AA.4040700@esiee.fr>
References: <3D8701AA.4040700@esiee.fr> 
Date: Tue, 17 Sep 2002 11:00:01 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020917170001.DA8DC4829@dsl2.external.hp.com>
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

Thibaut VARENE wrote:
> I've been experiencing several crashes on B132L+ while playing mp3s with
> mpg123, the box was then running 2.4.18-pa21.

Harmony driver definitely has some bugs.
My B180 is stable until I listen to MP3s as well.
System crashes after ~1 hour of play.

> What's worth mentionning is that files are played from a remote NFS
> filesystem. (BTW, the console shows "svc: unknown version (0)" when
> mounting the NFS system).

I'm doing everything local.

> Kernel Fault: Code=15 regs=11ddc640 (Addr=00277e00)
> 
>       YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000011000000000000001111 Not tainted
> r00-03  00000000 00000023 101feac4 00000200
...
> IASQ: 00000000 0000000 IAOQ: 10263c78 10263c70
...
what symbols do 101feac4 and 10263c78 refer to?

grant
