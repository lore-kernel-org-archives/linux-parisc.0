From: Jeremy Drake <jeremyd@apptechsys.com>
Subject: [parisc-linux] Win2k server boot howto
Date: Fri, 12 Sep 2003 16:43:28 -0700 (PDT)
Message-ID: <Pine.LNX.4.50.0309121543430.11075-100000__8813.62508885122$1416622772$gmane$org@ssh.apptechsys.com>
References: <010d01c36e5d$9d0748a0$0201a8c0@mainframe>
 <Pine.LNX.4.50.0308291612160.11075-100000@ssh.apptechsys.com>
 <20030830021622.GF13467@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: debian-hppa@lists.debian.org
To: parisc-linux@lists.parisc-linux.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030830021622.GF13467@parcelfarce.linux.theplanet.co.uk>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

This is about using the dhcp server in win2k server to net boot a parisc 
box.

On Sat, 30 Aug 2003, Matthew Wilcox wrote:

> On Fri, Aug 29, 2003 at 04:14:04PM -0700, Jeremy Drake wrote:
> > I have done it with the DHCP server that comes with win2k server.
> 
> I think this might be useful information for the FAQ.  Could you write
> it up?

Here is my first attempt at writing this up.  Please send your
criticisms/spelling fixes/flames.

------------------------------

I used Tftpd from http://tftpd32.jounin.net/ (which, in an unrelated side
note, was used as part of the blaster worm, according to the site).  I
used the dhcp server which is a part of win2k server (Control Panel,
Add/remove programs, Windows components, Networking Services, Dynamic Host
Configuration Protocol (DHCP)).

First, lets ask the box what its mac address is.  I'm assuming you have a
functional console.  Power on the box, and when it says "press any key to"  
whatever press any key, and at the BOOT_ADMIN> prompt, type "in la" and
hit enter.  (For those of you who like to type, that's short for
information lan).  It will give you a hex number which is your
workstation's mac address.

Start up the DHCP admin tool (Start, Settings, Control Panel, Admin.  
Tools, DHCP).  Expand your server in the tree, and right click on
Reservations.  Select "New Reservation...".  For reservation name, I put
my box's name.  Give it an ip address that is not used in IP address, and
enter the box's mac address in mac address (no delimiters, just a big hex
number), and select Both for whether it should be bootp or dhcp.  Then,
find your new reservation at the bottom of the list under Reservations,
and click it.  Right click and choose "Configure Options..."  It should
have inherited your server's default options, so I won't cover setting
router, dns, wins, and lease length.  Scroll down the list of options
until you get to 066, Boot Server Host Name.  Check the box next to that
option, and enter your tftp server's ip address (I don't trust dns to work
in IPL).  Also check 067, Bootfile Name, and enter the name of the
lifimage (generally, lifimage is a good choice here).  Say ok to that box,
we're done in dhcp!

Fire up tftpd32, and click the "browse" button.  Browse to where you put
your lifimage, and say ok.  Make sure the ip address below the directory
is the right one; if not, drop down the list and pick the right one.  
Leave this app up, the server only runs when the gui is displayed (not
sure if you can run it as a service)

Now we're ready to boot the box.  Go back to the box, get the BOOT_ADMIN>
prompt again (if you turned it off after the first time, or type "ma" for
the main menu if you didn't).  Type "sea" (for search), and if everything
is good, you should see something like "P0 LAN.<BLAH>".  If you do,
congrats, if not, check all of the settings on the server (like, you
recorded and typed the mac address correctly, and your dhcp server is on
the same physical network segment as your workstation).  If it shows a
line like the above, enter "bo p0" (or whichever p number the LAN was by).  
Anything beyond this point belongs to an install howto more than a win2k
server boot howto...

--------------------------------




-- 
Computers make excellent and efficient servants, but I have no wish to
serve under them.  Captain, a starship also runs on loyalty to one
man.  And nothing can replace it or him.
		-- Spock, "The Ultimate Computer", stardate 4729.4
