Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA05690
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Dec 2000 06:22:44 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 21 Dec 2000 13:25:44 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 1C557B005; Thu, 21 Dec 2000 13:19:24 +0000 (GMT)
Date: Thu, 21 Dec 2000 13:19:24 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: glibc and ptrace
Message-ID: <20001221131924.V2554@linuxcare.com>
References: <20001219182257.O7166@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001219182257.O7166@linuxcare.com>; from rhirst@linuxcare.com on Tue, Dec 19, 2000 at 06:22:57PM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Dec 19, 2000 at 06:22:57PM +0000, Richard Hirst wrote:
> I have a problem with ptrace.  The ptrace syscall for PTRACE_PEEK*
> saves the result in *data (4th arg), whereas the man page says
> it returns the result as the return value, and the 4th arg is
> ignored.  userland things, like strace for example, expect the
> man page behaviour.  I assumed glibc should be providing a wrapper
> to translate from kernel to userland syntax, but our glibc doesn't
> appear to do so.

Turned out I had to fix glibc to use the wrapper on parisc.  This
means our strace source will be broken for new glibc builds.  I'll
fix strace once the glibc change propagates through.  If anyone
wants to fix their own strace for testing, just remove the raw_ptrace
stuff from strace/defs.h

Richard
