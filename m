Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA21054
	for <parisc-linux@puffin.external.hp.com>; Sat, 20 Jan 2001 21:44:47 -0700
Date: Sat, 20 Jan 2001 21:47:55 -0700
Message-ID: <20010120214755.D17256@tausq.org>
From: "Randolph Chung" <randolph@tausq.org>
To: parisc-linux@thepuffingroup.com
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] question about disk caching....
List-ID: <linux-parisc.vger.kernel.org>

I got this with the latest kernel bits from cvs:

frodo:/etc# useradd -m randolph                                                 
frodo:/etc# passwd randolph                                                     
passwd: Unknown user randolph                                                   
frodo:/etc# sync                                                                
frodo:/etc# passwd randolph                                                     
Enter new UNIX password:                                                        

seems like a caching issue? This is booting entirely off a local SCSI
harddisk. Any ideas what might be causing this?

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
