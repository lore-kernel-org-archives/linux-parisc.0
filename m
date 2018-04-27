From: Frank Scheiner <frank.scheiner@web.de>
Subject: diskless operation of HP 9000 712/80
Date: Fri, 27 Apr 2018 20:17:13 +0200
Message-ID: <b13a02ad-7050-5607-3849-553ae06ae92e@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: debian-hppa@lists.debian.org, linux-parisc <linux-parisc@vger.kernel.org>
To: dave.anglin@bell.net, Helge Deller <deller@gmx.de>,
 Jeroen Roovers <jer@gentoo.org>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
Resent-Message-ID: <emycjNvWz-B.A.Q0.Cl24aB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/b13a02ad-7050-5607-3849-553ae06ae92e@web.de

Hi all,

as a follow-up to [1], now with updated subject:

I finally evaluated the use of different values for "rsize" and "wsize" 
for the NFS mount done by `nfsmount` (from `klibc-utils`). Per default 
or maybe negotiated between NFS server and NFS client (712/80) a value 
of 131072 (Bytes) is used for the 712/80.

I started my evaluation with 8192 (first hardcoded in 
`/usr/share/initramfs-tools/scripts/nfs` and later values were provided 
via the `nfsroot` kernel command line argument (see [2] for details)) 
and guess what, I didn't get any of those:

```
[  233.808818] nfs: server 172.16.0.2 not responding, still trying
[...]
[  235.179253] nfs: server 172.16.0.2 OK
```

...messages afterwards during `apt remove -y joe` and `apt install -y joe`:

```
root@hp-712:~# time apt remove -y joe
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages will be REMOVED:
   joe
0 upgraded, 0 newly installed, 1 to remove and 4 not upgraded.
After this operation, 2,086 kB disk space will be freed.
(Reading database ... 41128 files and directories currently installed.)
Removing joe (4.6-1) ...
update-alternatives: using /usr/bin/jmacs to provide /usr/bin/editor 
(editor) in auto mode
update-alternatives: using /usr/bin/jpico to provide /usr/bin/editor 
(editor) in auto mode
update-alternatives: using /bin/nano to provide /usr/bin/editor (editor) 
in auto mode
Processing triggers for mime-support (3.60) ...

real    3m56.199s
user    1m2.678s
sys     0m43.128s

root@hp-712:~# time apt install -y joe
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following NEW packages will be installed:
   joe
0 upgraded, 1 newly installed, 0 to remove and 4 not upgraded.
Need to get 516 kB of archives.
After this operation, 2,086 kB of additional disk space will be used.
Get:1 http://ftp.ports.debian.org/debian-ports unstable/main hppa joe 
hppa 4.6-1 [516 kB]
Fetched 516 kB in 4s (144 kB/s)
Selecting previously unselected package joe.
(Reading database ... 40999 files and directories currently installed.)
Preparing to unpack .../archives/joe_4.6-1_hppa.deb ...
Unpacking joe (4.6-1) ...
Processing triggers for mime-support (3.60) ...
Setting up joe (4.6-1) ...
update-alternatives: using /usr/bin/joe to provide /usr/bin/editor 
(editor) in auto mode

real    5m26.107s
user    1m15.187s
sys     1m1.352s

root@hp-712:~# mount | grep rsize
172.16.0.2:/srv/nfs/hp-712/root on / type nfs 
(rw,relatime,vers=3,rsize=8192,wsize=8192,namlen=255,hard,nolock,proto=tcp,port=2049,timeo=7,retrans=10,sec=sys,local_lock=all,addr=172.16.0.2)
```

Also look at the timings, now "only" about 4 and 5.5 minutes 
respectively which is much better than before where it took about 22 and 
41 minutes respectively.

[1]: https://lists.debian.org/debian-hppa/2018/04/msg00007.html

[2]: https://www.kernel.org/doc/Documentation/filesystems/nfs/nfsroot.txt

I then increased the "rsize/wsize" values until the messages mentioned 
above reappeared. This happens with 32768, but 16384 is still OK. I also 
tried 24576 and 28672, but in the end the NFS mount was still done with 
16384 for both "rsize" and "wsize" in this case. Maybe these values are 
not supported by the `nfsmount` tool from `klibc-utils`. The nfs(5) 
manpage on the other hand mentions that "rsize" and "wsize" can be a 
multiple of 1024, but this is of course meant for a different tool.

BTW I didn't recognize a considerable difference in the needed time for 
the `apt install/remove` operations above between 8192 and 16384.

****

I also did some research regarding the 82596 network chip: According to 
[3] the LASI MBA includes an i82596CA and the corresponding data sheet 
from Intel ([4]) mentions that it can be configured for full-duplex 
operation (see page 3, 38 and 39). But I actually don't know what the 
firmware or the kernel driver configures by default.

[3]: https://man.openbsd.org/ie.4

[4]: https://www.intel.com/assets/pdf/general/82596ca.pdf

Cheers,
Frank
