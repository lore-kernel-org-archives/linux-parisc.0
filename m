Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA19614
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Jan 2001 15:50:54 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 22 Jan 2001 22:54:44 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 0118EB005; Mon, 22 Jan 2001 22:45:03 +0000 (GMT)
Date: Mon, 22 Jan 2001 22:45:03 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Christoph Plattner <christoph.plattner@dot.at>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: Further (build ?): [parisc-linux] strace ??? - is there any ???
Message-ID: <20010122224503.U3571@linuxcare.com>
References: <200101221502.f0MF2kO05633@openbsd1.buttafuoco.net> <20010122151515.N3571@linuxcare.com> <3A6C7686.1FC5F754@dot.at> <3A6C918B.A6287A24@dot.at> <20010122201517.P3571@linuxcare.com> <3A6CA970.7F8F82DF@dot.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A6CA970.7F8F82DF@dot.at>; from christoph.plattner@dot.at on Mon, Jan 22, 2001 at 10:43:12PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jan 22, 2001 at 10:43:12PM +0100, Christoph Plattner wrote:
> Hallo Mr Hirst !
> 
> Now I have following problem. What is the clean
> way to build such autoconfigured tool cross ?

HOSTCC=gcc CC=hppa-linux-gcc ./configure --target=hppa-linux --host=hppa-linux
make


worked for me, except for a problem with redefinition of struct dirent64.
I hacked that out of /opt/palinux/hppa-linux/include/linux/dirent.h to
temporarily get round it.

I havn't checked the binary works.  You might have to remove a chunk
of code from strace/defs.h, depending on how new your glibc is.  With
a new glibc you need to remove the following block:

  /* Hack until I figure out why we don't call ptrace in glibc, rather
   * than the system call direct.
   */
  static inline long raw_ptrace(int req, pid_t pid, void *addr, long data)
  {
          long res, ret;
  
          if (req > 0 && req < 4)
                  data = (long)&ret;
          res = ptrace(req, pid, addr, data);
          if (res >= 0 && req > 0 && req < 4) {
                  errno = 0;
                  return ret;
          }
          return res;
  }
  
  #define ptrace raw_ptrace


Richard
