Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA07557
	for <parisc-linux@puffin.external.hp.com>; Sat, 16 Sep 2000 18:33:13 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 17 Sep 2000 00:33:44 -0000
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com, debian-hppa@lists.debian.org
Subject: Re: New Cross-Compiler, userspace tarballs, and Debian packages (was Re:  [parisc-linux] Shared native toolchain (and Perl) uploaded, dpkg tarball,  Debian packages)
References: <87r96mgk4b.fsf@linuxcare.com>
	<20000916013748.AA92137D06@carmen.fc.hp.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 16 Sep 2000 20:20:10 -0400
In-Reply-To: Matt Taggart's message of "Fri, 15 Sep 2000 19:37:48 -0600"
Message-ID: <87em2jj2dh.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matt Taggart <taggart@carmen.fc.hp.com> writes:

> and I have added debs for all the things I've been cross compiling that David 
> has not build native debs for.

I went and made this apt-able.  (Yes, we have apt now, you need the
latest glibc and gcc tarballs to run it though).  The correct
sources.list invocation for it is:

deb http://puffin.external.hp.com/ debian-hppa/

Matt: I put dpkg-scanpackages and other dpkg programs and libs in
~dhd/{bin,lib}, if you want to use them.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
