From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Wed, 6 Apr 2005 16:28:00 -0400
Message-ID: <20050406202800.GC1833@baldric.uwo.ca>
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
> Does this help?

It helps in the sense that we can distill the testcase down futher. It's
clearly some race in the resume suspend path, but the problem eludes me
right now.

Distilling this into a non-linuxthread testcase is the utmost priority.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
