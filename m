Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id BCE1A482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Jan 2002 16:21:04 -0700 (MST)
Received: from npyu.esiee.fr (npyu.esiee.fr [147.215.80.150])
	by mail.esiee.fr (Postfix) with ESMTP id BE9F049BF0
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Jan 2002 00:21:03 +0100 (CET)
Date: Tue, 8 Jan 2002 00:21:02 +0100
Mime-Version: 1.0 (Apple Message framework v480)
Content-Type: text/plain; charset=US-ASCII; format=flowed
From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <3753D94C-03C5-11D6-8043-0030656F07A2@esiee.fr>
Subject: [parisc-linux] Python math bug
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

Hello,

After investigating a bit in an empirical way on the sqrt() function in 
python, I have noticed what seems to be a logical rule as follows:

All integer results (even when tested as X.0) are correct.
For the float numbers (I have only tested the X.X form), the rule looks 
like this:
the result for 0.X numbers is divided by (1/(2*sqrt(2))), ie multiplied 
by 2*sqrt(2)
for 1.X numbers, result is divided by sqrt(2)	(1 integer)
for 2.X and 3.X, divided by 2=(sqrt(2))^2		(2 different integers)
for 4.X -> 7.X, by (sqrt(2))^3				(4 different integers)
for 8.X -> 15.X, by 4=(sqrt(2))^4			(8 different integers)
for 16.X -> 31.X, by (sqrt(2))^5				(16 different integers)
for 32.X, by 8...

I have not tested further.

I have made the comparisons using a 10 digits (12 digits precision) 
calculator (as I had nothing else by this time).

I hope this will be useful for fixing the bug.


Thibaut
PA/Linux ESIEE Team
