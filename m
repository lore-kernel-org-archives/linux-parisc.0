From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] J2240 - Almost there....
Date: Fri, 30 Dec 2005 22:30:58 -0500
Message-ID: <20051231033058.GA1497@quicksilver.road.mcmartin.ca>
References: <20051230200924.GA3556@tachyon.int.mcmartin.ca>
	<000301c60db8$ab35c850$3401a8c0@POGO>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "Craig D. Lansing" <clansing@charter.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <000301c60db8$ab35c850$3401a8c0@POGO>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Dec 30, 2005 at 10:16:59PM -0500, Craig D. Lansing wrote:
> I tried adding "single" to various parts of the PALO command line.  No luck.
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
