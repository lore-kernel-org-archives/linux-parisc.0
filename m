From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] 64-bit kernel broken.
Date: Thu, 8 Feb 2007 19:43:14 -0500
Message-ID: <20070209004314.GE18899__30614.8784970448$1416624275$gmane$org@athena.road.mcmartin.ca>
References: <119aab440702061420w2b5ab788g815313761f440bc9@mail.gmail.com>
	<20070209003302.GD18899@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070209003302.GD18899@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Feb 08, 2007 at 07:33:02PM -0500, Kyle McMartin wrote:
> On Tue, Feb 06, 2007 at 05:20:18PM -0500, Carlos O'Donell wrote:
> > Run this test:
> > http://www.parisc-linux.org/~carlos/tst-sigqueue.c
> > 
> > On a 32-bit userspace, with a 64-bit 2.6.18 kernel and the test exits with 
> > 0.
> > 
> > carlos@firin:~$ ./tst-sigqueue
> > in f
> > pid = 1429
> > new thread: 1429
> > carlos@firin:~$ echo $?
> > 0
> > 
> > Run it with a 64-bit 2.6.20 kernel and you get an error.
> > 
> > carlos@firin:~$ ./tst-sigqueue
> > in f
> > pid = 31148
> > new thread: 31148
> > expected PID 31148, got si_pid 1000
> > carlos@firin:~$ echo $?
> > 1
> > 
> 
> Right. This got inadvertantly reverted with some other stuff. Fixed in a
> second.

Fixed in 1736b4bbf2bbfebaad06114d569f3617517524d1.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
