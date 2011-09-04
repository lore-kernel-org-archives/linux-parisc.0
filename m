From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Boot failure with 3.0.3: swapper (pid 0): Protection id trap (code 7)
Date: Sun, 4 Sep 2011 13:59:57 -0400
Message-ID: <BLU0-SMTP27D6C3B43A570182A039D3971A0@phx.gbl>
References: <201108191958.35802.eike-kernel@sf-tec.de> <BLU0-SMTP59F0DC2CD7C525D1524BA7971A0@phx.gbl> <2800939.FiF5fAcbHF@donald.sf-tec.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Cc: linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <2800939.FiF5fAcbHF@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


On 4-Sep-11, at 12:35 PM, Rolf Eike Beer wrote:

> You wrote:
>> On 19-Aug-11, at 1:58 PM, Rolf Eike Beer wrote:
>>> unwind_init: start = 0x10503000, end = 0x1053a640, entries = 14180
>>> WARNING: Out of order unwind entry! 105041f0 and 10504200
>>> WARNING: Out of order unwind entry! 10504200 and 10504210
>>> WARNING: Out of order unwind entry! 10504cf0 and 10504d00
>>> WARNING: Out of order unwind entry! 10504d00 and 10504d10
>>
>> This is fixed in current binutils.  Current binutils also fixes non
>> equivalent aliasing
>> bug that affects PA8800/PA8900 systems.
>
> The kernel.org or the GNU version?


I don't recall exactly the kernel version.  Helge made the changes.
The binutils changes for it are in 2.21 and head.  They were applied
in the latter part of 2009.

The equivalent aliasing fix is also in 2.21 and head.  However,
it wasn't in the initial 2.21 release.

Dave
--
John David Anglin	dave.anglin@bell.net



