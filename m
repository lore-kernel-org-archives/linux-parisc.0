Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id A7DEC4A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Feb 2001 09:39:20 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 4327AB005; Thu, 15 Feb 2001 16:38:58 +0000 (GMT)
Date: Thu, 15 Feb 2001 16:38:58 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] pipes
Message-ID: <20010215163858.C1374@linuxcare.com>
References: <Pine.LNX.4.21.0102100106450.27808-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0102100106450.27808-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Sat, Feb 10, 2001 at 02:29:50AM +1100
List-ID: <linux-parisc.vger.kernel.org>

Is this still a problem?

On Sat, Feb 10, 2001 at 02:29:50AM +1100, Alan Modra wrote:
> Would anyone like to hazard a guess as to whether pipes work OK?
> 
> The fixincludes problem I'm seeing with devel branch gcc builds looks like
> a loss of data in a pipe.  fixincl does a fairly standard trick of opening
> a pipe(2) to a fork & exec'd shell, and by putting a little debugging code
> in I see some fishy commands in the shell.
> 
> Good debug info looks like:
> 
> ==
> case hppa-unknown-linux-gnu in
> *-*-sysv4* | \
> i?86-*-sysv5* | \
> i?86-*-udk* | \
> i?86-*-solaris2.[0-4] | \
> powerpcle-*-solaris2.[0-4] | \
> sparc-*-solaris2.[0-4] )
>     echo run ;;
> * ) echo skip ;;
> esac
> ==
> cd /usr/include
> case hppa-unknown-linux-gnu in
> *-*-sysv4* | \
> i?86-*-sysv5* | \
> i?86-*-udk* | \
> i?86-*-solaris2.[0-4] | \
> powerpcle-*-solaris2.[0-4] | \
> sparc-*-solaris2.[0-4] )
>     echo run ;;
> * ) echo skip ;;
> esac
> 
> echo
> echo ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd
> 
> where the first hunk of text between `=='s is wrapped in
> `cd /usr/include' .. `echo funky stuff' and plugged into the pipe.  The
> hunk of text after the second `==' is what the shell reads from the pipe.
> Everything works as expected for a while, and then we get
> 
> ==
> file=sys/stat.h
> if ( test  -r types/vxTypesOld.h ) > /dev/null 2>&1
> then echo TRUE
> else echo FALSE
> fi
> ==
> cd /usr/include
> file=sys/stat.h
> if ( test  -r types/vxTypesOld.h ) > /dev/null 2>&1
> then echo TRUE
> else echo FALSE
> fi
> d
> 
> Oops, did we just lose 41 chars?

Interesting that the loss is from the start of the wrapper text.  Is
the wrapping done in a local buffer and the whole lot written as one
operation to the pipe?  Or is it three seperate writes?

> Unfortunately, I'm not sure where the loss happens.  When I tried to
> "strace -f -s 256 ...", I ran into

Yes, strace -f doesn't seem to work.  I plan to look at that rsn.

Richard
