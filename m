Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA02647
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 12:09:50 -0600
From: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Message-Id: <199906111810.LAA14342@chrome.rose.hp.com>
Subject: Re: [parisc-linux] booting problems
To: adevries@thepuffingroup.com (Alex deVries)
Date: Fri, 11 Jun 1999 11:10:32 PDT
Cc: dave@hiauly1.hia.nrc.ca, law@cygnus.com, parisc-linux@thepuffingroup.com
In-Reply-To: <37614530.35570847@thepuffingroup.com>; from "Alex deVries" at Jun 11, 99 1:19 pm
List-ID: <linux-parisc.vger.kernel.org>

Here's the offending code segment:

# adb Image-19990611-1

0x2000,10?i
2000:           LDO             -4(r31),r31
                LDIL            L%0x40008000,r1
                BE              1792(sr4,r1)      ; 0x40008000 + 1792 = 0x40008700 
                                                  ; this is the evil branch past
                                                  ; the end of memory identified
						  ; in the PIM dump
                OR              r31,r0,r2
                LDO             -4(r31),r31
                LDIL            L%0x2000,r1
                BE              228(sr4,r1)
                OR              r31,r0,r2
                LDO             -4(r31),r31
                LDIL            L%0x2000,r1
                BE              316(sr4,r1)
                OR              r31,r0,r2
                LDO             -4(r31),r31
                LDIL            L%0x2000,r1
                BE,N            1528(sr4,r1)
                LDO             -4(r31),r31
$q

KMB
--
+============================================================+
|       Kirk Bresniker    	(916) 785-5677		     |
|       8000 Foothills Blvd                                  |
|       Roseville, CA 95747-5649                             |
|       kirkb@rose.hp.com                                    |
