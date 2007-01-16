From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: [parisc-linux] Broken scheduler?
Date: Tue, 16 Jan 2007 13:00:22 +0100
Message-ID: <7d01f9f00701160400n4d3c3343rb864e765eb4423f9__17610.3919781328$1416624265$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi pa-ckers

On my rp3440:

top - 13:01:02 up 2 min,  1 user,  load average: 3.20, 1.16, 0.42
Tasks:  83 total,   5 running,  78 sleeping,   0 stopped,   0 zombie
Cpu0  :  0.3%us,  1.0%sy, 98.7%ni,  0.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu1  :  0.0%us,  0.0%sy,  0.0%ni, 99.7%id,  0.3%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu2  :  0.0%us,  0.0%sy,  0.0%ni,100.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Cpu3  :  0.0%us,  0.0%sy,  0.0%ni,100.0%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Mem:   4115100k total,   183696k used,  3931404k free,     2992k buffers
Swap:  2000084k total,        0k used,  2000084k free,    22860k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
  909 boinc     39  19 76736  61m 2816 R   25  1.5   0:59.73 setiathome_enha
  917 boinc     39  19 39916  25m 2784 R   25  0.6   0:31.12 setiathome_enha
  923 boinc     39  19 38760  24m 2784 R   25  0.6   0:16.42
setiathome_enha   920 boinc     39  19 40312  26m 2784 R   25  0.7
0:21.06 setiathome_enha
  926 root      15   0  2624 1132  888 R    1  0.0   0:00.24 top
    1 root      15   0  2340  752  640 S    0  0.0   0:02.35 init
    2 root      RT   0     0    0    0 S    0  0.0   0:00.00 migration/0
    3 root      34  19     0    0    0 S    0  0.0   0:00.00 ksoftirqd/0
    4 root      RT   0     0    0    0 S    0  0.0   0:00.00 watchdog/0

See how only the first CPU gets used, and how the 4 instances of
setiathome share 25% cpu each...

That's with git head (+ tausq's cache patch + kyle's sysinfo patch +
e5e5673f828623e58a401862b33173591faaeaff reverted)

HTH

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
