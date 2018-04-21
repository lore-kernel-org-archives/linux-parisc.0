From: Helge Deller <deller@gmx.de>
Subject: Re: Ultra5 successful install - PGX64 issues
Date: Sun, 22 Apr 2018 00:17:05 +0200
Message-ID: <a0480809-8512-779d-e59c-c93775dc378a@gmx.de>
References: <CAFC0-0XVQUVHmM+TT4qUK_djRGx-eV+d=5FTpGyjRR40mwAv=Q@mail.gmail.com>
 <6a4e3490-dd3e-5832-43be-dba8211ce6e4@physik.fu-berlin.de>
 <dd60b1eb-595d-f208-2885-c958a5ff3a4c@blastwave.org>
 <16600fdc-6bba-1e2d-f106-560b8ea366c8@physik.fu-berlin.de>
 <9671ecea-1353-df1c-ebbd-24a5b7d3008b@oetec.com>
 <de1ac156-926a-c187-f15e-2c3da9251c82@web.de>
 <f34b2787-17e5-4fef-f028-543082ff95b6@gmx.de>
 <103f23dc-0d00-2ca1-fb98-271d1e03ad90@web.de>
 <2847ef55-b5b1-1867-df6a-ad5ce224abd4@gmx.de>
 <ece0086b-6c7f-4c61-b101-475f085ec120@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: debian-hppa@lists.debian.org, linux-parisc
 <linux-parisc@vger.kernel.org>, Dennis Clarke <dc@oetec.com>
To: John David Anglin <dave.anglin@bell.net>,
 Frank Scheiner <frank.scheiner@web.de>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <ece0086b-6c7f-4c61-b101-475f085ec120@bell.net>
Resent-Message-ID: <Yz2ejWws51E.A.H5C.5h72aB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/a0480809-8512-779d-e59c-c93775dc378a@gmx.de

On 21.04.2018 21:12, John David Anglin wrote:
> On 2018-04-20 2:37 AM, Helge Deller wrote:
>>> Also interesting, the kernel messages for 4.15.11, please notice the
>>> time difference between "random: crng init done" and "Key type
>>> asymmetric registered":
>> Seems to be a generic issue.
>> https://www.linuxquestions.org/questions/showthread.php?p=5803405#post5803405
>>
>> My assumption is, that the kernel waits until it has
>> enough randomness for the various encryption algorithms.

> I think this is caused by cryptomgr_test.
> It can be disabled with "cryptomgr.notests" on command line.

Did you tested this?
Unless I typed it wrong it didn't worked on my B160L:
[    0.000000] Kernel command line: root=/dev/sda5 crpytomgr.notests HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux
...
[   15.549370] workingset: timestamp_bits=14 max_order=15 bucket_order=1
[   15.688261] zbud: loaded
[   57.608154] random: crng init done
...long delay here...
[  207.522038] Key type asymmetric registered
[  207.574154] Asymmetric key parser 'x509' registered
[  207.635883] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
[  207.729718] io scheduler noop registered

Helge
