Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA22390
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Nov 2000 10:06:53 -0700
Sender: drepper@cygnus.com
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SEGV signal handling bug (dynamic linking)
References: <20001117153954.H32715@linuxcare.com>
Reply-To: drepper@cygnus.com (Ulrich Drepper)
From: Ulrich Drepper <drepper@redhat.com>
Date: 17 Nov 2000 09:09:10 -0800
In-Reply-To: Richard Hirst's message of "Fri, 17 Nov 2000 15:39:55 +0000"
Message-ID: <m3hf5634qx.fsf@otr.mynet.cygnus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst <rhirst@linuxcare.com> writes:

>         mem = malloc(8192);
>         if (mem == NULL) {
>                 perror("malloc");
>                 exit(1);
>         }
>         mem = (char *)(((int)mem + 4095) & ~0x0fff);
>         res = mprotect(mem, 4096, PROT_READ);

Read the Unix standard:

  The behavior of this function is unspecified if the mapping was not
  established by a call to mmap().

-- 
---------------.                          ,-.   1325 Chesapeake Terrace
Ulrich Drepper  \    ,-------------------'   \  Sunnyvale, CA 94089 USA
Red Hat          `--' drepper at redhat.com   `------------------------
