Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA26205
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 02:35:43 -0700
Received: from sleepie.demon.co.uk (HELO rhirst.linuxcare.com) (194.222.23.208)
  by mailserv2.iuinc.com with SMTP; 21 Nov 2000 09:37:47 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id E9102B005; Tue, 21 Nov 2000 09:34:42 +0000 (GMT)
Date: Tue, 21 Nov 2000 09:34:42 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] signal handling problems (32 bit kernel)
Message-ID: <20001121093442.U32715@linuxcare.com>
References: <20001120175838.Q32715@linuxcare.com> <Pine.LNX.4.21.0011211713550.15623-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0011211713550.15623-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Tue, Nov 21, 2000 at 06:05:36PM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Nov 21, 2000 at 06:05:36PM +1100, Alan Modra wrote:
> On Mon, 20 Nov 2000, Richard Hirst wrote:
> 
> > #warning XXX FIXME probably bogus -PB
> >         /* I think this is bogus -- it'll cause the first instn of the
> >          * signal handler to be executed twice!  Better might be to
> 
> Definitely bogus, as with quite a lot of iaoq manipulation in signal.c

As another example, if a process gets a signal as it is about to
execute the instr in the delay slot of a branch, it forgets that it
was supposed to be branching on return from the signal handler.  Try
compiling the following and sending it a SIGUSR1:

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>

void sig_handler(int sig)
{
}

int main()
{
        struct sigaction act;
        int i = 1;

        memset(&act, 0, sizeof(act));
        act.sa_handler = sig_handler;
        sigaction(SIGUSR1, &act, NULL);

        printf("I am %d\n", getpid());
        while (i++)
                ;
        printf("Escaped, i=%d!\n", i);
        return 0;
}


Oh, you have to run it with "LD_BIND_NOW=1 <progname>" to avoid one of
the other problems.

Time to try and work out what signal.c is really trying to do, I guess.

Richard
