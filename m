Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 59046482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 10:01:55 -0700 (MST)
Message-Id: <200111191657.JAA18078@puffin.external.hp.com>
To: Richard Allen <ra@hp.is>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] What does this one mean ? 
In-Reply-To: Message from Richard Allen <ra@hp.is>
   of "Mon, 19 Nov 2001 16:53:20 GMT." <20011119165320.B14821@hp.is>
Date: Mon, 19 Nov 2001 09:57:02 -0700
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

Richard Allen wrote:
> rpm still cant install outside the chrooted env. so I guess something is
> wrong in rpm..

Well, that might the clue.
Are you picking up all the binutils/glibc patches that have been
introduced recently?

I'm inclined to think its a mismatch between library versions
or something like that unless you grabbed the sources from the
debian archives.

grant
