From: wrooney@ihug.co.nz
Subject: Re: [parisc-linux] Problems with installation Debian Linux...please
Date: Tue, 25 May 2004 21:01:28 +1200
Message-ID: <40b30b68.155.34fd.1279736525@ihug.co.nz>
Reply-To: wrooney@ihug.co.nz
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> It begins the process of load of PALO and I select the
> console type: ttyB0
>
> Continuous the load.....
>
> But to the moment to begin the program linux installer in
> my server, they don't see each other the graphics... if I
> see the messages (as the one I title, the options that it
> is necessary to install linux, the types of partitions,
> etc.) but I don't see the graphics well and it is I
> impossible to select my installation options.
>
> can you help me please?
>
> data of my server:
>
> SYSTEM:        9000
> MODEL:         9000/898/K370
> RISC CHIP:     PA8200
> PA VERSION:    2.0
> SYSTEM GOES:     655623311
> CPU SPEED:     200 MHz
> CPUS:          1 activate processor(s)
> MEMORY:        512 Mbytes of memory.
> HP-UX VERSION: B.10.20
> CONSOLE: serial MONO
> HARD DISK: 9 GB (waiting three disk but it stops inetgrar)
>
> Thank's a lot

When you boot the Debian netinstall ISO it runs an
interactive program that lets you partition your disks, set
up swap, install the boot loader, etc.

The program uses something like ANSI to display different
coloured text and block characters, whereby it sends an
escape character, then three or four control characters then
the character to be printed to the console.

My 9000 doesn't have a graphics card.  It has an HP
monochrome serial terminal.  The HP terminal doesn't support
ANSI, so when I boot the netinstall ISO and it gets to the
installation menu, all I get is a lot of garbage spacing out
the characters that the menu is supposed to be made up of.

My handling was to use a notebook running Hyperterminal
under Windows instead of the dumb terminal while installing
- the colours still didn't come out right and the vertical
spacing went a bit funny when scrolling up and down the
menus, but at least I could read the menus and select items
off them.

Hope this helps.

Wayne
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
