Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-2.gci.net (mta-2.gci.net [208.138.130.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id 283A2482A
	for <parisc-linux@parisc-linux.org>; Tue, 22 Jan 2002 16:00:41 -0700 (MST)
Received: from mmp-2.gci.net ([208.138.130.81]) by mta-2.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GQD3WZ02.S76 for
          <parisc-linux@parisc-linux.org>; Tue, 22 Jan 2002 14:00:35 -0900
Date: Tue, 22 Jan 2002 13:55:57 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	<parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Trouble installing 0.9.3 on 735/99
In-Reply-To: <20020122120548.M19637@systemhalted>
Message-ID: <Pine.LNX.4.33.0201221352470.18962-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Tue, 22 Jan 2002, Carlos O'Donell Jr. wrote:
> I can't get any of the 715/50's to run stably with the newer
> SCSI driver. And after testing I can almost pinpoint with 95%
> accuracy tha it's the new driver.
>
> I have yet to go about running the latest kernel with the sim700
> driver. Though if I get some time this afternoon I will.
> (Just spent some time adding diskless 715/50's to our cluster)
>
> Has anyone been able to get SCSI disks that are not from HP
> to work on the 715's? (New terminator? Different terminator?)

I had a 1G HP /dev/sda and a 4G Micropolis /dev/sdb in my 715/100. Didn't
realize that HP actually expects you to terminate the unused ports on the
back until I was provided a link to my users manual :-) I also had to set
the drive's parity on, and enable the 'wait for start' command.

I also ran an IBM 4G DFHS-S4W drive on it initially. That was quite early
on in the process, though, so I had lots of crashes etc. that I don't know
were related to Debian/HPPA being 'alpha' software or due to the drive :-)
