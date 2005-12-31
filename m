From: "Craig D. Lansing" <clansing@charter.net>
Subject: RE: [parisc-linux] J2240 - Almost there....
Date: Fri, 30 Dec 2005 22:16:59 -0500
Message-ID: <000301c60db8$ab35c850$3401a8c0@POGO>
References: <20051230200924.GA3556@tachyon.int.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: "'Kyle McMartin'" <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051230200924.GA3556@tachyon.int.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I tried adding "single" to various parts of the PALO command line.  No luck.
Since the error at least looks like it is related to the FDDI card, I
re-installed using the other NIC as my primary (eth1).  No difference.

The LCD just keeps cycling through...

FLT 5108.8-2-32
FLT 5408.8-2-32
FLT 5505.8-2-32
FLT CBF4.8-2-32
FLT CBFC.8-2-32
FLT CBF0.8-2-32


The system is in my den and not very accessible to take apart and start
pulling cards.

I guess I should have gone with my original plan to load this thing in my
truck and haul it to the dump, but now I'm determined to make it work.  Any
other ideas?



-----Original Message-----
From: Kyle McMartin [mailto:kyle@mcmartin.ca] 
Sent: Friday, December 30, 2005 3:09 PM
To: Craig D. Lansing
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] J2240 - Almost there....

On Fri, Dec 30, 2005 at 10:51:22AM -0500, Craig D. Lansing wrote:
> defxx.c:v1.06 2003/08/04 Lawrence V. Stephani and others
> fddi%d: DEFPA at I/O addr = 0x100, IRQ = 96, Hardware addr =
58-B0-60-00-00-00

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
