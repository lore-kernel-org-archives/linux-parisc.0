Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Tom <palinux@alaskatech.org>
Cc: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Oops... 
In-Reply-To: Message from Tom <palinux@alaskatech.org>
   of "Wed, 26 Dec 2001 20:01:07 -0900." <Pine.LNX.4.33.0112261956090.3248-100000@goliath.alaskatech.org>
References: <Pine.LNX.4.33.0112261956090.3248-100000@goliath.alaskatech.org> 
Date: Thu, 27 Dec 2001 09:40:45 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20011227164045.45E9F4831@dsl2.external.hp.com>
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

Tom wrote:
> Perhaps I spoke too soon about -pa24 being good. After compiling and
> rebooting with -pa24, then an apt-get update/dist-upgrade, make no longer
> works.

Could you check if make was replaced or one of it's libs?
"debsums -s" would be another good thing to check.
FWIW, make works fine for me with all the recent kernels (if they booted).

> Any ideas how to troubleshoot this one?

Reboot the older kernel and run "debsums -s" would be my first step.

grant
