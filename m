From: Max Grabert <parisc@gmail.com>
Subject: Re: [parisc-linux] PPPOE with BL180
Date: Mon, 10 Jan 2005 00:12:24 +0000
Message-ID: <e6eae02905010916122d584e6e@mail.gmail.com>
References: <BAY21-F174616CDCA2C6E4FFCB76892960@phx.gbl>
Reply-To: Max Grabert <parisc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: Dany Joly <dany_joly@hotmail.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <BAY21-F174616CDCA2C6E4FFCB76892960@phx.gbl>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 09 Jan 2005 23:00:33 +0000, Dany Joly <dany_joly@hotmail.com> wrote:
 
> I have a HP B 180L running with Woody. Connecting the machine to an
> ethernet connection works very well. My problem is with PPOE.
> I recently switched ISP and I now use ADSL. Since then, I am unable 
> to access the Internet from this machine. I write to this forum rather than to a 
> general linux forum because when searching Google with "/dev/ppp: 
> Resource temporarily unavailable", I only get links related to PARISC.

Me too :-/

Sorry, I probably can't be offer much help here. PPPoE is working fine here
(C3000 running Debian/testing, kernel 2.6.10-rc3-pa2). You haven't specified
what kernel you are using, but since you are running woody, I'm pretty sure it 
must be a 2.4.x kernel.
However I also don't have any troubles with PPPoE and 2.4.25-pa1, so it
might either it is a problem with the (PPPoE) packages in woody, 
or have a too old kernel, or a h/w issue or something else.
Although there are some arch differences between your B180L and my
C3000, I somehow doubt that this has anything to do with this.

NB. I'm using a "Intel EtherExpress 100 Pro" as my 2nd network card.

It would be nice if you could provide more information about your system,
eg. the kernel version, the compiler you used to compile your kernel
(in case you compiled it yourself), the kind of network cards, and perhaps also
your kernel config.

IMHO I'd say you should try upgrading to Debian/testing if you cannot solve 
your problem otherwise. You might also want to try a 2.6 kernel in this case,
since nobody (of the parisc hackers) really cares about 2.4 anymore.

Greetings,
   Max
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
