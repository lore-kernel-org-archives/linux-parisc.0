Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA26222
	for <parisc-linux@puffin.external.hp.com>; Mon, 13 Mar 2000 09:22:45 -0700
Message-ID: <56D553C0B61BD311AD2300A0C9F485C202E9DAE5@xfc02.fc.hp.com>
From: "FINK,MARTIN \(HP-FtCollins,ex1\)" <martin_fink@hp.com>
To: "'willy@thepuffingroup.com'" <willy@thepuffingroup.com>,
        parisc-linux@thepuffingroup.com
Subject: RE: [parisc-linux] USB
Date: Mon, 13 Mar 2000 08:23:38 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

The USB on HP workstations is OHCI, not UHCI.  Don't know if it makes
a difference from the driver perspective.

Martin

+=====================================================================+
| Martin Fink                 | E-mail: mailto:martin_fink@hp.com     |
| UNIX Development Lab        | Phone:  970-898-7076                  |
| Hewlett-Packard Co.         | FAX:    970-898-2838                  |
| 3404 East Harmony Road      | ===================================== |
| Ft. Collins, CO, USA, 80528 | Web:    http://www.hp.com/            |
+=====================================================================+    
 

> -----Original Message-----
> From: willy@thepuffingroup.com [mailto:willy@thepuffingroup.com]
> Sent: Sunday, March 12, 2000 5:52 PM
> To: parisc-linux@thepuffingroup.com
> Subject: [parisc-linux] USB
> 
> 
> 
> Someone was asking about the USB interfaces on the 
> C3k/J5k/etc.  I just
> took one of their keyboards and attached it to my laptop's 
> USB port and
> it worked fine (running Linux 2.3.51).  So as long as the 
> UHCI controller
> in the C3k is supported, the rest of the Linux USB layer is fine.  The
> USB layer is used quite intensively by the Linux/PPC port 
> (iMacs only have
> USB keyboards) so there can't be any endian issues to take care of.
> 
> --------------------------------------------------------------
> -------------
> To unsubscribe: send e-mail to 
> parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
