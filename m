From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] gettimeofday() issue on D270
Date: Sun, 27 Aug 2006 15:31:07 -0400
Message-ID: <119aab440608271231j3856ea27h7c03e1c9722ae7e1@mail.gmail.com>
References: <20060827151741.fe94122d.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "Guy Martin" <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060827151741.fe94122d.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 8/27/06, Guy Martin <gmsoft@tuxicoman.be> wrote:
> I have an issue on my D270 with gettimeofday(). It looks like it's returning the time added with a few amount of seconds (usually 27) each now and then when there is some load on the system.
>
> I've made a simple test program :
>         while(gettimeofday(&tv, NULL) == 0) {
>                 printf("Time : %d sec, %d usec\n", tv.tv_sec, tv.tv_usec);
>                 sleep(1);
>         }
>

I tried this on my a500 and c3k but failed to reproduce the problem.
Can you reproduce the problem consistently on your c3600?
If you can, could you add a 'printk' to the time routines, try to get
the kernel to print out the same sequence so we can rule out userspace
interactions.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
