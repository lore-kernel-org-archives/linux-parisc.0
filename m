Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 94F384856
	for <parisc-linux@parisc-linux.org>; Sat,  9 Aug 2003 10:39:32 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19lWkd-00008l-7O; Sat, 09 Aug 2003 17:39:31 +0100
Date: Sat, 9 Aug 2003 17:39:31 +0100
From: Matthew Wilcox <willy@debian.org>
To: bame@hp.com
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.5 -> 2.6 tree switch tomorrow
Message-ID: <20030809163931.GD3169@parcelfarce.linux.theplanet.co.uk>
References: <20030806184826.GA11934@ldl.fc.hp.com> <20030807171149.B2A7A7306A@fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030807171149.B2A7A7306A@fc.hp.com>
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

On Thu, Aug 07, 2003 at 11:11:48AM -0600, bame@hp.com wrote:
> The linux-2.6 tree is now ready for business and the linux-2.5 tree is
> frozen.  Tarball (which could be used to seed a CVS tree) and patch
> at the usual place:
> 
>     http://cvs.parisc-linux.org/download/linux-2.6/
> 
> FYI We are using a different CVS branch architecture which should be
> completely transparent most of the time.  I'll get a description of
> it out soon.

OK.  Some files were missing from the initial import, so I added them.

However, I can't get a linus branch out of it:

willy@palinux:~/merge$ cvs -Q co -rlinus linux-2.6
willy@palinux:~/merge$ find linux-2.6
linux-2.6
linux-2.6/CVS
linux-2.6/CVS/Root
linux-2.6/CVS/Repository
linux-2.6/CVS/Entries
linux-2.6/CVS/Tag
willy@palinux:~/merge$ cat linux-2.6/CVS/Tag 
Tlinus

I suspect this will hinder using cvs-import to add 2.6.0-test3.
Can you help?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
