Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from acad.udallas.edu (acad.udallas.edu [192.91.253.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7AC554939
	for <parisc-linux@lists.parisc-linux.org>; Thu,  9 Oct 2003 12:26:48 -0600 (MDT)
Received: from udallas.edu (arkham.math.udallas.edu [10.3.12.16] (may be forged))
	by acad.udallas.edu (AIX4.3/8.9.3/8.9.2) with ESMTP id NAA24502
	for <parisc-linux@lists.parisc-linux.org>; Thu, 9 Oct 2003 13:28:31 -0500
Date: Thu, 9 Oct 2003 13:26:41 -0500
Mime-Version: 1.0 (Apple Message framework v552)
Content-Type: text/plain; delsp=yes; charset=US-ASCII; format=flowed
From: Walker White <wmwhite@udallas.edu>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20E48BDA-FA86-11D7-B35B-0030657CC792@udallas.edu>
Subject: [parisc-linux] IBM 3151 on K200 in Debian 3.0
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

I have scoured the FAQ and mailing lists.  Supposedly this has been  
resolved, but I am having the same old problems.

I just inherited an old K200 which I want to give my students as a  
"play" machine.  I am trying to install Debian 3.0 on it.  When I got  
the machine, it had no console whatsoever.  So I grabbed an old IBM  
3151 and plugged into the machine.  Works, no problem.  I can boot into  
HPUX just fine (which is still on the machine).

I tried to boot to the CD.  After a few stack dumps, a learned from the  
mailing list that I needed to change my console to ttyB0 from ttyS0.   
No more stack dumps.  However, after the message that says I might not  
see anything (and hence need to switch consoles), I do not see  
anything.  Supposedly this issue was fixed in the install CDs (at least  
that is what mailing list says), but doesn't seem so to me.

Is this an issue with the install CDs, or do I need to do something  
funky with the IBM 3151?

------------------------------------------------------------------------ 
-----------------------
| Walker White                                                           
  Assistant Professor  |
| wmwhite@udallas.edu                                                    
Dept. of Mathematics  |
| 972 -721-5380                                                          
University of Dallas  |
------------------------------------------------------------------------ 
-----------------------
