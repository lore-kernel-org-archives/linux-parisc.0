Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4B4CE487E
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Apr 2003 11:45:15 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 1919i5-0005pF-Aq; Thu, 03 Apr 2003 19:45:13 +0100
Date: Thu, 3 Apr 2003 19:45:13 +0100
From: Matthew Wilcox <willy@debian.org>
To: Rodrigo Colao Merlo <rodrigo@tteng.com.br>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Applications in 64 bits userspace
Message-ID: <20030403184513.GH29376@parcelfarce.linux.theplanet.co.uk>
References: <200304031512.35389.rodrigo@tteng.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200304031512.35389.rodrigo@tteng.com.br>
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

On Thu, Apr 03, 2003 at 03:12:35PM -0300, Rodrigo Colao Merlo wrote:
>  Hello,
>  I work for a software company in Brazil specialized in Linux 
>  development under contract by HP.
>  
>  We're currently working in a project that needs investigate what are missing 
> in kernel to run applications in 64 bits userspace. I need only known what 
> are missing in kernel and what kernel do you recomend ? 2.4 or 2.5 ? 

Yes, Leandro from HP Brazil kept posting asking that question.
Unfortunately, he kept on asking even after he'd been given a fairly
comprehensive list of things to do, so I think people couldn't be bothered
to tell him any more.

Probably the best list of things to do would be the thread starting at
http://lists.parisc-linux.org/pipermail/parisc-linux/2003-January/018911.html

As to which kernel to base it on; most of the work is kernel-independent.
It's all about making the toolchain work properly.  There's a certain
amount of work to do in the kernel, but there's some design work to do
up-front first.  It shouldn't be hard to do it to either kernel and then
port to the other.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
