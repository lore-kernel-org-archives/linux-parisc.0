From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Looking at vfprintf.c and alloca.
Date: Tue, 18 Jul 2006 22:48:47 -0400 (EDT)
Message-ID: <200607190248.k6J2mlLd015855@hiauly1.hia.nrc.ca>
References: <44BD0369.3090905@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org (Randolph Chung)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <44BD0369.3090905@tausq.org> from "Randolph Chung" at Jul 18,
	2006 11:51:05 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I tried this with both old (gcc-3.[34]) and new gcc (gcc-4.[01]) and i 
> don't think this works....
> 
> tausq@riot:~$ cat alloca.c
> #include <alloca.h>
> #include <stdio.h>
> 
> int main(int argc, char **argv)
> {
>          int *old;
>          int *ptr = alloca(100 * sizeof(int));
> 
>          old = ptr;
> 
>          ptr = alloca(100 * sizeof(int));
> 
>          printf("ptr = %p\nold = %p\n&old[100] = %p\n", ptr, old, 
> &old[100]);
>          return 0;
> }
> tausq@riot:~$ gcc-4.1 -Wall -o alloca alloca.c; ./alloca
> ptr = 0xc04ca590
> old = 0xc04ca3d0
> &old[100] = 0xc04ca560

What doesn't work?  ptr - old = 0x1c0 = 7 * 64.  The preferred
stack boundary is 64 bytes.  6 * 64 = 384 bytes.  That's too
small for the requested allocation.  &old[100] - old = 0x190 = 400.
So, the results printed appear correct.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
