Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from egsner.cirr.com (ns-a.cirr.com [192.67.63.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2387A6121
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 10:06:10 -0700 (MST)
Message-Id: <200111191706.fAJH64e27084@egsner.cirr.com>
From: eric@cirr.com (Eric Schnoebelen)
To: Aaron Macks <aaronm@cs.brandeis.edu.ml.to>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 755/125 problems 
In-reply-to: Your message of "Mon, 19 Nov 2001 10:43:35 EST."
             <a0510031db81ed8e4549c@[129.64.46.46]>
Date: Mon, 19 Nov 2001 11:06:03 -0600
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Aaron Macks writes:
- >>  unconfigure the ATM card and remove it from the eisa cage, but the
- >>  system still seems not to see the 10baseT AUI adaptor, no lights are
- >>  lit, not even the power one.
- >
- >Hm... that doesn't seem right.  Have you tried a different AUI adapter?
- >sounds like faulty hardware somewhere :(
-
- I've just tried all of the dozen or so AUI connectors that I have. No 
- reaction.  Do I have to configure something int the ISL menu to get 
- it to use the AUI connector instead of the ATM or the 10B2?

	As I recall, there is a jumper block on the AUI/10B2
board that needs to be switched to change the usage from one to
the other.. It's about a 10x3 block (if memory is serving
correctly.)

--
Eric Schnoebelen		eric@cirr.com		http://www.cirr.com
==============================  EARTH DOWNTIME ==============================
Earth will be down today from 4:30pm to 6:30pm to work on hardware problems.
			-- From a NASA message of the day.
