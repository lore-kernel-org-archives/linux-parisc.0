Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA16043
	for <parisc-linux@puffin.external.hp.com>; Tue, 1 Feb 2000 09:47:34 -0700
Message-Id: <200002011548.JAA01803@egsner.cirr.com>
From: eric@cirr.com (Eric Schnoebelen)
To: pgonnet@student.ethz.ch
cc: parisc-linux@thepuffingroup.com
Subject: Re: serial console on 735/99 
In-reply-to: Your message of "Tue, 01 Feb 2000 16:37:25 +0100."
             <3896FDB5.269959C1@vis.ethz.ch>
Date: Tue, 01 Feb 2000 09:48:32 -0600
Sender: eric@cirr.com
List-ID: <linux-parisc.vger.kernel.org>


"Pedro G. Gonnet" writes:
- forgot to mention, i don't have a HIL keyboard, so unplugging it is not
- an option. anybody know if it might have something to do with the vt100?

	It's possible that someone reset the speeds on the
serial port, or configured the system to use the secondary
serial port as the console.  In any event, I'd suggest removing
the battery for a while, and then booting the system.. With no
graphics adapter, it will default to ttya at 9600/8n1.

- btw, any chance i could get my hands on an "normal" ethernet-adaptor for
- this machine? fddi-cards cost a fortune...

	As I recall, the ethernet module for these are no longer
in the HP price book.. You might try contacting an used HP
equipment reseller and see what they want for one.. Otherwise,
the next best option is a FDDI<->ethernet hub/router..

--
Eric Schnoebelen		eric@cirr.com		http://www.cirr.com
	Due to circumstances beyond your control, you are master of
		your fate and captain of your soul.
