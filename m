Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F0D8482C
	for <parisc-linux@parisc-linux.org>; Sat, 17 Nov 2001 00:58:22 -0700 (MST)
Message-Id: <200111170753.AAA27428@puffin.external.hp.com>
To: Sonny Cook <sonny@aspersion.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] pam/ssh seems to be whacked 
In-Reply-To: Message from Sonny Cook <sonny@aspersion.org>
   of "Sat, 17 Nov 2001 07:23:35 GMT." <Pine.LNX.4.33.0111170713360.4966-100000@lefou.zayda.com>
Date: Sat, 17 Nov 2001 00:53:34 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Sonny Cook wrote:
> Hi,
> When attempting to install gkrellm on my b132l, apt-get upgraded a number
> of other packaged including (the suspect) libc6-2.2.4-6.  Now when I
> attempt to ssh into the box, I get the following error in my logs:

hmmm..I didn't get those errors...but after apt-get upgrade I had
to manually "/etc/init.d/ssh restart" in order to login via ssh.

grant
