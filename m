Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id RAA24814
	for <parisc-linux@puffin.external.hp.com>; Sun, 8 Aug 1999 17:17:37 -0600
Date: Mon, 9 Aug 1999 01:18:23 +0200
Sender: mgyula@pi.satimex.tvnet.hu
From: Gyula Matics <mgyula@pi.satimex.tvnet.hu>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] utssys?
Message-ID: <19990809011823.A2864@pi.satimex.tvnet.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> Can anyone tell me what the utssys() system call does? There's no manual 
> page for it. From tusc, I can see: 
> 
> utssys("HP-UX", 0, 0) ............................................ = 0 
> 
> so all I need do to get it to work on Linux is return 0, but I'd like 
> to understand a little more. 

On Solaris it's 3 syscalls, and you have some documentation in sys/syscall.h
and sys/utssys.h. One of them is used by fuser.
Maybe you can find some info in the hpux headers?
(Can't check, no access for hpux right now)

int utssys(char *path, int flags, int type, char *obuf)

#define SYS_utssys      57
        /*
         *subcodes (third argument):
         *      uname(obuf)  (obsolete)   :: syscall(57, obuf, ign, 0)
         *                                      subcode 1 unused
         *      ustat(dev, obuf)          :: syscall(57, obuf, dev, 2)
         *      fusers(path, flags, obuf) :: syscall(57, path, flags, 3, obuf)
         *      see <sys/utssys.h>
         */

Gyula
