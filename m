Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id D4FD1482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Jan 2002 02:41:39 -0700 (MST)
Date: Thu, 3 Jan 2002 09:32:30 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Herb Radford <herbr@magma.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem with Samba on a D370
Message-ID: <20020103093230.GA1241@sleepie.demon.co.uk>
References: <5.1.0.14.0.20020102201841.0302dec0@mail.magma.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5.1.0.14.0.20020102201841.0302dec0@mail.magma.ca>
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

On Wed, Jan 02, 2002 at 08:33:54PM -0500, Herb Radford wrote:
> OK, I'm trying to set up Samba on this D370 and have a small problem.
> SMBD daemon starts but fails with "failed to open /etc/samba/secrets.tdb".
> So I tried "strace -f smbd -D" and thats where I run out of knowledge!
> I'm including the strace output but to me it looks like something I read on 
> the Samba mailing list archives while poking about for an answer. It seems 
> that there was some problem with 64-bit vs. 32-bit parameters at one time 
> (I think in 2.2-2 which is what my version is) and I hope someone can give 
> me a few pointers. ;) I don't know if this is  a Samba problem or a Debian 
> problem so I'll just ask!
> 
> Do a search on secrets and the line in question is 8 lines later where 
> fcntl returns EINVAL for a start of -84932400??? which is 0xfaf008d0, 
> uncommonly similar to part of the LLSEEK parameter 2 line above.

"samba busted see #126763, hppa glibc problem with file locking"

Check that bug # on bugs.debian.org for more details.  There is a patch
to samba to avoid the glibc problem there, I think, but I havn't tried
it.

Richard
