Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA13277
	for <parisc-linux@puffin.external.hp.com>; Mon, 29 May 2000 18:38:26 -0600
Message-ID: <56D553C0B61BD311AD2300A0C9F485C2066C157E@xfc02.fc.hp.com>
From: "FINK,MARTIN \(HP-FtCollins,ex1\)" <martin_fink@hp.com>
To: "'Peter A. Peterson II'" <pedro@flynn.zork.net>,
        parisc-linux@thepuffingroup.com
Subject: RE: [parisc-linux] HP-UX random number generator?
Date: Mon, 29 May 2000 17:38:33 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Peter -

Sorry to disappoint - /dev/random /dev/urandom are not available
on HP-UX.  Lots of internal discussions inside HP on how/when
to make it available.  No dates.

Martin

+=================================================================+
| Martin Fink                 | E-mail: martin_fink@hp.com        |
| UNIX Systems Enablement Lab | Phone:  970-898-7076              |
| Hewlett-Packard Co.         | FAX:    970-898-2838              |
| 3404 East Harmony Road      | Mobile: 970-215-2451              |
| Ft. Collins, CO             | Page:   9702152451@mobile.att.net |
| 80528, USA                  | Web:    http://www.hp.com/        |
+=================================================================+    
 

> -----Original Message-----
> From: Peter A. Peterson II [mailto:pedro@flynn.zork.net]
> Sent: Monday, May 29, 2000 1:50 AM
> To: parisc-linux@thepuffingroup.com
> Subject: [parisc-linux] HP-UX random number generator?
> 
> 
> I'm awaiting the day when I can fool around with Linux on my E-45, but
> in the meantime, I'm trying to use it's tape drive to back up my
> traditional Linux boxen via piping a tarball through ssh.  
> However, ssh 
> needs a random generator (like /dev/urandom/) and I don't 
> know what an 
> HP-UX equivalent might be, or how to go about installing one. 
> 
> Any ideas?
> 
> pedro
> 
> -- 
> -----------------------------------------------
>       "She's laughin in her sleeve, boys;
>    I can feel it in my bones."  -- Tom Waits
> -----------------------------------------------
> 
> --------------------------------------------------------------
> -------------
> To unsubscribe: send e-mail to 
> parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
