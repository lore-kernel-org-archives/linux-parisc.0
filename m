Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9BE38482C
	for <parisc-linux@parisc-linux.org>; Wed, 12 Dec 2001 11:03:12 -0700 (MST)
Message-Id: <200112121758.KAA11468@puffin.external.hp.com>
To: jheumann@fonts.de
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] [test] PA-RISC Linux 0.9.3 
In-Reply-To: Message from "Jan Heumann" <jheumann@fonts.de>
   of "Wed, 12 Dec 2001 13:19:19 GMT." <200112121319.AA3146187070@mail.fonts.de>
Date: Wed, 12 Dec 2001 10:58:19 -0700
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

"Jan Heumann" wrote:
> I have test the PA-RISC Linux 0.9.3-RC6.
...
> in the packages are a bug. by selecting with tasksel can the installation 
> frozen. i have use unix-server, web-server and c-developer and it is not 
> frozen. i have selected all packages and the installation is frozen.

Not sure this is the same bug: zsh pre-removal script hangs.

Workaround was to kill -9 that process. apt-get will
try the *new* pre-remove script and that didn't "hang".
"New" == zsh_4.0.4-7_hppa.deb
Don't know offhand what "old" was but I think it was
it's immediate predecessor.

grant
