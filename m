Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA15946
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 May 1999 18:17:39 -0600
Received: from chrome.rose.hp.com (kirkb@chrome.rose.hp.com [15.8.150.209])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id UAA16661
	for <parisc-linux@thepuffingroup.com>; Wed, 12 May 1999 20:17:35 -0400 (EDT)
Received: (from kirkb@localhost) by chrome.rose.hp.com (8.8.6 (PHNE_14041)/8.7.3) id RAA28053 for parisc-linux@thepuffingroup.com; Wed, 12 May 1999 17:18:23 -0700 (PDT)
From: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Resent-Message-Id: <199905130018.RAA28053@chrome.rose.hp.com>
Message-Id: <199905130018.RAA28053@chrome.rose.hp.com>
Date: Wed, 12 May 1999 16:06:05 PDT
To: mkp@mkp.net (Martin K. Petersen)
Subject: Re: [parisc-linux] A180 Ignition Howto
In-Reply-To: <yq1vhdz9r1q.fsf@jaguar.socsci.auc.dk>; from "Martin K. Petersen" at May 12, 99 12:31 (midnight)

| 
| 
| Alex asked me to post this...
| 
| My A180 arrived a couple of days ago.
| 
| Just like any other HP box there are loads of HP-UX docs but no
| information on the hardware at all. Grrr. HP. When will you ever
| learn?

Did you try out the online information? Try the following URL.
It has lots of answers to "How Do I ..." questions:

http:/eproducts.hp.com/A-Class/frame_service.html

| 
| The A180 has a builtin webconsole. On the back of the system unit
| there are two RJ45 connectors. One of them is regular ethernet
| (DEC2114x btw. Should be piece of cake to get running) and the other
| is for the webconsole.
| 
| According to the docs on HP's website the system should autodetect
| whether to use serial port or web as console. 

The autodectection is based on seeing LINK_OK on the webconsole port. 
If there is an active LAN attached, you will attach via the webconsole.
Note that the RS-232 hardware is the same whether you use the RS-232 
connection or the webified version. The only thing the LINK_OK does is
flip a mux.

Did you get you systems with a management card? It's handy if you did
since you'd be able to reset a hung system remotely. 

|                                                I was unable to get my
| HP 70096 serial console running, though. Then I discovered a jumper on
| the motherboard which could allegedly force it in either mode. I tried
| moving it to serial with no avail.

What cable were you using? The cable I have connected to my system 
is an HP 24542G RS-232 cable. Here is the pinout:

CPU		Peripheral
9-pin F		25-pin M
1 <------------- 4
2 <------------- 2
3 -------------> 3
4 --------+----> 5
	  |
	  +----> 6
5 <------------> 7
6 <----+-------- 20
       |
8 <----+
7 -------------> 8

| 
| Oh, well. Bugger. Then I decided to try out the webconsole. The
| interface defaults to 192.0.0.192. Clickety-clik. *Blam* the Java
| stuff in the webconsole nuked my Netscape. Grumble.

The docs say that Netscape 3.01 should be okay. 

KMB

--
+============================================================+
|       Kirk Bresniker    	(916) 785-5677		     |
|       8000 Foothills Blvd                                  |
|       Roseville, CA 95747-5649                             |
|       kirkb@rose.hp.com                                    |
