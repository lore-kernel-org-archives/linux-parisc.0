Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Matthias Klose <doko@cs.tu-berlin.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] disk I/O error 
In-Reply-To: Message from Matthias Klose <doko@cs.tu-berlin.de>
   of "Fri, 01 Mar 2002 01:24:58 +0100." <15486.51802.168431.29867@gargle.gargle.HOWL>
References: <15486.51802.168431.29867@gargle.gargle.HOWL> 
Date: Thu, 28 Feb 2002 21:41:58 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020301044158.4E0404830@dsl2.external.hp.com>
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

Matthias Klose wrote:
> ok, seems that the root fs is damaged after some locks and following
> resets. For the reinstallation, which kernel should be used on a A500? 
> I Tried 2.4.17-64-smp, 2.4.16-64-smp, 2.4.17-64 and
> 2.4.16-64. However, the machine locks up after three, maybe four days.

You can try ftp://ftp.parisc-linux.org/kernels/a500/2.4.17-pa23.tgz

this seems to be fairly stable on my a500. And it has ext3
builtin so you can use it on your root filesystem.

I can say that 2.4.18-pa0 is *not* stable with CONFIG_SMP on A500.
It only runs a few hours before locking up.
We suspect issues with do_gettimeofday() (iirc).

grant
