Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 499FD482A
	for <parisc-linux@parisc-linux.org>; Thu, 10 May 2001 11:34:21 -0600 (MDT)
To: Charlie Navarro <charlie_navarro@yahoo.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Problems with debian instalation 
In-Reply-To: Message from Charlie Navarro <charlie_navarro@yahoo.com>
   of "Thu, 10 May 2001 09:53:02 -0300." <01051009530200.01761@diana>
References: <01051009530200.01761@diana> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 10 May 2001 11:36:58 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010510173658.12FB237CFD@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Charlie Navarro writes...

> I installed my 712/60 from palinux-0.6-32STI.iso and all OK. I had some 
> poblems with the keyboard (some sequence of key in vi, in some case fell down
> the system)

This is a known problem with STI console, but no bug was filed in the BTS. So 
I just filed one. IIRC, setting TERM to vt100 helps.

> I made a "apt-get dselect-upgrade" with out problems, with the original 
> sources.list that it came in the iso.
> Now I have the dependences problems to install gcc. cpp depends of cpp-3.0 
> but it is not installable. xbase-clients depends of cpp.

The gcc package is just a pseudopackage that depends on the right version gcc 
for the architecture, in this case gcc-3.0. Since gcc-3.0 is not yet in the 
archive it can't find the dependency. As Richard pointed out, use the debs on 
puffin.external.hp.com for now. I am working on getting those integrated and 
in the Debian archive.

> Ok, I want to run X, but I can not. I want to compile X but I don't have the 
> gcc.

XFree86 is in the Debian archive but you can't run a local Xserver yet. You 
can run apps remotely and even use Xnest. Does this answer your question?

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
