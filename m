From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] J2240 - Almost there....
Date: Fri, 30 Dec 2005 15:09:25 -0500
Message-ID: <20051230200924.GA3556@tachyon.int.mcmartin.ca>
References: <000101c60d58$e249ac40$3401a8c0@POGO>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "Craig D. Lansing" <clansing@charter.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <000101c60d58$e249ac40$3401a8c0@POGO>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Dec 30, 2005 at 10:51:22AM -0500, Craig D. Lansing wrote:
> defxx.c:v1.06 2003/08/04 Lawrence V. Stephani and others
> fddi%d: DEFPA at I/O addr = 0x100, IRQ = 96, Hardware addr = 58-B0-60-00-00-00

I'm going to take a stab and say this is your problem. You're likely going
to see a HPMC chassis code however this machine displays such a thing (look
up the LED code, or it should display it right on an LCD if it was one.)

[Thanks for identifying a piece of non-working hardware.]

To work around this, you have two options:

	1 - Remove the expansion card, if possible.

	2 - Boot single user, (append single to the PALO/IPL command line)
		2.1 - Edit/create /etc/hotplug/blacklist.d/parisc and
			add the module name (probably defxx) to the file.

If other modules give you grief, repeat the step to blacklist them.

I'll make sure this module doesn't get built into the kernel, the driver
is probably written non-portably, and thus fails miserably on 'odd'
hardware like parisc.

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
