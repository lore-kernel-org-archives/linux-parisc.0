Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7D23A482E
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Aug 2003 00:46:46 -0600 (MDT)
Message-ID: <3F31F59F.1040608@hrzpub.tu-darmstadt.de>
Date: Thu, 07 Aug 2003 08:45:51 +0200
From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem: linux-2.6.0-test-pa6 and ssh
References: <3F31CF22.9080706@hrzpub.tu-darmstadt.de> <20030807060249.GB4979@tausq.org>
In-Reply-To: <20030807060249.GB4979@tausq.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Thanks for your help, but I already found the answer. (rtfm, or in this 
case not the manual but "The post-halloween document. v0.42" from Dave 
Jones... ;) )
When using devfs with 2.4 I didn't need to mount the devpts-fs, so I 
comment this part out in /etc/fstab. Because of the changes to devfs in 
2.5 I had to mount the devpts now. So I mounted devpts, and everything 
worked like a charm again.

Running ssh in debug mode and without mounted devpts gives:
----------SNIP------
debug1: Allocating pty.
openpty: No such file or directory
session_pty_req: session 0 alloc failed
----------SNAP-----

Ruediger

Randolph Chung schrieb:

>hm.. it seems to work for me... can you try running sshd in debug 
>mode (sshd -ddd, output goes to syslog) and see if that tells you more 
>about what's happening?
>
>randolph
>  
>
