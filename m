Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pony.its.uwo.ca (pony.its.uwo.ca [129.100.2.63])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3AC92482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Jul 2001 12:41:43 -0600 (MDT)
Date: Wed, 4 Jul 2001 14:41:36 -0400 (EDT)
From: "y.   han" <yhan@uwo.ca>
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] request to boot (denied)
In-Reply-To: <20010630122236.A6437@megatonmonkey.net>
Message-ID: <Pine.SOL.4.21.0107041427510.19435-100000@panther.uwo.ca>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi!
Does anyone have any idea what is wrong with rbootd in our 715/50 machine.

We get the rbootd running.
1. the rbootd.conf is located at /etc
2. the rbootd.conf contains:

08:00:09:78:ab:0f    vmlinux        #Corus

(we have vmlinux, lifimage located at /export/hp/rbootd/ . and try both in
rbootd.conf

3. we set the vmlinux and lifimage r and x (readable).
4. rbootd is located at /etc/init.d/ and we run it by "rbootd
start". after
modifying the rbootd.conf, we use "rbootd restart" to restart it. 

5. we try to use "rbootd -d " to debug the messages. we get the
message. The following is a sample from the system message.

Jul  3 13:11:32 roller rbootd: rbootd shutdown succeeded
Jul  3 13:11:35 roller rbootd[4383]: restarted (eth0)
Jul  3 13:11:35 roller kernel: device eth0 entered promiscuous mode
Jul  3 13:12:47 roller rbootd[4383]: 08:00:09:78:ab:0f: request to boot
(denied)
Jul  3 13:12:47 roller rbootd: <<< 13:12:47.752052
Addr: 08:00:09:78:ab:0f   I
ntf: eth0
Jul  3 13:12:47 roller rbootd: ^I802.2 LLC: DSAP:f8 SSAP:f8 CTRL:300
Jul  3 13:12:47 roller rbootd: ^IHP Ext:    DXSAP:608 SXSAP:609
Jul  3 13:12:47 roller rbootd: ^IBoot Request: (Send Server ID)
Jul  3 13:12:47 roller rbootd: ^I^IRetCode:0 SeqNo:0 SessID:ffff Vers:2
Jul  3 13:12:47 roller rbootd: ^I^IMachine Type: HPS700              
Jul  3 13:12:47 roller rbootd: ^I^IFile Name (0): <>
Jul  3 13:12:47 roller rbootd: 
Jul  3 13:12:47 roller rbootd: >>> 13:12:47.755687
Addr: 08:00:09:78:ab:0f   I
ntf: eth0
       12:48 roller rbootd: ^I802.2 LLC: DSAP:f8 SSAP:f8 CTRL:300
Jul  3 13:12:48 roller rbootd: ^IHP Ext:    DXSAP:609 SXSAP:608
Jul  3 13:12:48 roller rbootd: ^IBoot Reply:
Jul  3 13:12:48 roller rbootd: ^I^IRetCode:16 SeqNo:af77368d SessID:1
Vers:2
Jul  3 13:12:48 roller rbootd: ^I^IFile Name (0): <>
Jul  3 13:12:48 roller rbootd: 
Jul  3 13:12:58 roller rbootd: <<< 13:12:58.242052
Addr: 08:00:09:78:ab:0f   I
ntf: eth0


6. We do not know what is going on with this machine?  If anyone can help
on this problem, that will be much helpful.

thanks,



>>>>>>>   
Department of Computer Science
University of Western Ontario
