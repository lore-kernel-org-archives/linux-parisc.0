Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Tom <palinux@alaskatech.org>
Cc: PA-RISC Linux List <parisc-linux@parisc-linux.org>,
	debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] Something broken in dpkg/dselect/apt? 
In-Reply-To: Message from Tom <palinux@alaskatech.org>
   of "Sat, 23 Mar 2002 20:31:58 -0900." <Pine.LNX.4.33.0203232012090.18420-100000@goliath.alaskatech.org>
References: <Pine.LNX.4.33.0203232012090.18420-100000@goliath.alaskatech.org> 
Date: Sun, 24 Mar 2002 01:20:39 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020324082040.183814844@dsl2.external.hp.com>
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
> ...Shut it down, turned it on today, and now apt-get update
> (or dselect update) fails. Updates download, then errors "Failed to fetch
> -x-  rename failed, no such file or directory" and "couldn't stat -x- -
> stat (2 no such file or directory". It then helpfully suggests that I
> rerun the apt-get udpate...

[ please follow up to debian-hppa list only ]

I see this if I happen to upgrade when I think the mirrors are getting
sync'd. Retrying a few hours later usually worked for me.
Locally, the problem time was around 12-4PM PST for debian mirrors
external to HP.

hth,
grant
