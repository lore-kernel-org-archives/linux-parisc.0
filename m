Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Thu, 14 Jun 2001 15:35:07 +0000 (MET-01DST)
From: BOSCHINI@ICIL64.CILEA.IT
To: PARISC-LINUX@LISTS.PARISC-LINUX.ORG
Cc: BOSCHINI@cilea.it
Message-id: <01K4REDVBWF6001R4D@ICIL64.CILEA.IT>
MIME-version: 1.0
Content-type: TEXT/PLAIN; CHARSET=US-ASCII
Subject: [parisc-linux] Re: problem installing on HP735

Hello all, 

I changed HW, still 735 Apollo, and finally succeeded in going through the
first install. I got O.S. with no problem but had to do a

debootstrap sid /target file:/instmnt/debian from shell, since installtion
procedure seemed to hang (more than 1.5 hr).
Then I made the system bootbale and rebooted....

boot starts but then I get a "can not create tty4" and then 

modprobe: modprobe can't locate module char-mayor-4  

for many times. 

Then 
init respawning too rapidly 

and finally everything hangs.
Rebooted in single user. /etc/fstab empty.
Inserted /, swap and proc , rebooted, but / is mounted in read-only...
Still get 
INIT RESPAWNING TOO RAPIDLY....

any help ?

Already Thanking you, 

Matteo

 
