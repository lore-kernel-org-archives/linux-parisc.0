From: Frank Scheiner <frank.scheiner@web.de>
Subject: Re: Ultra5 successful install - PGX64 issues
Date: Mon, 23 Apr 2018 15:38:59 +0200
Message-ID: <f247e23c-7858-544c-bfe7-41596f8c3569@web.de>
References: <CAFC0-0XVQUVHmM+TT4qUK_djRGx-eV+d=5FTpGyjRR40mwAv=Q@mail.gmail.com>
 <6a4e3490-dd3e-5832-43be-dba8211ce6e4@physik.fu-berlin.de>
 <dd60b1eb-595d-f208-2885-c958a5ff3a4c@blastwave.org>
 <16600fdc-6bba-1e2d-f106-560b8ea366c8@physik.fu-berlin.de>
 <9671ecea-1353-df1c-ebbd-24a5b7d3008b@oetec.com>
 <de1ac156-926a-c187-f15e-2c3da9251c82@web.de>
 <f34b2787-17e5-4fef-f028-543082ff95b6@gmx.de>
 <103f23dc-0d00-2ca1-fb98-271d1e03ad90@web.de>
 <20180420112426.3c8be653@wim.jer>
 <5f57a530-c9e8-0fbd-4eba-ba6995320c10@bell.net>
 <5902c913-93a2-bb5f-5fd6-b45bcff94158@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Helge Deller <deller@gmx.de>, debian-hppa@lists.debian.org,
 linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>, Jeroen Roovers <jer@gentoo.org>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <5902c913-93a2-bb5f-5fd6-b45bcff94158@web.de>
Resent-Message-ID: <6Kqgk0qyrGO.A.PUF.-Le3aB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/f247e23c-7858-544c-bfe7-41596f8c3569@web.de



On 04/22/2018 09:17 PM, Frank Scheiner wrote:
>> Some switches support a half-duplex back pressure form of flow control.
> 
> I'll try that now. According to the documentation my switch can create 
> back-pressure as form of flow control.

Yesterday after I activated flow control on the switch, the 712/80 got 
back after a while and finished the `apt list --upgradable` command with 
output - in between the journald of systemd crashed and restarted. 
Reissuing the same `apt [...]` command worked without problems. On the 
switch's port summary I could now also recognize that the host that acts 
as NFS server now got pause frames submitted by the switch - so the flow 
control is working.

I then tried to install `joe` and when `update-alternatives` started it 
again lost the connection to the NFS server. :-( It didn't recover from 
that - at least not during the time I waited for it - so I powered the 
712/80 down.

I thought maybe switching back to System V init might ease the load a 
little bit for the 712/80, so I upgraded the file system with a c8000 
(incl. newer patch level for the kernel) and removed systemd afterwards 
(also from initramfs).

I then ran some benchmarks without any issues in between.

Today I still have the problems described in [1] when doing `apt install 
[...]` or `apt remove [...]` but now the 712/80 recovered each time so 
far after a while, so it looks like an improvement to me. Look at the 
timings for `apt remove [...]`:

```
root@hp-712:~# time apt remove -y joe
[ 8794.150750] nfs: server 172.16.0.2 not responding, still trying
[...]
[ 8794.962227] nfs: server 172.16.0.2 not responding, still trying
[ 8795.074226] nfs: server 172.16.0.2 OK
[...]
[ 8797.271834] nfs: server 172.16.0.2 OK
[ 8802.242312] nfs: server 172.16.0.2 not responding, still trying
[...]
[ 9235.937478] nfs: server 172.16.0.2 OK
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages will be REMOVED:
   joe
0 upgraded, 0 newly installed, 1 to remove and 0 not upgraded.
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
[ 9357.992385] nfs: server 172.16.0.2 not responding, still trying
[...]
[10055.370493] nfs: server 172.16.0.2 not responding, still trying
[10055.709731] nfs: server 172.16.0.2 OK
[...]
[10057.212469] nfs: server 172.16.0.2 OK

real    22m0.853s
user    1m3.264s
sys     0m43.875s
```

...the `apt install -y joe` done beforehand took about 41 minutes. So 
the 712/80 can recover from the described problems, but package 
management should really be done from a more powerful machine, at least 
when running diskless.

[1]: https://lists.debian.org/debian-hppa/2018/04/msg00007.html

Cheers,
Frank
