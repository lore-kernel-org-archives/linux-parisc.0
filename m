Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (f70.law4.hotmail.com [216.33.149.70])
	by dsl2.external.hp.com (Postfix) with ESMTP id 953A7482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Jul 2002 08:44:40 -0600 (MDT)
From: "robert klough" <bobklough@hotmail.com>
To: parisc-linux@lists.parisc-linux.org
Date: Fri, 26 Jul 2002 14:44:36 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F7044EomUPAmj10OcX80000c0e0@hotmail.com>
Subject: [parisc-linux] graphics console only displays the penguin
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

Hi,

I've tried installing the latest iso available online (the entire 400MB 
one), 9.3 I think, through serial console. It worked very well, but now I 
would like to pass it now on a monitor. But all what I get when I boot is 
the penguin logo on the top left corner and a blinking cursor. However I see 
no displayed text at all (the serial console is still available)

I've been advised to uncomment the line containing ttyS0 in the 
/etc/inittab, but this line is already uncommented (without the #).

How can I have both serial and graphics consoles? If anyone could help me, 
or send me their inittab it would be great

thanks in advance




_________________________________________________________________
Chat with friends online, try MSN Messenger: http://messenger.msn.com
