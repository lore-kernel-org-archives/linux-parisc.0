From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Wed, 6 Apr 2005 16:25:17 -0400
Message-ID: <20050406202517.GB1833@baldric.uwo.ca>
References: <20050405060051.GJ1833@baldric.uwo.ca>
	<200504062012.j36KCW74007167@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504062012.j36KCW74007167@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Apr 06, 2005 at 04:12:31PM -0400, John David Anglin wrote:
> > I found another program that doesn't work on hppa. This one was written
> > by Randolph if my memory serves me correctly. I'll have to add it to the
> > userspace tests that fail.
> > 
> > ---
> > all: foo.c libfoo.c
> > 	gcc -g -shared -c libfoo.c
> > 	rm -f libfoo.so
> > 	ln -s libfoo.o libfoo.so
> > 	gcc -g -o foo foo.c -lfoo -L. -lpthread
> > 
> > clean:
> > 	rm -f *.o
> > 	rm -f *.so
> > 	rm -f foo
> 
> The test can be simplified.  You don't need libfoo.  Just
> link foo with -lpthread and it fails.
> 
> I see libtcl8.4 is linked against libpthread.so.  This is probably
> why 8.3 works better than 8.4.
> 
> dave@hiauly6:~/gcc_test/pthr/carlos$ ./foo
> Parent = 24778
> Exiting on signal from child
> Waited for child 24779
> Quit (core dumped)
> 
> (gdb) bt
> #0  __unregister_atfork (dso_handle=0x40184b58)
>     at ../linuxthreads/sysdeps/unix/sysv/linux/unregister-atfork.c:28
> #1  0x4016ede0 in __pthread_wait_for_restart_signal (self=0x40184b80)

I just want to comment first that in Randolph's testcase we are also
waiting for a restart signal as we are here, but we never receive the
signal.

We tracked this down to some "dequeue" from the signal waiting queue
that just seemed to return zero as if the thread had already been
dequeued. Perhaps this *is* all just a sign of missing atomic
operations.

I'm adding them in right now, I'll run this test under the new glibc and
see what happens.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
