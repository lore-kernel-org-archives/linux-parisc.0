From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Win2k server boot howto
Date: Wed, 24 Sep 2003 22:08:05 -0600
Message-ID: <20030925040805.GA28170__34101.5179678381$1416622802$gmane$org@dsl2.external.hp.com>
References: <010d01c36e5d$9d0748a0$0201a8c0@mainframe> <Pine.LNX.4.50.0308291612160.11075-100000@ssh.apptechsys.com> <20030830021622.GF13467@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.50.0309121543430.11075-100000@ssh.apptechsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: Jeremy Drake <jeremyd@apptechsys.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <Pine.LNX.4.50.0309121543430.11075-100000@ssh.apptechsys.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Sep 12, 2003 at 04:43:28PM -0700, Jeremy Drake wrote:
> This is about using the dhcp server in win2k server to net boot a parisc 
> box.

Jeremy,
Thanks again for the first version.
I've reformatted and rewrote bits of it.
Things with [ ] around them mean a step or info is missing.
Can you please review if any additional steps are missing and
fill in missing bits you know about?

Anyone else know if tftpf32 can be run as a service under win2k?

I'll add HTML markup when I'm ready to link it into our FAQ.

thanks,
grant

------------------------ HOWTO.win2k_bootp -------------------

Get the MAC address from the PARISC workstation
-----------------------------------------------
o Power on the box
o stop the auto boot when "press any key to stop boot" is printed
o At the BOOT_ADMIN> prompt, type "in la" and hit enter. 
o record the printed hex number (your workstation's MAC address).
o leave the workstation power on...get back to it in a bit.

[ How/Where to get a lifimage? Needed below ]


Enable DHCP server in Win2k
---------------------------
o Start DHCP server:
	Control Panel, Add/remove programs, Windows components,
   	Networking Services, Dynamic Host Configuration Protocol (DHCP)

o Start up the DHCP admin tool:
	Start, Settings, Control Panel, Admin Tools, DHCP

o Expand [ double click? ] your server in the tree
o right click on Reservations.
o Select "New Reservation..."
o For reservation name, I put my workstation's host name.
o enter an unused IP address
o enter the PARISC workstation's mac address (no delimiters,
  just the hex number).
o select "Both" for whether it should be bootp or dhcp.
[ o click "Ok" to close this window? ]

o Find your new reservation at the bottom of the list under Reservations
  and click it.
o right click "Configure Options..."
  It should have inherited your server's default options, so I won't
  cover setting router, dns, wins, and lease length.

o Scroll down the list of options to 066 "Boot Server Host Name".
  Check the box next to option 066.  Enter your tftp server's ip address
  (I don't trust DNS to work in IPL).

o check option 067 "Bootfile Name" and enter the name of the lifimage.
  Generally, "lifimage" is a good choice here.

o click "ok" and dhcp server is ready!


Enable Tftpd on Win2k Server
----------------------------
o Get Tftpd from http://tftpd32.jounin.net/
o start tftpd32 [.exe?]
o click the "browse" button
o Browse to where you put your lifimage, highlight it and click ok.

o Make sure the IP address below the directory is the right one.
  If not, drop down the list and pick the right one.
  [which IP? client or dhcpd server?]

o Leave tftpd32 running. The tftp server only runs when the gui is displayed.
  [ Can tftpd32 can be run as a service? How? Help page on jounin.net? ]


Net Boot the PARISC Workstation
-------------------------------
o Get the "BOOT_ADMIN>" prompt again
o Type "sea lan" (for search). If everything is correct, you should
  see something like:
  	P0 LAN.<BLAH>
	
o type "bo p0" to start the parisc-linux boot process.
  Palo output should be the next thing to show up on the console.

o If "P0 LAN" doesn't show up, check:
	+ settings on the DHCP server.
	  eg. verify the PARISC MAC address is correct,
	+ your dhcp server is on the same physical network segment as
	  the PARISC workstation.
	+ "Link" light on PARISC workstation and Win2K server
	  LAN port is lit.
  
The HOWTO PARISC install [URL?] howto will be helpful from this point.
