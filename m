Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (f39.law4.hotmail.com [216.33.149.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 74D61482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Apr 2002 02:41:15 -0600 (MDT)
From: "Kenneth Westelinck" <kennywest1@hotmail.com>
To: parisc-linux@lists.parisc-linux.org
Date: Mon, 15 Apr 2002 08:41:08 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Message-ID: <F39D7BsZXbLvwa2SydH0001aa92@hotmail.com>
Subject: [parisc-linux] not freeing initmem and power button
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

Hi all,

After a few months of gathering dust, I finally decided to upgrade my 
712/60. It was initially installed with the old 0.9.2 ISO, and upgraded with 
a more recent kernel (I think it was 2.4.9). This weekend I did an apt-get 
update, apt-get upgrade to upgrade my system (woody). I also compiled a new 
kernel (2.4.18-pa16) for this system. The system boots fine and as far as I 
can see, all applications "survived" the upgrade. The only problem I am 
experiencing are 2 _bugs_ mentionned a while ago in the mailing list.

- When booting the kernel reports: NOT FREEING INITMEM. I found this in the 
mailing list, but I couldn't find a solution. Is there any solution for this 
problem? I don't think I had this when running the old kernel.

- Second, when I push the power button, the system powers off without doing 
a clean shutdown. When running the 2.4.9 kernel the machine didn't halt when 
pushing this button. Only typing in "shutdown -h now" did the trick. I 
prefer this behaviour. In this case a normal user cannot shutdown the 
machine, except by pulling the power cord. Can someone please tell me which 
file to edit/tweak to give back this
old behaviour?

Many thanks in advance.


regards,

Kenneth

enjoy life, enjoy linux,

Kenneth

_________________________________________________________________
Download MSN Explorer gratis van http://explorer.msn.nl/intl.asp.
