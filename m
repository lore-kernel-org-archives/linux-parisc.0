Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA19780
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 17:18:22 -0700
Message-Id: <200101260024.QAA22790@milano.cup.hp.com>
To: David Kennedy <dkennedy@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] CPU detection wrong 
In-reply-to: Your message of "Thu, 25 Jan 2001 14:52:44 PST."
             <20010125145244.C25242@parcelfarce.linux.theplanet.co.uk>
Date: Thu, 25 Jan 2001 16:24:01 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> we have the following entry in hardware.c:
> 
>         { 0x05c0, 0x0fc0, pcxw   },  /* 0x05c0 - 0x05ff */

David (Kennedy),
You have time to fix the table based on the "Appendix B" data below?

(Willy is keeping me busy - help him test the merge mess. :^)

In the long run, I don't want to be involved in maintaining this table.
An easier way to determine processor type is based on CPU and FP-Coproc
MODEL information. Our kernel queries for both now and it's just a
matter of putting it to use.

On a related note: is anyone interested in figuring out how to get
the "model string" from NVRAM?
It should just be a PDC call but I don't know which one.

Taken from the I/O ACD, Appendix B. Version and Identification Numbers,
here's an ASCII update for the NPROC types in 5c0-5ff range:

                                         |        |   SVERSION    | HVERSION
Module                                   | TYPE   |  Model    Opt |  Model
_________________________________________|________|_______________|_________
   M2250                                 | NPROC  |  00004    91  |   5C0
   M2500                                 | NPROC  |  00004    91  |   5C1
   Sonata 440                            | NPROC  |  00004    91  |   5C2
   Sonata 360                            | NPROC  |  00004    91  |   5C3
   Rhapsody 440                          | NPROC  |  00004    91  |   5C4
   Rhapsody 360                          | NPROC  |  00004    91  |   5C5
   Raven W 360 (9000/780/????)           | NPROC  |  00004    91  |   5C6
   Halfdome W+ 552                       | NPROC  |  00004    91  |   5C7
   Lego 360 processor                    | NPROC  |  00004    81  |   5C8
   Rhapsody DC- 440                      | NPROC  |  00004    91  |   5C9
   Rhapsody DC- 360                      | NPROC  |  00004    91  |   5CA
   Crescendo 440                         | NPROC  |  00004    91  |   5CB
   Prelude W 440                         | NPROC  |  00004    91  |   5CC
   SPP2600                               | NPROC  |  00004    91  |   5CD
   M2600                                 | NPROC  |  00004    91  |   5CE
   Allegro W+                            | NPROC  |  00004    81  |   5CF
   Kazoo W+                              | NPROC  |  00004    81  |   5D0
   Forte W+ 2w                           | NPROC  |  00004    91  |   5D1
   Forte W+ 4w                           | NPROC  |  00004    91  |   5D2
   Prelude W+ 540                        | NPROC  |  00004    91  |   5D3
   Duet W+                               | NPROC  |  00004    91  |   5D4
   Crescendo 550                         | NPROC  |  00004    91  |   5D5
   Crescendo DC- 440                     | NPROC  |  00004    81  |   5D6
   Keystone W+                           | NPROC  |  00004    91  |   5D7
   Rhapsody wave 2 W+ DC-                | NPROC  |  00004    91  |   5D8
   Rhapsody wave 2 W+                    | NPROC  |  00004    91  |   5D9
   Marcato W+ DC-                        | NPROC  |  00004    91  |   5DA
   Marcato W+                            | NPROC  |  00004    91  |   5DB
[ reserved      5DC-5DD ]
   Piccolo W+                            | NPROC  |  00004    81  |   5DE
[ reserved      5DF-5FE ]
   Hitachi W                             | NPROC  |  00004    ??  |   5FF


Some heuristics in case its not clear from the Description:
	M2500 is PCX-W
	M2600 is PCX-W+
	*360 is PCX-W
	*440 is PCX-W
	*5[45]0 is PCX-W+

Other news:
devresources.hp.com website should see some of the PDC docs updated soon.
(Which was already happening before I asked about HVERS/SVERS stuff)


thanks,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
