Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org, Hans.Witvliet@Alcatel.nl
In-Reply-To: Message from jsoe0708@tiscali.be
   of "Tue, 22 Jan 2002 20:09:00 +0100." <1011726540.3c4db8cc712a9@webmail.tiscalinet.be>
References: <1011726540.3c4db8cc712a9@webmail.tiscalinet.be> 
Date: Tue, 22 Jan 2002 19:07:39 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020123020740.518C5482A@dsl2.external.hp.com>
Subject: [parisc-linux] Re: [Re]: B2000
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

jsoe0708@tiscali.be wrote:
> Hi all,
> 
> Just to relate an experience:
> 
> For my part, I just take the CD-0.9.3 and try to boot it with a B2000 and it
> failled also for me with similar messages if I use the STI buildin console.
> Well,... I disconnect ps/2 kbd and mouse and use a serial console (emulating
> vt100) and it boot correctly (with internal ide cdrom drive) at leat till the
>    2
> first Debian/GNU install dialog box.

Yes - and that's as far as it will go.
palo uses IODC ("BIOS") to load the vmlinux.
That vmlinux does not know how to talk to the IDE CD-ROM interface
and can't load anything else. One should be able to do a network
install but start out by booting the ISO image.

grant
