Return-Path: <hppa-linux@puffingroup.com>
Message-Id: <199902070440.WAA03693@tomahawk.rsn.hp.com>
To: hppa-linux@puffingroup.com
CC: jason@gatekeeper.equator.com
Subject: Re: [hppa-linux] Cross compile setup 
Date: Sat, 06 Feb 1999 22:40:42 -0600
From: Bjorn Helgaas <helgaas@rsn.hp.com>
Resent-Message-ID: <"5CS0e.0.p5.7EJls"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

I wrote
>I think the ISL image is plain SOM, ...

BUT, come to think of it, I guess I never did anything with ISL; when I
fiddled in this area, I was only concerned about the kernel itself, so I
did things like rewrite the AUTO file to change the kernel image to boot.

I do still think the ISL image is pretty much straight SOM, though there
is a "-S" option on the ld(1) man page that talks about generating an
IPL auxiliary header, so you might need that.

-------------
Bjorn Helgaas   helgaas@rsn.hp.com  telnet 1-497-3069  (972)497-3069

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
