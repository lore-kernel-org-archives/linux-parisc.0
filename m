Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: PA/Linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] kernel-2.4.17-pa22 boot problem B132L+ with serial console 
In-Reply-To: Message from Thibaut VARENE <varenet@esiee.fr>
   of "Sat, 09 Feb 2002 14:47:47 +0100." <99C52A8E-1D63-11D6-BD71-0030656F07A2@esiee.fr>
References: <99C52A8E-1D63-11D6-BD71-0030656F07A2@esiee.fr> 
Date: Sat, 09 Feb 2002 23:37:14 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020210063714.D0367482A@dsl2.external.hp.com>
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
...
> Cross compiling on both machines the same kernel configured for 712 
> using serial console provided a functional kernel.

Does the B132 have a tulip card installed?

...
> CONFIG_TULIP=y
> # CONFIG_TULIP_MWI is not set
> CONFIG_TULIP_MMIO=y

IIRC, I've tried TULIP_MMIO and I don't think it worked. I tried this
out a few monthes back and left it disabled in my .config files.
I'm very certain CONFIG_TULIP_MWI didn't work. Slightly less
certain about TULIP_MMIO not working.

grant
