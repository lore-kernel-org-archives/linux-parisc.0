Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tentakel.fischlustig.de (pD9001DD3.dip.t-dialin.net [217.0.29.211])
	by dsl2.external.hp.com (Postfix) with SMTP id 8D699482B
	for <parisc-linux@parisc-linux.org>; Sat, 27 Oct 2001 19:36:57 -0600 (MDT)
Subject: Re: [parisc-linux] WARNING: DO NOT APT-GET UPGRADE HPPA
From: andi <andi@fischlustig.de>
To: andi <andi@fischlustig.de>
Cc: Matt Taggart <taggart@carmen.fc.hp.com>,
	parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
In-Reply-To: <1004225524.624.6.camel@cube>
References: <20011026182706.2800037FD7@carmen.fc.hp.com>
	<1004225524.624.6.camel@cube>
Content-Type: text/plain
Date: 28 Oct 2001 02:38:04 +0100
Message-Id: <1004233084.1307.6.camel@cube>
Mime-Version: 1.0
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

On Sun, 2001-10-28 at 01:32, andi wrote:
> On Fri, 2001-10-26 at 20:27, Matt Taggart wrote:
> > As PeteM and others have discovered, upgrading your hppa box currently breaks 
> > a *lot*.
> 
> 
> Every program that is linked agains gtk+ segfaults, no matter if it uses
> gtk or not. It seems to be a linker problem.

2.2.4-4 fixes that problem. python however is still broken.

andi
