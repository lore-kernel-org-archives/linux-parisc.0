Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA28146
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Jun 1999 02:57:31 -0600
Message-Id: <199906100857.KAA12830@zeus.polsl.gliwice.pl>
Subject: Re: [parisc-linux] Trying to get HP-UX working
In-Reply-To: <E10rrdl-0000sB-00@the-village.bc.nu> from Alan Cox at "Jun 10, 99 00:19:58 am"
To: parisc-linux@thepuffingroup.com
Date: Thu, 10 Jun 1999 10:57:12 +0200 (METDST)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox)
From: "Piotr Strzy¿ewski" <gucio@zeus.polsl.gliwice.pl>
Reply-To: "Piotr Strzy¿ewski" <gucio@zeus.polsl.gliwice.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
List-ID: <linux-parisc.vger.kernel.org>

Alan Cox wrote:
> >  >I can't however get HP/UX to set up an interface 
> >  >
> >  >	194.168.151.23 netmask 255.255.255.224
> > 
> > Are you getting errors or do you just need to know where to make changes? 
> > If it's the former, post the errors and maybe someone can help. If its the 
> > latter, you probably want to edit /etc/rc.config.d/netconf
> 
> Umm webconsole doesnt support cut/paste
> 
> ifconfig lan0 194.168.151.23 netmask 255.255.255.224
> ifconfig: ioctl (SIOCSIFNETMASK): bad value
> 
> Which is kind of a problem

Alan - this is from man ifconfig on HP-UX 10.20:

   Supernets
     A supernet is a collection of smaller networks.  Supernetting is a
     technique of using the netmask to aggregate a collection of smaller
     networks into a supernet. This technique is particularly useful for
     class C networks.  A Class C network can only have 254 hosts.  This
     can be too restrictive for some companies.  For these companies, a
     netmask that only contains a portion of the network part can be
     applied to the hosts in these class C networks to form a supernet.
     This supernet netmask should be applied to those interfaces that
     connect to the supernet using the ifconfig command.  For example, a
     host can configure its interface to connect to a class C supernet,
     192.6, by configuring an IP address of 192.6.1.1 and a netmask of
     255.255.0.0 to its interface.

And this is the example on HP-UX 10.20:

# ifconfig lan0 191.1.1.1 netmask 255.255.255.224
# ifconfig lan0
lan0: flags=862<BROADCAST,NOTRAILERS,RUNNING,MULTICAST>
        inet 191.1.1.1 netmask ffffffe0 broadcast 191.1.1.31
# ifconfig lan0 192.1.1.1 netmask 255.255.255.224
ifconfig: ioctl (SIOCSIFADDR): Can't assign requested address
# ifconfig lan0 192.1.1.1
# ifconfig lan0
lan0: flags=862<BROADCAST,NOTRAILERS,RUNNING,MULTICAST>
        inet 192.1.1.1 netmask ffffff00 broadcast 192.1.1.255

I can only say - 'This is HP :-)'. Their ideas are sometimes strange for
me. :-).

gucio

-- 
gucio -> Piotr Strzy¿ewski
E-mail: gucio@zeus.polsl.gliwice.pl
