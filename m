Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailgate5.cinetic.de (mailgate5.cinetic.de [217.72.192.165])
	by dsl2.external.hp.com (Postfix) with ESMTP id A72524829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Nov 2002 04:17:01 -0700 (MST)
Received: from web.de (fmomail02.dlan.cinetic.de [172.20.1.46])
	by mailgate5.cinetic.de (8.11.2/8.11.2/SuSE Linux 8.11.0-0.4) with SMTP id gA8BGuX28978
	for parisc-linux@lists.parisc-linux.org; Fri, 8 Nov 2002 12:16:56 +0100
Date: Fri, 8 Nov 2002 12:16:56 +0100
Message-Id: <200211081116.gA8BGuX28978@mailgate5.cinetic.de>
MIME-Version: 1.0
From: Berthold Gunreben <b.gunreben@web.de>
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset="iso-8859-1"
Subject: [parisc-linux] nanosleep
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

Hi List,    
    
I tried to compile glibc2.3.1, and have some problems with the threading support there.     
When using perl with the new glibc on a C240, things seem to work without problems. On    
a 715/33, I get (probably) endless loops with lots of sched_yield() calls.    
    
In the Internet, I found the following site:    
http://sources.redhat.com/ml/libc-alpha/2000-02/msg00057.html   
where Andrea Arcangeli fixed a kernel problem with nanosleep on kernel 2.2 and 2.3, and  
also provided a testprogram. Here are the results of my test:  
  
C240: (2.4.19-pa20)  
# ./nanotest & sleep 4; killall nanotest  
[1] 8455  
userspace             15 sec 778496030 nsec  
kernel                15 sec 800000000 nsec  
[1]+  Done                    ./nanotest  
  
715/33: (2.4.17-32)  
# ./nanotest & sleep 4; killall nanotest  
[1] 1840  
userspace             15 sec 422651030 nsec  
kernel                15 sec 450000000 nsec  
[1]+  Done                    ./nanotest  
  
Intel based for reference: (2.4.19)  
# ./nanotest & sleep 4 ; killall nanotest  
[1] 19648  
userspace             15 sec 984455030 nsec  
kernel                15 sec 984477030 nsec  
[1]+  Done                    ./nanotest  
  
Is there a bugfix missing for parisc? 
 
Berthold 
________________________________________________________________
Keine verlorenen Lotto-Quittungen, keine vergessenen Gewinne mehr! 
Beim WEB.DE Lottoservice: http://tippen2.web.de/?x=13
