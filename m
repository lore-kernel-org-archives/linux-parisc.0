Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA21776
	for <parisc-linux@puffin.external.hp.com>; Thu, 9 Mar 2000 10:30:59 -0700
Message-ID: <00bd01bf89e5$35755020$4c50fb8d@corpnorth.baynetworks.com>
Reply-To: "Rajiv Dighe" <rdighe@nortelnetworks.com>
From: "Rajiv Dighe" <rdighe@nortelnetworks.com>
To: parisc-linux <parisc-linux@thepuffingroup.com>
References: <38C73A40.968A77C1@cln.etc.bc.ca>
Subject: Re: [parisc-linux] Neat hardware on 712.
Date: Thu, 9 Mar 2000 11:33:32 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Talking of cool stuff..atleast I found this to be cool coming from wintel architecture, but while I was helping a friend load HP/UX 10.20 on a stack of 712s he has acquired, we came across a machine that had bad memory simm in it. when machine booted, it showed image of mainboard on the screen with simm slot that containing bad simm highlighted..sure beats the heck out of trying to listen to beeps on the speaker to find out what's wrong :)

--Rajiv
----- Original Message ----- 
From: "Steve Shack" <sshack@cln.etc.bc.ca>
To: <parisc-linux@thepuffingroup.com>
Sent: Thursday, March 09, 2000 12:44 AM
Subject: [parisc-linux] Neat hardware on 712.


> Good day puffins,
>     Last night  Philipp and myself were playing around with the 712's
> discusing how to support the powerswitch gracefully when we realized
> that there was a cable going to the front of the case; Upon further
> inspection it is a thermal sensor. Some duscussion followed as to how
> this might be interfaced to the system. As it turns out it works as the
> following. When the circuit is completed and the sensor is too hot
> another fan in the back of the 712's power supply turns on. We've yet to
> determine if there is anything else going on in the system or if there
> is any way this information is reported back to the os/running system at
> all but we'll investigate further. Philipp has suspicions about the
> large number of wires coming on the power header. That perhaps some of
> those wires are used for signaling. Myself I have a feeling that it
> might be a combination of that and the two smaller wires coming from the
> psu.
> 
> 
> That's all for now.
> Steve
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
