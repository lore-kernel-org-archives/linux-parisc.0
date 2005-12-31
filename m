From: "Craig D. Lansing" <clansing@charter.net>
Subject: RE: [parisc-linux] J2240 - Almost there....
Date: Sat, 31 Dec 2005 11:21:48 -0500
Message-ID: <000f01c60e26$4ccb0f00$3401a8c0@POGO>
References: <20051231033058.GA1497@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: "'Kyle McMartin'" <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051231033058.GA1497@quicksilver.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

That worked, Thanx!!!!  I added both defxx and DEFPA to
/etc/hotplug/blacklist.d/parisc to be safe.

I am now able to boot and have completed the install.

$uname -a
Linux howlin 2.6.8-2-32-smp #1 SMP Wed Aug 24 17:55:41 UTC 2005 parisc
GNU/Linux

OK, I have a little work to do with the h/w clock, but it's a start.

As far as what cards (or anything else) are in there I don't really remember
and it is not in a really good place to access the rear panel at all :-(
I'm sure of 2x CPUs, 2 FWSCSI 9GB HDD, DDS 3 Tape, Toshiba CD-ROM, and
probably redundant Ethernet/FDDI cards.  Unfortunately, the system + console
on top of it weight in at what feels like a ton :-)  If I could remember the
root password (ergh!), I could poke around in SAM on the HP-UX partition.
It boots to CDE, but I can't remember a single login.  The J2240 was a gift
from a client who was an HP shop and was bought by a BigBlue company.  They
gradually had to get rid of their HP equipment.  They called me one day
several years ago and said they were going to throw away this J2240 and the
HP p1120 console (brand new... 1 day old) and I could have it... so I took
it.  Be careful what you ask for.........


-----Original Message-----
From: Kyle McMartin [mailto:kyle@mcmartin.ca] 
Sent: Friday, December 30, 2005 10:31 PM
To: Craig D. Lansing
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] J2240 - Almost there....

On Fri, Dec 30, 2005 at 10:16:59PM -0500, Craig D. Lansing wrote:
> I tried adding "single" to various parts of the PALO command line.  No
luck.
> Since the error at least looks like it is related to the FDDI card, I
> re-installed using the other NIC as my primary (eth1).  No difference.
>

Bah. Instead of single use "init=/bin/sh" and run mount -o remount,rw /
to remount your root fs read-write, then follow the same step.

Definitely sounds like an HPMC because of a bad driver. What types
of expansion card do you have in that thing?

[You really shouldn't just throw it out, it's quite a nice box...]

Cheers,
	Kyle 

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
