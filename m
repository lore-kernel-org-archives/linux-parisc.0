Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 25729484B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Oct 2003 11:43:44 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali)
	id 1ACjUs-0003gA-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Oct 2003 19:43:42 +0200
Date: Thu, 23 Oct 2003 17:43:41 +0000
Message-ID: <3F96570A0000166F@ocpmta3.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] TMPFS test?
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

Hi pa,

I backport Randolph 2.6 works to 2.4.23-pre8-pa13 and test tmpfs which seems
to works:
# bdf
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sda5              1598520    991904    525416  66% /
/dev/sda3                60485     33364     23998  59% /boot
/dev/sda6               241949    131057     98400  58% /var
/dev/sda8               120963      7296    107422   7% /home
/dev/sda9              1968384   1619384    249008  87% /usr/src
/dev/sda10             1968384   1820036     48356  98% /Sources
/dev/sda11             1968384   1295444    572948  70% /Develop
/dev/sda7               120963        14    114704   1% /tmp
tmpfs                   128048         0    128048   0% /var/tmp

# ll
total 331524
drwxrwxrwx    3 root     root         4096 Oct 14 17:53 .
drwxr-xr-x    8 root     root         4096 Oct 13 09:51 ..
[...]
-rw-r--r--    1 root     root     39424270 Oct 14 13:28 vmunix-a500.s
[...]

# vi vmunix-a500.s

jso@palx2000:~$ df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sda5              1598520    991904    525416  66% /
/dev/sda3                60485     33364     23998  59% /boot
/dev/sda6               241949    131057     98400  58% /var
/dev/sda8               120963      7296    107422   7% /home
/dev/sda9              1968384   1619384    249008  87% /usr/src
/dev/sda10             1968384   1820036     48356  98% /Sources
/dev/sda11             1968384   1295444    572948  70% /Develop
/dev/sda7               120963        14    114704   1% /tmp
tmpfs                   128048     52860     75188  42% /var/tmp

# cat /proc/meminfo 
        total:    used:    free:  shared: buffers:  cached:
Mem:  262246400 86798336 175448064        0  2965504 66297856
Swap: 256892928        0 256892928
MemTotal:       256100 kB
MemFree:        171336 kB
MemShared:           0 kB
Buffers:          2896 kB
Cached:          64744 kB
SwapCached:          0 kB
Active:          52432 kB
Inactive:        19836 kB
HighTotal:           0 kB
HighFree:            0 kB
LowTotal:       256100 kB
LowFree:        171336 kB
SwapTotal:      250872 kB
SwapFree:       250872 kB

I just have a question: is it normal that /var/tmp is of about 256Mb when
I have 256Mb of phys mem and 250Mb (cfdisk did this when I requested 256Mb
:( ) of swap?

Thanks for info,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr
